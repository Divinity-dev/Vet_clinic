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