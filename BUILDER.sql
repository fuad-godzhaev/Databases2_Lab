-- DROP SCHEMA "BUILDER";

CREATE SCHEMA "BUILDER" AUTHORIZATION "BUILDER";

-- DROP SEQUENCE "BUILDER".author_author_id_seq;

CREATE SEQUENCE "BUILDER".author_author_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".b2_corder_corderno_seq;

CREATE SEQUENCE "BUILDER".b2_corder_corderno_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".b2_customer_customer_id_seq;

CREATE SEQUENCE "BUILDER".b2_customer_customer_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".b2_sorder_sorderno_seq;

CREATE SEQUENCE "BUILDER".b2_sorder_sorderno_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".b2_staff_staff_no_seq;

CREATE SEQUENCE "BUILDER".b2_staff_staff_no_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".b2_supplier_supplier_id_seq;

CREATE SEQUENCE "BUILDER".b2_supplier_supplier_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".product_groups_group_id_seq;

CREATE SEQUENCE "BUILDER".product_groups_group_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".products_product_id_seq;

CREATE SEQUENCE "BUILDER".products_product_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".student_st_id_seq;

CREATE SEQUENCE "BUILDER".student_st_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE "BUILDER".subject_sb_id_seq;

CREATE SEQUENCE "BUILDER".subject_sb_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- "BUILDER".author definition

-- Drop table

-- DROP TABLE "BUILDER".author;

CREATE TABLE "BUILDER".author (
	author_id serial4 NOT NULL,
	author_name varchar(80) NOT NULL,
	author_yearofbirth numeric(4) NULL,
	CONSTRAINT author_pkey PRIMARY KEY (author_id)
);


-- "BUILDER".b2_customer definition

-- Drop table

-- DROP TABLE "BUILDER".b2_customer;

CREATE TABLE "BUILDER".b2_customer (
	customer_id serial4 NOT NULL,
	customer_name varchar(25) NOT NULL,
	customer_address varchar(80) NULL,
	CONSTRAINT b2_customer_pkey PRIMARY KEY (customer_id)
);


-- "BUILDER".b2_supplier definition

-- Drop table

-- DROP TABLE "BUILDER".b2_supplier;

CREATE TABLE "BUILDER".b2_supplier (
	supplier_id serial4 NOT NULL,
	supplier_name varchar(25) NOT NULL,
	supplier_address varchar(80) NOT NULL,
	amount_owed numeric(10, 2) NULL,
	CONSTRAINT b2_supplier_pkey PRIMARY KEY (supplier_id)
);


-- "BUILDER".book definition

-- Drop table

-- DROP TABLE "BUILDER".book;

CREATE TABLE "BUILDER".book (
	isbn varchar(10) NOT NULL,
	title varchar(80) NOT NULL,
	yearofpublication numeric(4) NULL,
	price numeric(8, 2) NOT NULL,
	CONSTRAINT book_pkey PRIMARY KEY (isbn)
);


-- "BUILDER".consumer definition

-- Drop table

-- DROP TABLE "BUILDER".consumer;

CREATE TABLE "BUILDER".consumer (
	consumerid bpchar(3) NOT NULL,
	cn_name bpchar(18) NULL,
	CONSTRAINT consumer_pkey PRIMARY KEY (consumerid)
);


-- "BUILDER".crisp_type definition

-- Drop table

-- DROP TABLE "BUILDER".crisp_type;

CREATE TABLE "BUILDER".crisp_type (
	crispkey bpchar(10) NOT NULL,
	cp_name varchar(28) NULL,
	CONSTRAINT crisp_type_pkey PRIMARY KEY (crispkey)
);


-- "BUILDER"."module" definition

-- Drop table

-- DROP TABLE "BUILDER"."module";

CREATE TABLE "BUILDER"."module" (
	mod_code varchar(8) NOT NULL,
	mod_name varchar(30) NOT NULL,
	ects int4 NULL,
	CONSTRAINT module_pkey PRIMARY KEY (mod_code)
);


-- "BUILDER".product_groups definition

-- Drop table

-- DROP TABLE "BUILDER".product_groups;

CREATE TABLE "BUILDER".product_groups (
	group_id serial4 NOT NULL,
	group_name varchar(255) NOT NULL,
	CONSTRAINT product_groups_pkey PRIMARY KEY (group_id)
);


-- "BUILDER".student definition

-- Drop table

-- DROP TABLE "BUILDER".student;

CREATE TABLE "BUILDER".student (
	st_id serial4 NOT NULL,
	st_name varchar(50) NOT NULL,
	CONSTRAINT student_pkey PRIMARY KEY (st_id)
);


-- "BUILDER".subject definition

-- Drop table

-- DROP TABLE "BUILDER".subject;

CREATE TABLE "BUILDER".subject (
	sb_id serial4 NOT NULL,
	sb_name varchar(50) NOT NULL,
	sb_syllabus varchar(255) NULL,
	CONSTRAINT subject_pkey PRIMARY KEY (sb_id)
);


-- "BUILDER".acheivement definition

-- Drop table

-- DROP TABLE "BUILDER".acheivement;

CREATE TABLE "BUILDER".acheivement (
	sb_id int4 NOT NULL,
	st_id int4 NOT NULL,
	CONSTRAINT acheivement_pkey PRIMARY KEY (sb_id, st_id),
	CONSTRAINT acheivement_sb_id_fkey FOREIGN KEY (sb_id) REFERENCES "BUILDER".subject(sb_id),
	CONSTRAINT acheivement_st_id_fkey FOREIGN KEY (st_id) REFERENCES "BUILDER".student(st_id)
);


-- "BUILDER".authors definition

-- Drop table

-- DROP TABLE "BUILDER".authors;

CREATE TABLE "BUILDER".authors (
	isbn varchar(10) NOT NULL,
	author_id int4 NOT NULL,
	CONSTRAINT authors_pkey PRIMARY KEY (isbn, author_id),
	CONSTRAINT authors_author_id_fkey FOREIGN KEY (author_id) REFERENCES "BUILDER".author(author_id),
	CONSTRAINT authors_isbn_fkey FOREIGN KEY (isbn) REFERENCES "BUILDER".book(isbn)
);


-- "BUILDER".b2_sorder definition

-- Drop table

-- DROP TABLE "BUILDER".b2_sorder;

CREATE TABLE "BUILDER".b2_sorder (
	sorderno serial4 NOT NULL,
	sorderdate date NOT NULL DEFAULT CURRENT_DATE,
	delivereddate date NULL,
	supplier_id int4 NOT NULL,
	CONSTRAINT b2_sorder_pkey PRIMARY KEY (sorderno),
	CONSTRAINT datecheck CHECK ((delivereddate > sorderdate)),
	CONSTRAINT b2_sorder_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES "BUILDER".b2_supplier(supplier_id)
);


-- "BUILDER".b2_staff definition

-- Drop table

-- DROP TABLE "BUILDER".b2_staff;

CREATE TABLE "BUILDER".b2_staff (
	staff_no serial4 NOT NULL,
	staff_name varchar(20) NOT NULL,
	staff_role varchar(10) NULL,
	reports_to int4 NULL,
	CONSTRAINT b2_staff_pkey PRIMARY KEY (staff_no),
	CONSTRAINT b2_staff_reports_to_fkey FOREIGN KEY (reports_to) REFERENCES "BUILDER".b2_staff(staff_no)
);


-- "BUILDER".b2_stock definition

-- Drop table

-- DROP TABLE "BUILDER".b2_stock;

CREATE TABLE "BUILDER".b2_stock (
	stock_code bpchar(5) NOT NULL,
	stock_description varchar(20) NOT NULL,
	unit_price numeric(10, 2) NOT NULL,
	unitcostprice numeric(10, 2) NOT NULL,
	stock_level numeric(7) NOT NULL,
	reorder_level numeric(7) NULL,
	supplier_id int4 NOT NULL,
	CONSTRAINT b2_stock_pkey PRIMARY KEY (stock_code),
	CONSTRAINT b2_stock_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES "BUILDER".b2_supplier(supplier_id)
);


-- "BUILDER".has_eaten definition

-- Drop table

-- DROP TABLE "BUILDER".has_eaten;

CREATE TABLE "BUILDER".has_eaten (
	consumerid bpchar(3) NOT NULL,
	crispkey bpchar(10) NOT NULL,
	quantity numeric(7) NULL,
	CONSTRAINT has_eaten_pkey PRIMARY KEY (crispkey, consumerid),
	CONSTRAINT has_eaten_consumerid_fkey FOREIGN KEY (consumerid) REFERENCES "BUILDER".consumer(consumerid),
	CONSTRAINT has_eaten_crispkey_fkey FOREIGN KEY (crispkey) REFERENCES "BUILDER".crisp_type(crispkey)
);


-- "BUILDER".products definition

-- Drop table

-- DROP TABLE "BUILDER".products;

CREATE TABLE "BUILDER".products (
	product_id serial4 NOT NULL,
	product_name varchar(255) NOT NULL,
	price numeric(11, 2) NULL,
	group_id int4 NOT NULL,
	CONSTRAINT products_pkey PRIMARY KEY (product_id),
	CONSTRAINT products_group_id_fkey FOREIGN KEY (group_id) REFERENCES "BUILDER".product_groups(group_id)
);


-- "BUILDER".recommends definition

-- Drop table

-- DROP TABLE "BUILDER".recommends;

CREATE TABLE "BUILDER".recommends (
	mod_code varchar(8) NOT NULL,
	isbn varchar(10) NOT NULL,
	CONSTRAINT recommends_pkey PRIMARY KEY (mod_code, isbn),
	CONSTRAINT recommends_isbn_fkey FOREIGN KEY (isbn) REFERENCES "BUILDER".book(isbn),
	CONSTRAINT recommends_mod_code_fkey FOREIGN KEY (mod_code) REFERENCES "BUILDER"."module"(mod_code)
);


-- "BUILDER".b2_corder definition

-- Drop table

-- DROP TABLE "BUILDER".b2_corder;

CREATE TABLE "BUILDER".b2_corder (
	corderno serial4 NOT NULL,
	order_date date NOT NULL DEFAULT CURRENT_DATE,
	customer_id int4 NOT NULL,
	staffpaid int4 NOT NULL,
	staffissued int4 NULL,
	CONSTRAINT b2_corder_pkey PRIMARY KEY (corderno),
	CONSTRAINT b2_corder_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "BUILDER".b2_customer(customer_id),
	CONSTRAINT b2_corder_staffissued_fkey FOREIGN KEY (staffissued) REFERENCES "BUILDER".b2_staff(staff_no),
	CONSTRAINT b2_corder_staffpaid_fkey FOREIGN KEY (staffpaid) REFERENCES "BUILDER".b2_staff(staff_no)
);


-- "BUILDER".b2_corderline definition

-- Drop table

-- DROP TABLE "BUILDER".b2_corderline;

CREATE TABLE "BUILDER".b2_corderline (
	corderno int4 NOT NULL,
	stock_code bpchar(5) NOT NULL,
	quantityrequired numeric(8) NULL,
	CONSTRAINT b2_corderline_pkey PRIMARY KEY (corderno, stock_code),
	CONSTRAINT b2_corderline_corderno_fkey FOREIGN KEY (corderno) REFERENCES "BUILDER".b2_corder(corderno),
	CONSTRAINT b2_corderline_stock_code_fkey FOREIGN KEY (stock_code) REFERENCES "BUILDER".b2_stock(stock_code)
);


-- "BUILDER".b2_sorderline definition

-- Drop table

-- DROP TABLE "BUILDER".b2_sorderline;

CREATE TABLE "BUILDER".b2_sorderline (
	sorderno int4 NOT NULL,
	stock_code bpchar(5) NOT NULL,
	stockrequired numeric(8) NULL,
	CONSTRAINT b2_sorderline_pkey PRIMARY KEY (sorderno, stock_code),
	CONSTRAINT b2_sorderline_sorderno_fkey FOREIGN KEY (sorderno) REFERENCES "BUILDER".b2_sorder(sorderno),
	CONSTRAINT b2_sorderline_stock_code_fkey FOREIGN KEY (stock_code) REFERENCES "BUILDER".b2_stock(stock_code)
);


-- "BUILDER".crispeater source

CREATE OR REPLACE VIEW "BUILDER".crispeater
AS SELECT consumer.cn_name,
    crisp_type.cp_name
   FROM consumer
     FULL JOIN has_eaten USING (consumerid)
     FULL JOIN crisp_type USING (crispkey);


-- "BUILDER".custbought source

CREATE OR REPLACE VIEW "BUILDER".custbought
AS SELECT b2_customer.customer_name,
    b2_stock.stock_description
   FROM b2_customer
     JOIN b2_corder USING (customer_id)
     JOIN b2_corderline USING (corderno)
     JOIN b2_stock USING (stock_code);


-- "BUILDER".sampletitle source

CREATE OR REPLACE VIEW "BUILDER".sampletitle
AS SELECT module.mod_name,
    book.title
   FROM book
     JOIN recommends USING (isbn)
     JOIN module USING (mod_code);



CREATE OR REPLACE FUNCTION "BUILDER".addacheivement(p_stid integer, p_sbid integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare 
	v_achid INTEGER;
begin
	insert into acheivement (st_id, sb_id)
	values(p_stid, p_sbid)
	returning sb_id
	into v_achid;
	return v_achid;
end;
$function$
;

CREATE OR REPLACE FUNCTION "BUILDER".addstudent(p_stname character varying)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare 
	v_studid INTEGER;
begin
	insert into student (st_name) 
	values(p_stname)
	returning st_id
	into v_studid;
	return v_studid;
end;
$function$
;

CREATE OR REPLACE FUNCTION "BUILDER".addsubject(p_subname character varying)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare 
	v_sbid INTEGER;
begin
	insert into subject (sb_name) 
	values(p_subname)
	returning sb_id
	into v_sbid;
	return v_sbid;
end;
$function$
;

CREATE OR REPLACE FUNCTION "BUILDER".addsubject(p_subname character varying, p_subsyllabus character varying)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
declare 
	v_sbid INTEGER;
begin
	insert into subject (sb_name, sb_syllabus) 
	values(p_subname, p_subsyllabus)
	returning sb_id
	into v_sbid;
	return v_sbid;
end;
$function$
;