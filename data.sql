-- List of selected countries
INSERT INTO Country (name) VALUES 
('China'), 
('Poland'), 
('Switzerland'), 
('Portugal'),
('France');

-- Inserting Swiss cities into the City table
INSERT INTO City (zip, name, fk_countryId) VALUES
(1000, 'Lausanne', (SELECT id FROM Country WHERE name = 'Switzerland')),
(1200, 'Geneva', (SELECT id FROM Country WHERE name = 'Switzerland')),
(2000, 'Neuchâtel', (SELECT id FROM Country WHERE name = 'Switzerland')),
(3000, 'Bern', (SELECT id FROM Country WHERE name = 'Switzerland')),
(4000, 'Basel', (SELECT id FROM Country WHERE name = 'Switzerland')),
(5000, 'Aarau', (SELECT id FROM Country WHERE name = 'Switzerland')),
(6000, 'Lucerne', (SELECT id FROM Country WHERE name = 'Switzerland')),
(8000, 'Zurich', (SELECT id FROM Country WHERE name = 'Switzerland')),
(9000, 'St. Gallen', (SELECT id FROM Country WHERE name = 'Switzerland')),