CREATE DATABASE test;

-- SHOW DATABASES

USE test;
create table addresses(
	id int,
    house_number int,
    city varchar(20),
    postcode varchar(7)
);

create table people(
	id int,
    first_name varchar(20),
    last_name varchar(20),
    address_id int
);

create table pets(
	id int,
    name varchar(20),
    species varchar(20),
    owner_id int
);
-- -- show tables

describe addresses;

alter table addresses
add primary key(id);

-- alter table addresses
-- drop primary key;

-- alter table people
-- add primary key(id);
describe people;


-- ALTER TABLE people
-- ADD CONSTRAINT FK_PeopleAddress
-- FOREIGN KEY (address_id) REFERENCES addresses(id);

-- alter table people
-- drop foreign key FK_PeopleAddress

select * from pets;

alter table pets
add constraint u_species unique (species);

alter table pets
drop index u_species;

select * from pets;
alter table pets change `species` `animals_type` varchar(20);