#!/usr/bin/ruby -w
require 'rubygems'
require 'json'

config = JSON.parse(File.read('/servers/harbinger/harbinger/data-model/partition-config.json'))
partitions = config["partitions"]
sql = ""
for p in partitions
  psize = p["size"]
  tname = p["name"]
  prefix = p["name-prefix"]
  for a in (0..99)
    suffix = "%05d" % a
    beginning = 0
    beginning = (a * psize) + 1 unless a == 0
    ending = (a + 1) * psize
    sql+= "/* #{tname}_#{suffix} */
CREATE TABLE #{tname}_#{suffix} ( ) INHERITS (#{tname});
ALTER TABLE #{tname}_#{suffix} ADD CONSTRAINT #{prefix}_#{suffix}_pk PRIMARY KEY (id);
ALTER TABLE #{tname}_#{suffix} ADD CONSTRAINT #{prefix}_#{suffix}_id_check CHECK (((id >= #{beginning}) AND (id <= #{ending})));\n"
    for idx in p["indexes"]
      iname = idx["name"]
      cols = idx["columns"].join(',')
      sql+= "CREATE INDEX #{prefix}_#{suffix}_#{iname} ON #{tname}_#{suffix} USING btree (#{cols});\n"
    end
    sql+= "CREATE RULE  #{tname}_#{suffix} AS ON
INSERT TO #{tname} WHERE ( id between #{beginning} AND #{ending} )
DO INSTEAD INSERT INTO #{tname}_#{suffix} VALUES (NEW.*);\n\n"
  end
end
File.open('/servers/harbinger/harbinger/data-model/harbinger-partitions.sql','w') {|f| f << sql }
