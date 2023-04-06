--query animals table 
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
--begin transaction
begin
UPDATE animals SET specie = 'unspecified';
SELECT * FROM animals;
rollback
SELECT * FROM animals;
--begin transaction
begin
DELETE FROM animals
where date_of_birth > '2022-01-01';
select * from animals;
--begin transaction
begin
DELETE FROM animals
where date_of_birth > '2022-01-01';
savepoint anim1;
update animals set weight_kg = weight_kg*-1;
rollback to savepoint anim1;
update animals set weight_kg = weight_kg*(-1) where weight_kg < 0;
commit;
--query animals table
select * from animals;
select * from animals where escape_attempts = 0;
select avg ( weight_kg) from animals;
SELECT neutered, MAX(escape_attempts) as excape_attempts FROM animals GROUP BY neutered;
SELECT specie, MIN(weight_kg) as minWeight, MAX(weight_kg) as maxWeight FROM animals GROUP BY specie;
SELECT specie, AVG(escape_attempts) as avgEscapes FROM animals WHERE date_part('year', date_of_birth) 
BETWEEN 1990 AND 2000 GROUP BY specie;
SELECT name FROM animals JOIN owners ON owners.id=animals.owner_id WHERE owner_id='4';
SELECT animals.name FROM animals JOIN species ON species.id=animals.species_id WHERE species_id='1';
SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON owners.id=animals.owner_id;
SELECT species.name, COUNT(species.name) FROM animals JOIN species ON species.id=animals.species_id GROUP BY species.name;
SELECT species.name, species.id FROM species JOIN animals ON species.id=animals.species_id JOIN owners ON animals.owner_id = owners.id WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
SELECT * FROM animals JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT full_name, COUNT(*) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT DESC LIMIT 1;