alter table book add column notes text;
alter table book alter column notes set default '';
update book set notes='' where notes is null;

# changes 2015_02_12 
alter table book add column sol text default '';

