import xlwt,logging,datetime,decimal,logging

def get_date_hhmmss_style():
    return xlwt.easyxf(num_format_str='yyyy-mm-dd hh:mm:ss')

def get_date_hhmm_style():
    return xlwt.easyxf(num_format_str='yyyy-mm-dd hh:mm')

def get_date_style():
    return xlwt.easyxf(num_format_str='yyyy-mm-dd')

def get_2digit_style():
    return xlwt.easyxf(num_format_str='#,##0.00')

def default_stylings(row):
    return (generate_default_styles(row),generate_bold_styles(row),generate_default_widths(row))

def generate_styles(style,row):
    styles = []
    for element in row:
        styles.append(style)
    return styles

def generate_bold_styles(row):
    boldstyle = xlwt.easyxf('font: bold on')
    return generate_styles(boldstyle,row)
    
def generate_default_styles(row):
    style = None
    return generate_styles(style,row)

def generate_default_widths(row):
    return generate_styles(0x0d00,row)

def write_row(sheet,rowcount,row, datastyle):
    for x,element in enumerate(row):
        try:
            if datastyle[x]!=None:
                sheet.write(rowcount,x,element,datastyle[x])
                continue
        except Exception as e:
            logging.debug('caught exception: %s',repr(e))
            logging.debug('unable to format row: %s col: %s',rowcount,x)
        sheet.write(rowcount,x,element)

def column_autotype(sheet,data):
    length = len(data[0])
    for idx in range(length):
        for row in data:
            if row[idx]!=None:
                if type(row[idx])==type(datetime.datetime.now()):
                    set_sheet_col_style(sheet,idx,get_date_hhmmss_style())
                elif type(row[idx])==type(datetime.date.today()):
                    set_sheet_col_style(sheet,idx,get_date_style())
                elif type(row[idx]) in [type(float(1.0)),type(decimal.Decimal(1))]:
                    set_sheet_col_style(sheet,idx,get_2digit_style())
                break

def column_autowide(header,data):
    width = []
    x = 0
    for col in header:
        temp = [col,]
        for row in data:
            temp.append(row[x])
        colwidth = (2+len(max((str(x) for x in temp if type(x)!=type(xlwt.Formula("SUM(A1)"))),key=len)))*256
        if colwidth>(32*256):
            colwidth=24*256
        width.append(colwidth)
        x+=1
    return width

def write_xls(filename,sheetname,header,headerstyle,data,datastyle,colwidth):
    book = xlwt.Workbook()
    sheet = book.add_sheet(sheetname)
    write_row(sheet,0,header,headerstyle)
    for y,row in enumerate(data):
        write_row(sheet,y+1,row,datastyle)
    for x,extrawidth in enumerate(colwidth):
        sheet.col(x).width = extrawidth
    book.save(filename)

def test_majority_formula(row):
    formula = False
    formula_count = [x for x in row if type(x)==type(xlwt.Formula("SUM(A1)"))]
    if len(formula_count) > len(row)/2:
        formula = True
    return formula

def add_sheet(book,sheetname,header,data,style,boldformrows=False):
    datastyle, headerstyle, colwidth = style
    sheet = book.add_sheet(sheetname)
    write_row(sheet,0,header,headerstyle)
    for y,row in enumerate(data):
        if boldformrows and test_majority_formula(row):
            write_row(sheet,y+1,row,headerstyle)
        else:
            write_row(sheet,y+1,row,datastyle)
    for x,extrawidth in enumerate(colwidth):
        sheet.col(x).width = extrawidth

def write_big_xls(filename,sheets,boldformrows=False):
    book = xlwt.Workbook()
    for sheet in sheets:
        if sheet !=None:
            sheetname, header, data, style = sheet
            logging.info('writing sheet: %s',sheetname)
            add_sheet(book, sheetname, header, data, style, boldformrows)
        else:
            pass
    logging.info('attempting to write file: %s',filename)
    book.save(filename)

# data is a list of lists
def make_sheet(data,sheetname,header):
    HEADSTYLE = generate_bold_styles(header)
    DATASTYLE = map(lambda x: None, header)
    COLWIDTH =  column_autowide(header,data)
    return (sheetname, header, data, (DATASTYLE, HEADSTYLE, COLWIDTH))

# table is a list of dictionaries
def auto_make_sheet(table,name,sort=True):
    printable = []
    header = table[0].keys()
    if sort:
        header.sort()
    for row in table:
        temp = []
        for k in header:
            temp.append(row[k])
        printable.append(temp)
    sheet = make_sheet(printable,name,header)
    column_autotype(sheet,printable)
    return sheet

def set_sheet_col_style(sheet,colnum,style):
    sheet[3][0][colnum] = style

def formula(input):
    return xlwt.Formula(input)
