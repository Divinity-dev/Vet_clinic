--insert data into animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Devimon', '2017-05-12', 5, true, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES(' Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Boarmon', '2005-06-07', 7, true, 20.40);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Blossom', '1998-08-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Ditto', '2022-05-14', 4, true, 22);
--begin transaction
Begin
update animals set specie = 'digimon' where name like '%mon';
select * from animals;
update animals set specie = 'pokemon' where specie is null;
select * from animals;
commit
--insert into owers table
INSERT INTO owners(full_name, age)VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);
--insert into species table
INSERT INTO species(name)VALUES
('Pokemon'),
('Digimon');
UPDATE animals SET species_id = '2' WHERE name LIKE '%mon';
UPDATE animals SET species_id = '1' WHERE species_id IS NULL;
update animals set owner_id = '1' where name = 'Agumon'
update animals set owner_id = '2' where name = 'Gabumon' or name = 'Pikachu'
update animals set owner_id = '3' where name = 'Devimon' or name = 'Plantmon'
update animals set owner_id = '4' where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom'
update animals set owner_id = '5' where name = 'Angemon' or name = 'Boarmon'
--insert data into vets table
INSERT INTO vets(name, age, date_of_graduation)VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');
--insert data into specialization table
INSERT INTO specialization(species_id, vets_id)VALUES
(1, 1),
(2, 3),
(1, 3),
(2, 4);
--insert data into visits table
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(1, 1, '2020-05-24');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(1, 3, '2020-07-22');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(2, 4, '2021-02-02');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(3, 2, '2020-01-05');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(3, 2, '2020-03-08');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(3, 2, '2020-05-14');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(4, 3, '2021-05-04');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(5, 4, '2021-02-24');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(6, 2, '2019-12-21');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(6, 1, '2020-08-10');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(6, 2, '2021-04-07');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(7, 3, '2019-09-29');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(8, 4, '2020-10-03');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(8, 4, '2020-11-04');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(9, 2, '2019-01-24');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(9, 2, '2019-05-15');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(9, 2, '2020-02-27');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(9, 2, '2020-08-03');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(10, 3, '2020-05-24');
INSERT INTO visits(animal_id, vets_id, date_of_visit) VALUES(10, 1, '2021-01-11');
