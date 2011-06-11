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


