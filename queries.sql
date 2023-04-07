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
--Who was the last animal seen by William Tatcher?
select full_name, count(*) from owners left join animals on owners.id = animals.owner_id group by owners.full_name order by count desc limit 1;
--How many different animals did Stephanie Mendez see?
select visits.animal_id, visits.date_of_visit , animals.name from visits join vets on visits.vets_id = vets.id join animals on animals.id = visits.animal_id where visits.vets_id = vets.id and vets.name  = 'William Tatcher' order by  animal_id desc limit 1;
--List all vets and their specialties, including vets with no specialties.
select animals.name, visits.date_of_visit  from visits join vets on visits.vets_id=vets.id join animals on animals.id=visits.animal_id  where visits.vets_id = 3 and vets.name='Stephanie Mendez';
--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select vets.name, species.name as specialty from vets left join specializations on vets.id=specializations.vets_id left join species on species.id=specializations.vets_id;
--What animal has the most visits to vets?
select animals.name, visits.date_of_visit from visits join vets on visits.vets_id=vets.id join animals on animals.id=visits.animal_id where visits.vets_id = vets.id and vets.name='Stephanie Mendez' and visits.date_of_visit between '2020-04-01' and '2020-08-03';
--Who was Maisy Smith's first visit?
select animal_name,count(animal_name) as total_visit_count from (select vets.name as vets_name,animals.name as animal_name from visits full join vets on vets.id = visits.vets_id join animals on animals.id = visits.animal_id) as subby group by animal_name order by total_visit_count desc limit 1;
--Details for most recent visit: animal information, vet information, and date of visit.
select date_of_visit,animals.name from visits join vets on visits.vets_id = vets.id join animals on animals.id = visits.animal_id where vets.id = visits.vets_id and vets.name = 'Maisy Smith' order by date_of_visit asc limit 1;
--How many visits were with a vet that did not specialize in that animal's species?
select animals.id,animals.name,date_of_birth,weight_kg,neutered,escape_attempts,vets.id as vets_id,vets.name as vets_name,date_of_visit from visits join vets on visits.vets_id = vets.id join animals on animals.id = visits.animal_id order by date_of_visit desc limit 1;
--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select count(*) from visits left join animals on animals.id = visits.animal_id left join vets on vets.id = visits.vets_id where animals.species_id not in (select species_id from specialization where vets_id = vets.id);