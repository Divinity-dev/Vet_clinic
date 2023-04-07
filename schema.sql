--create animals table
CREATE TABLE animals(
id INT GENERATED ALWAYS AS IDENTITY, 
name VARCHAR(250), 
date_of_birth DATE, 
escape_attempts INT, 
neutered BOOLEAN, 
weight_kg DECIMAL(5,2), PRIMARY KEY(id));
--Alter animals table
ALTER TABLE animals
ADD COLUMN specie VARCHAR(250);
--create owners table
create table owners(
id serial primary key Not  null,
full_name varchar(250) Not  null,
age int Not  null
);
--create species table
create table species(
id serial primary key Not  null,
name varchar(250) Not  null
);
--Alter animals table
ALTER TABLE animals
  DROP COLUMN specie,
  ADD COLUMN species_id int,
  Add COLUMN owner_id int,
  ADD FOREIGN KEY (species_id) REFERENCES species (id),
  ADD FOREIGN KEY (owner_id) REFERENCES owners (id);
  --create a vets table
  create table vets(
id serial primary key,
name varchar(250) not null,
age int not null,
date_of_graduation date not null);
--create specialization table to joint vets and species
create table specialization(
species_id int not null, 
vets_id int not null
)
--create a visits table 
create table visits(
animal_id int not null,
vets_id int not null,
date_of_visit date not null
)