-- Table for storing country names. 
-- These countries can be associated with customers or employees.
CREATE TABLE Country (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Table for storing city information (such as postal codes and names) 
-- and their association with a country.
CREATE TABLE City (
  id SERIAL PRIMARY KEY,
  zip INTEGER NOT NULL UNIQUE,
  name VARCHAR(50) NOT NULL,
  fk_countryId INTEGER NOT NULL,
  FOREIGN KEY (fk_countryId) REFERENCES Country (id)
);

-- Table for storing individual information, 
-- whether they are customers or employees.
CREATE TABLE People (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  birthdate DATE,
  phone_number VARCHAR(15) NOT NULL UNIQUE,
  email VARCHAR(64) NOT NULL UNIQUE,
  fk_cityId INTEGER,
  address VARCHAR(50),
  FOREIGN KEY (fk_cityId) REFERENCES City (id)
);

-- Table for representing floors of a building 
-- where the rooms are located.
CREATE TABLE Floor (
  id SERIAL PRIMARY KEY,
  number INTEGER NOT NULL
);

-- Table for defining different room types 
-- and their unit prices.
CREATE TABLE Room_Type (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  unit_price DECIMAL(10, 2) CHECK (unit_price > 0)
);

-- Table for storing room information, 
-- their maximum capacity, and associations with a floor and a room type.
CREATE TABLE Room (
  id SERIAL PRIMARY KEY,
  number INTEGER UNIQUE,
  fk_floorId INTEGER NOT NULL,
  fk_room_typeId INTEGER NOT NULL,
  max_people INTEGER,
  FOREIGN KEY (fk_floorId) REFERENCES Floor (id),
  FOREIGN KEY (fk_room_typeId) REFERENCES Room_Type (id)
);

-- Table for recording details of customer stays, 
-- including check-in and check-out dates, the number of people, 
-- pets, and the reserved room.
CREATE TABLE Reservation (
  id SERIAL PRIMARY KEY,
  fk_peopleId INTEGER,
  fk_roomId INTEGER,
  entry_date DATE DEFAULT CURRENT_DATE NOT NULL,
  out_date DATE NOT NULL CHECK (out_date > entry_date),
  animals BOOLEAN,
  has_arrived BOOLEAN,
  number_people INTEGER,
  FOREIGN KEY (fk_peopleId) REFERENCES People (id),
  FOREIGN KEY (fk_roomId) REFERENCES Room (id)
);

-- Table for storing employee information, 
-- including their association with an existing person.
CREATE TABLE Employee (
  id SERIAL PRIMARY KEY,
  fk_peopleId INTEGER NOT NULL,
  iban VARCHAR(34) NOT NULL,
  entry_date DATE DEFAULT CURRENT_DATE NOT NULL,
  end_date DATE CHECK (end_date > entry_date),
  FOREIGN KEY (fk_peopleId) REFERENCES People (id)
);

-- Table for defining different types of employees 
-- and their job roles.
CREATE TABLE Employee_Type (
  id SERIAL PRIMARY KEY,
  job VARCHAR(50)
);

-- Table for recording the assignment of employees to floors, 
-- including their association with a floor and a job type.
CREATE TABLE Floor_Employee (
  id SERIAL PRIMARY KEY,
  fk_floorId INTEGER NOT NULL,
  fk_employeeId INTEGER NOT NULL,
  fk_employee_typeId INTEGER,
  FOREIGN KEY (fk_floorId) REFERENCES Floor (id),
  FOREIGN KEY (fk_employeeId) REFERENCES Employee (id),
  FOREIGN KEY (fk_employee_typeId) REFERENCES Employee_Type (id)
);