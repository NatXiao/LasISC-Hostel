-- Insert a predefined list of selected countries into the Country table
INSERT INTO Country (name) VALUES 
('China'), 
('Poland'), 
('Switzerland'), 
('Portugal'),
('France');

-- Insert Swiss cities into the City table, linking them to the appropriate country using a subquery
INSERT INTO City (zip, name, fk_countryId) VALUES
(1000, 'Lausanne', (SELECT id FROM Country WHERE name = 'Switzerland')),
(1200, 'Geneva', (SELECT id FROM Country WHERE name = 'Switzerland')),
(2000, 'Neuchâtel', (SELECT id FROM Country WHERE name = 'Switzerland')),
(3000, 'Bern', (SELECT id FROM Country WHERE name = 'Switzerland')),
(4000, 'Basel', (SELECT id FROM Country WHERE name = 'Switzerland')),
(5000, 'Aarau', (SELECT id FROM Country WHERE name = 'Switzerland')),
(6000, 'Lucerne', (SELECT id FROM Country WHERE name = 'Switzerland')),
(8000, 'Zurich', (SELECT id FROM Country WHERE name = 'Switzerland')),
(9000, 'St. Gallen', (SELECT id FROM Country WHERE name = 'Switzerland'));

-- Generate and insert 153 random people with unique details, assigning them to random Swiss cities
DO $$
DECLARE
  city RECORD; -- Variable to store city records
  counter INT := 1; -- Global counter for unique IDs
  firstnames TEXT[] := ARRAY[
    'Anna', 'Liam', 'Noah', 'Emma', 'Sophia', 'Lucas', 'Mia', 'Ella', 'Benjamin', 'Oliver',
    'Chloe', 'Charlotte', 'Amelia', 'Elijah', 'Isabella', 'James', 'William', 'Emily', 'Grace', 'Henry'
  ]; -- First name list
  lastnames TEXT[] := ARRAY[
    'Müller', 'Schmidt', 'Meier', 'Keller', 'Weber', 'Fischer', 'Huber', 'Ziegler', 'Kunz', 'Lang',
    'Baumann', 'Brunner', 'Maurer', 'Bachmann', 'Lehmann', 'Frei', 'Moser', 'Wyss', 'Schneider', 'Wenger'
  ]; -- Last name list
  firstname TEXT;
  lastname TEXT;
BEGIN
  -- Loop to generate 153 unique people
  FOR counter IN 1..153 LOOP
    -- Randomly select a first and last name
    firstname := firstnames[FLOOR(random() * array_length(firstnames, 1) + 1)::INT];
    lastname := lastnames[FLOOR(random() * array_length(lastnames, 1) + 1)::INT];
    
    -- Fetch a random city ID from the City table (from Swiss cities)
    FOR city IN 
      SELECT id, name FROM City WHERE fk_countryId = (SELECT id FROM Country WHERE name = 'Switzerland') 
      ORDER BY random() LIMIT 1 -- Get a random city from the 9 Swiss cities
    LOOP
      -- Insert data for each person
      INSERT INTO People (firstname, lastname, birthdate, phone_number, email, fk_cityId, address)
      VALUES (
        firstname, -- Random first name
        lastname, -- Random last name
        DATE '1970-01-01' + (TRUNC(random() * 11323)::INT), -- Random birthdate (1970–2000)
        '+41' || LPAD(counter::TEXT, 9, '0'), -- Unique phone number
        LOWER(firstname || '.' || lastname || counter || '@gmail.com'), -- Unique email
        city.id, -- Real fk_cityId from the City table
        'Street ' || counter || ', ' || city.name -- Address with correct city name
      );
    END LOOP;
  END LOOP;
END $$;

-- Insert floors into the Floor table (13 floors, numbered 0–12)
DO $$
DECLARE
  i INTEGER;
BEGIN
  FOR i IN 0..12 LOOP
    INSERT INTO Floor (number) VALUES (i);
  END LOOP;
END $$;

-- Insert predefined room types with associated unit prices into the Room_Type table
INSERT INTO Room_Type (name, unit_price) VALUES
('Deluxe', 200.00),
('Standard Single', 100.00),
('Standard Double', 120.00),
('Superior', 150.00),
('Suite', 250.00);

-- Insert specific rooms into the Room table, linking to floor and room type
-- Insert 2 Suites (on floors 11 and 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_people) VALUES
(1101,12,5,3),(1201,13,5,2);

-- Insert 4 Deluxe rooms (2 rooms on floors 9, 10, 11, and 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_people) VALUES
(901,10,1,1),(1001,11,1,3),(1102,12,1,3),(1202,13,1,2);

-- Insert 10 Superior rooms (1 per floor from floors 3 to 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_people) VALUES
(301,4,4,3),(401,5,4,3),(501,6,4,2),(601,7,4,1),(701,8,4,2),(801,9,4,2),(902,10,4,2),(1002,11,4,3),(1103,12,4,2),(1203,13,4,2);

-- Insert 6 Standard Double rooms (2 rooms per floor from floors 1 to 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_people) VALUES
(101,2,3,3),(201,3,3,2),(302,4,3,3),(402,5,3,2),(502,6,3,3),(602,7,3,2);

-- Insert 6 Standard Single rooms (4 rooms per floor from floors 1 to 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_people) VALUES
(102,2,2,1),(103,2,2,2),(202,3,2,2),(203,3,2,2),(702,8,2,2),(802,9,2,2);

-- Insert predefined reservations, linking to specific people and rooms
INSERT INTO Reservation (fk_peopleId, fk_roomId, entry_date, out_date, animals, has_arrived, number_people) VALUES
(6, 5, '2023-10-01', '2023-10-05', TRUE, TRUE, 3),
(54, 10, '2023-10-02', '2023-10-06', FALSE, TRUE, 1),
(42, 15, '2023-10-03', '2023-10-07', TRUE, TRUE, 2),
(45, 20, '2023-10-04', '2023-10-08', FALSE, TRUE, 2),
(37, 5, '2023-10-05', '2023-10-09', TRUE, TRUE, 1),
(103, 10, '2023-10-06', '2023-10-10', FALSE, TRUE, 1),
(56, 15, '2023-10-07', '2023-10-11', TRUE, TRUE, 2),
(77, 20, '2023-10-08', '2023-10-12', FALSE, TRUE, 1),
(88, 25, '2023-10-09', '2023-10-13', TRUE, TRUE, 2),
(100, 28, '2023-10-10', '2023-10-14', FALSE, FALSE, 2);

-- Insert 17 employees with specific details into the Employee table
INSERT INTO Employee (fk_peopleId, iban, entry_date, end_date) VALUES
(1, 'CH9300762011623852957', '2022-01-15', NULL),
(2, 'CH9300762011623876543', '2022-03-10', NULL),
(3, 'CH9300762011623987654', '2022-05-20', NULL),
(4, 'CH9300762011623098765', '2023-01-01', '2023-12-31'),
(5, 'CH9300762011623210987', '2023-06-15', NULL),
(7, 'CH9300762011623456789', '2021-02-01', NULL),
(8, 'CH9300762011623567890', '2021-04-15', NULL),
(9, 'CH9300762011623678901', '2021-06-20', NULL),
(10, 'CH9300762011623789012', '2021-08-30', NULL),
(11, 'CH9300762011623890123', '2021-10-10', NULL),
(12, 'CH9300762011623901234', '2022-02-05', NULL),
(13, 'CH9300762011624012345', '2022-03-12', NULL),
(14, 'CH9300762011624123456', '2022-04-18', NULL),
(15, 'CH9300762011624234567', '2022-05-25', NULL),
(16, 'CH9300762011624345678', '2022-07-30', NULL),
(17, 'CH9300762011624456789', '2022-09-15', NULL),
(18, 'CH9300762011624567890', '2022-11-20', NULL);

-- Define employee types
INSERT INTO Employee_Type (job) VALUES
('Cleaner of a Floor'),
('Administrative Collaborator');

-- 4 entries for Administrative Collaborators
INSERT INTO Floor_Employee (fk_floorId, fk_employeeId, fk_employee_typeId) VALUES
(1, 3, 2),
(1, 7, 2),
(1, 13, 2),
(1, 16, 2);

-- 12 entries for Cleaners of a Floor, each assigned to a different floor
INSERT INTO Floor_Employee (fk_floorId, fk_employeeId, fk_employee_typeId) VALUES
(2, 1, 1),
(3, 2, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 14, 1),
(13, 15, 1);