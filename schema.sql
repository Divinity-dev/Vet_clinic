create table animals (
id SERIAL PRIMARY KEY,
name VARCHAR(200) NOT NULL,
date_of_birth DATE NOT NULL,
escape_attempts INTEGER NULL,
neutered BOOLEAN NOT NULL,
weight_kg DECIMAL NOT NULL
)