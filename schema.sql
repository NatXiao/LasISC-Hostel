-- Table des pays, utilisée pour stocker les noms des pays. 
-- Ces pays peuvent être associés aux clients ou aux employés.
CREATE TABLE Country (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

-- Table des villes, utilisée pour stocker les informations des villes 
-- (comme le code postal et le nom) ainsi que leur association avec un pays.
CREATE TABLE City (
  id SERIAL PRIMARY KEY,
  zip INTEGER,
  name VARCHAR(50),
  fk_countryId INTEGER,
  FOREIGN KEY (fk_countryId) REFERENCES Country (id)
);

-- Table des personnes, utilisée pour stocker les informations des individus, 
-- qu'ils soient clients ou employés.
CREATE TABLE People (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  birthdate DATE,
  phone_number VARCHAR(10),
  email VARCHAR(50),
  fk_cityId INTEGER,
  adresse VARCHAR(50),
  FOREIGN KEY (fk_cityId) REFERENCES City (id)
);

-- Table des étages, utilisée pour représenter les étages d'un bâtiment 
-- où se trouvent les chambres.
CREATE TABLE Floor (
  id SERIAL PRIMARY KEY,
  number INTEGER NOT NULL
);

-- Table des types de chambres, utilisée pour définir les différentes 
-- catégories de chambres et leurs tarifs unitaires.
CREATE TABLE Room_Type (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  unit_price decimal(10, 2)
);

-- Table des chambres, utilisée pour stocker les informations des chambres, 
-- leur capacité maximale et leurs associations avec un étage et un type de chambre.
CREATE TABLE Room (
  id SERIAL PRIMARY KEY,
  number INTEGER,
  fk_floorId INTEGER,
  fk_room_typeId INTEGER,
  max_people INTEGER,
  FOREIGN KEY (fk_floorId) REFERENCES Floor (id),
  FOREIGN KEY (fk_room_typeId) REFERENCES Room_Type (id)
);

-- Table des réservations, utilisée pour enregistrer les détails 
-- des séjours des clients, y compris les dates d'entrée et de sortie, 
-- le nombre de personnes, les animaux, et la chambre réservée.
CREATE TABLE Reservation (
  id SERIAL PRIMARY KEY,
  fk_peopleId INTEGER,
  fk_roomId INTEGER,
  entry_date DATE default CURRENT_DATE NOT NULL,
  out_date DATE NOT NULL,
  animals boolean,
  price decimal(10, 2),
  is_arrived boolean,
  number_people INTEGER,
  FOREIGN KEY (fk_peopleId) REFERENCES People (id),
  FOREIGN KEY (fk_roomId) REFERENCES Room (id)
);

-- Table des employés, utilisée pour stocker les informations liées 
-- aux employés, y compris leur association avec une personne existante.
CREATE TABLE Employee (
  id SERIAL PRIMARY KEY,
  fk_peopleId INTEGER,
  iban VARCHAR(50),
  entry_date DATE,
  end_date DATE,
  FOREIGN KEY (fk_peopleId) REFERENCES People (id)
);

-- Table des types d'employés, utilisée pour définir les différentes 
-- fonctions ou métiers occupés par les employés.
CREATE TABLE Employee_Type (
  id SERIAL PRIMARY KEY,
  job VARCHAR(50)
);

-- Table des employés assignés aux étages, utilisée pour enregistrer 
-- l'association entre un employé, un étage et un type de poste.
CREATE TABLE Floor_Employee (
  id SERIAL PRIMARY KEY,
  fk_floorId INTEGER,
  fk_employeeId INTEGER,
  fk_employeetypeId INTEGER,
  FOREIGN KEY (fk_floorId) REFERENCES Floor (id),
  FOREIGN KEY (fk_employeeId) REFERENCES Employee (id),
  FOREIGN KEY (fk_employeetypeId) REFERENCES Employee_Type (id)
);