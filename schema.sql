CREATE TABLE animals(
id INT GENERATED ALWAYS AS IDENTITY, 
name VARCHAR(250), 
date_of_birth DATE, 
escape_attempts INT, 
neutered BOOLEAN, 
weight_kg DECIMAL(5,2), PRIMARY KEY(id));
ALTER TABLE animals
ADD COLUMN specie VARCHAR(250);
create table owners(
id serial primary key Not  null,
full_name varchar(250) Not  null,
age int Not  null
);
create table species(
id serial primary key Not  null,
name varchar(250) Not  null
);
ALTER TABLE animals
  DROP COLUMN specie,
  ADD COLUMN species_id int,
  Add COLUMN owner_id int,
  ADD FOREIGN KEY (species_id) REFERENCES species (id),
  ADD FOREIGN KEY (owner_id) REFERENCES owners (id);