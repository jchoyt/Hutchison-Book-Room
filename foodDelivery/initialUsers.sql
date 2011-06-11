insert into deliverers ( userid, lastname, firstname, email, password) values ('winfrey', 'Winfrey','Alex', 'email', '6d9528c53216a0c4e2dd2acdecd192dbe4c8cacf');
insert into deliverers ( userid, lastname, firstname, email, password) values ('romano', 'Romano','Cathy', 'email', 'f00c445b6167327b0ff9fd5334e41b3a469a824c');
insert into deliverers ( userid, lastname, firstname, email, password) values ('bevins', 'Bevins','Amy', 'email', '5eb61f980eed48eb2a791db6a7c44fcf212e8443');
insert into deliverers ( userid, lastname, firstname, email, password) values ('herr', 'Herr','Lois', 'email', 'c1ca5d7c20e33ee0c441dc5f568c0b3d895e6ede');
insert into deliverers ( userid, lastname, firstname, email, password) values ('winfrey', 'Winfrey','Alex', 'email', '6d9528c53216a0c4e2dd2acdecd192dbe4c8cacf');
insert into deliverers ( userid, lastname, firstname, email, password) values ('baker', 'Baker','Karen', 'email', '60ab90e1ecfb61c2d9705644cd062c458d7f3e5a');
insert into deliverers ( userid, lastname, firstname, email, password) values ('germroth', 'Germroth','Bonnie', 'email', 'a679cba80e5ec45624228e4685724dbdc754ee88');
insert into deliverers ( userid, lastname, firstname, email, password) values ('toothman', 'Toothman','Mike', 'email', '50fb888ae046e0e61585ecf6aa5a702731bdb4a5');
insert into deliverers ( userid, lastname, firstname, email, password) values ('eisenhart', 'Eisenhart','Cindy', 'email', 'e8c213336423d4176f41698d83f2490a165688c7');
insert into deliverers ( userid, lastname, firstname, email, password) values ('shelton', 'Shelton','Laura', 'email', '22780d9bff80b54cf7a70bb681a811c0015c5f8f');
insert into deliverers ( userid, lastname, firstname, email, password) values ('crosby', 'Crosby','Paula', 'email', '33508525b39bf6d1807300dfbf0aa9ef0bcf904c');
insert into deliverers ( userid, lastname, firstname, email, password) values ('romano', 'Romano','Cathy', 'email', 'f00c445b6167327b0ff9fd5334e41b3a469a824c');
insert into deliverers ( userid, lastname, firstname, email, password) values ('black', 'Black','Joel', 'email', '466bc8cef3e71de796ec483e212724a2c2044c68');
insert into deliverers ( userid, lastname, firstname, email, password) values ('murphy', 'Murphy','Carolyn', 'email', 'ca9290d12ce41b907521589d52120245481ab028');
insert into deliverers ( userid, lastname, firstname, email, password) values ('andriuk', 'Andriuk','Eva', 'email', 'd9f8a808522dfcde18f0df1c2c568c40a16945bf');
insert into deliverers ( userid, lastname, firstname, email, password) values ('crabtree', 'Crabtree','Leslie', 'email', 'aa6607648fcad41c3184bad127215ef4e6e2b064');
insert into deliverers ( userid, lastname, firstname, email, password) values ('germroth', 'Germroth','Bonnie', 'email', 'a679cba80e5ec45624228e4685724dbdc754ee88');
insert into deliverers ( userid, lastname, firstname, email, password) values ('rill', 'Rill','Carolyn', 'email', '3c11250710dccbb44c129cfefda527088c3cbf37');
insert into deliverers ( userid, lastname, firstname, email, password) values ('strecker', 'Strecker','Francesca', 'email', '23a5bff62d79b2c41cd4c9413f7c420fff8ee0aa');
insert into deliverers ( userid, lastname, firstname, email, password) values ('hoyt', 'Hoyt','Jeff', 'email', '96de71a5a247f1f1b87cd0d16c7486b1a3c3600c');
insert into deliverers ( userid, lastname, firstname, email, password) values ('stottlemyer', 'Stottlemyer','Elaine', 'elainestott@cox.net', '573887a291b4fcac92d900aedb237430d049c595');




insert into schedule (who, dday) values ('winfrey','2010-09-20');
insert into schedule (who, dday) values ('romano', '2010-09-21');
insert into schedule (who, dday) values ('bevins', '2010-09-22');
insert into schedule (who, dday) values ('eisenhart', '2010-09-23');
insert into schedule (who, dday) values ('toothman', '2010-09-24');


CREATE TABLE roles (
    rolename character varying(20) NOT NULL
);

insert into roles values ('user');
insert into roles values ('admin');

CREATE TABLE user_roles (
    userid character varying(20) NOT NULL,
    rolename character varying(20) NOT NULL
);

CREATE RULE enable_player AS ON INSERT TO deliverers DO INSERT INTO user_roles (userid, rolename) VALUES (new.userid, 'user'::character varying);

insert into user_roles select userid, 'user' from deliverers;

