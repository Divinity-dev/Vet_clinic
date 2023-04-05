SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
begin
UPDATE animals SET specie = 'unspecified';
SELECT * FROM animals;
rollback
SELECT * FROM animals;
begin
DELETE FROM animals
where date_of_birth > '2022-01-01';
select * from animals;
begin
DELETE FROM animals
where date_of_birth > '2022-01-01';
savepoint anim1;
update animals set weight_kg = weight_kg*-1;
rollback to savepoint anim1;
update animals set weight_kg = weight_kg*(-1) where weight_kg < 0;
commit;
select * from animals;
select * from animals where escape_attempts = 0;
select avg ( weight_kg) from animals;
SELECT neutered, MAX(escape_attempts) as excape_attempts FROM animals GROUP BY neutered;
SELECT specie, MIN(weight_kg) as minWeight, MAX(weight_kg) as maxWeight FROM animals GROUP BY specie;
SELECT specie, AVG(escape_attempts) as avgEscapes FROM animals WHERE date_part('year', date_of_birth) 
BETWEEN 1990 AND 2000 GROUP BY specie;