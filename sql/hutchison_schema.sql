CREATE TABLE genres (
    id serial,
    code text,
    name text
);

alter table genres add constraint genres_pkey primary key (id);

INSERT INTO genres ( code, name ) values ('F', 'Fiction');
INSERT INTO genres ( code, name ) values ('NF', 'Non Fiction');
INSERT INTO genres ( code, name ) values ('FF', 'Folklore and Fairytales');
INSERT INTO genres ( code, name ) values ('RT', 'Reading Theatre');

CREATE TABLE colors (
    id serial,
    color text
);

alter table colors add constraint colors_pkey primary key (id);

insert into colors ( color ) values ('Dark Blue');
insert into colors ( color ) values ('Green');
insert into colors ( color ) values ('Light Blue');
insert into colors ( color ) values ('Lime');
insert into colors ( color ) values ('Neon Red');
insert into colors ( color ) values ('Orange');
insert into colors ( color ) values ('Purple');
insert into colors ( color ) values ('Red');
insert into colors ( color ) values ('Yellow');

CREATE TABLE book (
    id serial,
    title text NOT NULL,
    author text DEFAULT '' NOT NULL,
    genre int DEFAULT 1 NOT NULL,
    color int,
    box text NOT NULL,
    copy_count integer,
    minlevel int,
    maxlevel int,
    word_count text,
    keyword text
);

alter table book add constraint genre_fkey foreign key (genre) references genres (id);
alter table book add constraint color_fkey foreign key (color) references colors (id);

CREATE TABLE LATTICEGROUP(LATTICEGROUPID VARCHAR(50) NOT NULL PRIMARY KEY,LATTICEGROUPNAME VARCHAR(50),LATTICEGROUPDESC VARCHAR(200),CONSTRAINT SYS_CT_46 CHECK(LATTICEGROUP.LATTICEGROUPID IS NOT NULL));
CREATE TABLE LABEL_SQL(TABLE_NAME VARCHAR(200) NOT NULL PRIMARY KEY,SQL_CLAUSE VARCHAR(2000));
CREATE TABLE GRAPHS(GRAPHID INTEGER NOT NULL,USERID VARCHAR(100) NOT NULL,PRIMARY KEY(GRAPHID,USERID));
CREATE TABLE PEOPLE(EMAIL VARCHAR(100) NOT NULL PRIMARY KEY,PEOPLETYPEID INTEGER,PASSWORD VARCHAR(100),LATTICEGROUPID VARCHAR(50),FIRSTNAME VARCHAR(50),LASTNAME VARCHAR(75),COMPANY VARCHAR(100),DEPARTMENT VARCHAR(50),ADDRESS VARCHAR(300),CITY VARCHAR(50),STATE VARCHAR(50),ZIP VARCHAR(10),COUNTRY VARCHAR(50),VALIDATIONCODE VARCHAR(12),VALIDATED VARCHAR(1),CONSTRAINT SYS_FK_50 FOREIGN KEY(LATTICEGROUPID) REFERENCES LATTICEGROUP(LATTICEGROUPID),CONSTRAINT SYS_CT_51 CHECK(PEOPLE.EMAIL IS NOT NULL));
CREATE TABLE BROADCAST_TARGETS(NAME VARCHAR(100) NOT NULL,LOCAL_DATASOURCE VARCHAR(100),REMOTE_DATASOURCE VARCHAR(100),REMOTE_URL VARCHAR(255));
INSERT INTO LATTICEGROUP VALUES('Public','Public','All users can see the data in this COI - it is the most open, and also the most risky');
INSERT INTO PEOPLE VALUES('admin@mitre.org',3,'XPERsFUdQRgrVI/si2Fv1ROAJ3X4BnOredragQ==','Public',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'still fake','Y');
INSERT INTO BROADCAST_TARGETS VALUES('Local Admin','db_admin.props','db_admin.props','http://127.0.0.1:8080/saife');
