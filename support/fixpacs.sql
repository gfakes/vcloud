begin;
update rad_pacs_metadata set image_count = 1 where image_count is null;
insert into rad_pacs_metadata (rad_exam_id,external_system_id,image_count) (select id,2,1 from rad_exams where id not in (select rad_exam_id from rad_pacs_metadata));
commit;