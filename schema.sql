CREATE TABLE Reservation (
  id serial primary key,
  entry_date date default current_date not null,
  out_date date not null,
  animals boolean,
  price decimal(10,2),
  is_arrived boolean,
  number_people int,
  fk_peopleId int,
  fk_roomId int,
  FOREIGN KEY (fk_peopleId) REFERENCES People (id),
  FOREIGN KEY (fk_roomId) REFERENCES Room (id)
);

CREATE TABLE Floor (
  id serial primary key,
  number int not null
);

CREATE TABLE Room (
  id serial primary key
  number int,
  max_people int,
  fk_floorId int,
  fk_room_typeId int,
  FOREIGN KEY (fk_floorId) REFERENCES Floor (id)
  FOREIGN KEY (fk_room_typeId) REFERENCES Room_Type (id)
);

CREATE TABLE Room_Type (
  id serial primary key,
  name varchar(50),
  unit_price decimal(10,2)
);

CREATE TABLE People (
  id serial primary key,
  firstname varchar(50),
  lastname varchar(50),
  birthdate date,
  phone_number varchar(10),
  email varchar(50),
  adresse varchar(50),
  fk_cityId int,
  FOREIGN KEY (fk_cityId) REFERENCES City (id)
);

CREATE TABLE Employee (
  id serial primary key
  iban varchar(50),
  entry_date date,
  end_date date,
  fk_peopleId int,
  FOREIGN KEY (fk_peopleId) REFERENCES People (id)
);

CREATE TABLE Employee_Type (
  id serial primary key,
  job_name varchar(50)
);

CREATE TABLE Floor_Employee (
  id serial primary key,
  fk_floorId int,
  fk_employeeId int,
  FOREIGN KEY (fk_floorId) REFERENCES Floor (id)
  FOREIGN KEY (fk_employeeId) REFERENCES Employee (id)
);

CREATE TABLE City (
  id serial primary key,
  zip int,
  name varchar(50),
  fk_countryId int,
  FOREIGN KEY (fk_countryId) REFERENCES Country (id)
);

CREATE TABLE Country (
  id serial primary key,
  name varchar(50)
);
