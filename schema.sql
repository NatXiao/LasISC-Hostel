CREATE TABLE Reservation (
  id serial primary key,
  entry_date date default current_date not null,
  out_date date not null,
  animals boolean,
  price decimal(10,2),
  is_arrived boolean,
  number_people int,
  fk_userId int,
  fk_roomId int,
  FOREIGN KEY (fk_userId) REFERENCES User (id),
  FOREIGN KEY (fk_roomId) REFERENCES Room (id)
);

CREATE TABLE Floor (
  id serial primary key,
  number int not null
);

CREATE TABLE Room (
  id serial primary key
);

CREATE TABLE Room_Type (
  id serial primary key
);

CREATE TABLE Customer (
  id serial primary key
);

CREATE TABLE Employee (
  id serial primary key
);

CREATE TABLE Employee_Type (
  id serial primary key
);









