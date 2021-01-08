drop table client cascade constraint;
drop table product cascade constraint;
drop table ordered cascade constraint;
drop sequence ordered_seq cascade constraint;

create sequence ordered_seq;

create table client (
	id varchar2(20) primary key,
	pw varchar2(20) not null,
	gender varchar2(10) not null,
	age number(20) not null
);

create table product (
	productId number(10) primary key,
	productName varchar(20) not null,
	quantity number(10) not null,
	price number(30) not nul
);


create table ordered (
	orderNo number(10) primary key,
	id varchar2(20) not null,
	productId number(10) not null,
	orderedQuantity number(10) not null,
	timestamp varchar(30) not null
);


alter table ordered add foreign key (id) references client (id);
alter table ordered add foreign key (productId) references product (productId);

insert into client values ('testid', 'testpw', 'F', 30);
insert into product values (1, 'testproduct', 10, 35000);
commit;

