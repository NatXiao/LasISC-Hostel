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

-- Generate and insert 153 random People with unique details, assigning them to random Swiss cities
INSERT INTO People (address, birthdate, email, firstname, fk_cityId, id, lastname, phone_number) VALUES
 ('Street 1, Aarau', '1985-04-03', 'amelia.kunz1@gmail.com', 'Amelia', 6, 1, 'Kunz', '+41000000001'),
 ('Street 2, Basel', '1990-07-23', 'isabella.lehmann2@gmail.com', 'Isabella', 5, 2, 'Lehmann', '+41000000002'),
 ('Street 3, Bern', '1978-08-03', 'william.schneider3@gmail.com', 'William', 4, 3, 'Schneider', '+41000000003'),
 ('Street 4, Neuchâtel', '1997-08-16', 'james.fischer4@gmail.com', 'James', 3, 4, 'Fischer', '+41000000004'),
 ('Street 5, Bern', '1974-11-21', 'grace.frei5@gmail.com', 'Grace', 4, 5, 'Frei', '+41000000005'),
 ('Street 6, Neuchâtel', '1991-09-25', 'chloe.baumann6@gmail.com', 'Chloe', 3, 6, 'Baumann', '+41000000006'),
 ('Street 7, St. Gallen', '1992-08-24', 'anna.wyss7@gmail.com', 'Anna', 9, 7, 'Wyss', '+41000000007'),
 ('Street 8, Lucerne', '1989-09-16', 'emma.lang8@gmail.com', 'Emma', 7, 8, 'Lang', '+41000000008'),
 ('Street 9, Lucerne', '1984-10-28', 'chloe.lehmann9@gmail.com', 'Chloe', 7, 9, 'Lehmann', '+41000000009'),
 ('Street 10, Lucerne', '1975-06-29', 'noah.schneider10@gmail.com', 'Noah', 7, 10, 'Schneider', '+41000000010'),
 ('Street 11, Aarau', '1994-02-08', 'william.lang11@gmail.com', 'William', 6, 11, 'Lang', '+41000000011'),
 ('Street 12, Basel', '1974-10-22', 'emily.schneider12@gmail.com', 'Emily', 5, 12, 'Schneider', '+41000000012'),
 ('Street 13, Zurich', '1975-12-18', 'noah.maurer13@gmail.com', 'Noah', 8, 13, 'Maurer', '+41000000013'),
 ('Street 14, Aarau', '1982-10-12', 'emma.bachmann14@gmail.com', 'Emma', 6, 14, 'Bachmann', '+41000000014'),
 ('Street 15, Neuchâtel', '1971-12-23', 'mia.maurer15@gmail.com', 'Mia', 3, 15, 'Maurer', '+41000000015'),
 ('Street 16, Geneva', '1975-03-20', 'anna.baumann16@gmail.com', 'Anna', 2, 16, 'Baumann', '+41000000016'),
 ('Street 17, Neuchâtel', '1983-09-23', 'anna.keller17@gmail.com', 'Anna', 3, 17, 'Keller', '+41000000017'),
 ('Street 18, Aarau', '1994-09-30', 'mia.lehmann18@gmail.com', 'Mia', 6, 18, 'Lehmann', '+41000000018'),
 ('Street 19, Lucerne', '2000-08-02', 'oliver.lehmann19@gmail.com', 'Oliver', 7, 19, 'Lehmann', '+41000000019'),
 ('Street 20, Lausanne', '1980-12-28', 'isabella.maurer20@gmail.com', 'Isabella', 1, 20, 'Maurer', '+41000000020'),
 ('Street 21, Bern', '1993-05-10', 'elijah.ziegler21@gmail.com', 'Elijah', 4, 21, 'Ziegler', '+41000000021'),
 ('Street 22, Lausanne', '1983-09-09', 'lucas.moser22@gmail.com', 'Lucas', 1, 22, 'Moser', '+41000000022'),
 ('Street 23, Lucerne', '1987-09-28', 'elijah.wyss23@gmail.com', 'Elijah', 7, 23, 'Wyss', '+41000000023'),
 ('Street 24, Zurich', '1981-04-11', 'mia.baumann24@gmail.com', 'Mia', 8, 24, 'Baumann', '+41000000024'),
 ('Street 25, Lausanne', '1991-09-02', 'benjamin.keller25@gmail.com', 'Benjamin', 1, 25, 'Keller', '+41000000025'),
 ('Street 26, Aarau', '1978-06-15', 'elijah.lehmann26@gmail.com', 'Elijah', 6, 26, 'Lehmann', '+41000000026'),
 ('Street 27, Geneva', '1990-01-25', 'henry.brunner27@gmail.com', 'Henry', 2, 27, 'Brunner', '+41000000027'),
 ('Street 28, St. Gallen', '1977-12-30', 'isabella.müller28@gmail.com', 'Isabella', 9, 28, 'Müller', '+41000000028'),
 ('Street 29, Zurich', '1986-10-27', 'emily.kunz29@gmail.com', 'Emily', 8, 29, 'Kunz', '+41000000029'),
 ('Street 30, Basel', '1979-05-11', 'benjamin.müller30@gmail.com', 'Benjamin', 5, 30, 'Müller', '+41000000030'),
 ('Street 31, St. Gallen', '1996-10-03', 'ella.ziegler31@gmail.com', 'Ella', 9, 31, 'Ziegler', '+41000000031'),
 ('Street 32, Lausanne', '1990-01-14', 'charlotte.wyss32@gmail.com', 'Charlotte', 1, 32, 'Wyss', '+41000000032'),
 ('Street 33, Lucerne', '1998-03-16', 'charlotte.wenger33@gmail.com', 'Charlotte', 7, 33, 'Wenger', '+41000000033'),
 ('Street 34, St. Gallen', '1988-02-06', 'mia.wyss34@gmail.com', 'Mia', 9, 34, 'Wyss', '+41000000034'),
 ('Street 35, Neuchâtel', '1982-09-01', 'emma.schneider35@gmail.com', 'Emma', 3, 35, 'Schneider', '+41000000035'),
 ('Street 36, Lucerne', '1976-11-21', 'henry.ziegler36@gmail.com', 'Henry', 7, 36, 'Ziegler', '+41000000036'),
 ('Street 37, Basel', '1970-05-31', 'noah.frei37@gmail.com', 'Noah', 5, 37, 'Frei', '+41000000037'),
 ('Street 38, Geneva', '1982-07-17', 'emma.wenger38@gmail.com', 'Emma', 2, 38, 'Wenger', '+41000000038'),
 ('Street 39, Neuchâtel', '1987-04-04', 'lucas.kunz39@gmail.com', 'Lucas', 3, 39, 'Kunz', '+41000000039'),
 ('Street 40, Neuchâtel', '1986-08-02', 'noah.lehmann40@gmail.com', 'Noah', 3, 40, 'Lehmann', '+41000000040'),
 ('Street 41, Lausanne', '1980-02-28', 'ella.fischer41@gmail.com', 'Ella', 1, 41, 'Fischer', '+41000000041'),
 ('Street 42, Geneva', '1987-10-09', 'william.lang42@gmail.com', 'William', 2, 42, 'Lang', '+41000000042'),
 ('Street 43, Aarau', '1980-09-03', 'henry.huber43@gmail.com', 'Henry', 6, 43, 'Huber', '+41000000043'),
 ('Street 44, Bern', '1990-07-21', 'benjamin.wyss44@gmail.com', 'Benjamin', 4, 44, 'Wyss', '+41000000044'),
 ('Street 45, Aarau', '1990-12-22', 'anna.ziegler45@gmail.com', 'Anna', 6, 45, 'Ziegler', '+41000000045'),
 ('Street 46, Basel', '1997-01-19', 'amelia.wenger46@gmail.com', 'Amelia', 5, 46, 'Wenger', '+41000000046'),
 ('Street 47, St. Gallen', '1999-10-01', 'benjamin.brunner47@gmail.com', 'Benjamin', 9, 47, 'Brunner', '+41000000047'),
 ('Street 48, Aarau', '1982-07-24', 'benjamin.schmidt48@gmail.com', 'Benjamin', 6, 48, 'Schmidt', '+41000000048'),
 ('Street 49, Lucerne', '1973-09-27', 'sophia.moser49@gmail.com', 'Sophia', 7, 49, 'Moser', '+41000000049'),
 ('Street 50, Geneva', '1995-12-16', 'anna.schmidt50@gmail.com', 'Anna', 2, 50, 'Schmidt', '+41000000050'),
 ('Street 51, Aarau', '1988-06-02', 'isabella.schmidt51@gmail.com', 'Isabella', 6, 51, 'Schmidt', '+41000000051'),
 ('Street 52, Bern', '1999-06-13', 'emma.schmidt52@gmail.com', 'Emma', 4, 52, 'Schmidt', '+41000000052'),
 ('Street 53, Lucerne', '1973-10-16', 'emma.lehmann53@gmail.com', 'Emma', 7, 53, 'Lehmann', '+41000000053'),
 ('Street 54, St. Gallen', '1973-01-11', 'amelia.schneider54@gmail.com', 'Amelia', 9, 54, 'Schneider', '+41000000054'),
 ('Street 55, Zurich', '1980-06-08', 'james.wenger55@gmail.com', 'James', 8, 55, 'Wenger', '+41000000055'),
 ('Street 56, Zurich', '1989-12-20', 'isabella.meier56@gmail.com', 'Isabella', 8, 56, 'Meier', '+41000000056'),
 ('Street 57, Bern', '1998-09-09', 'oliver.baumann57@gmail.com', 'Oliver', 4, 57, 'Baumann', '+41000000057'),
 ('Street 58, Aarau', '2000-03-09', 'benjamin.frei58@gmail.com', 'Benjamin', 6, 58, 'Frei', '+41000000058'),
 ('Street 59, St. Gallen', '1971-08-16', 'lucas.meier59@gmail.com', 'Lucas', 9, 59, 'Meier', '+41000000059'),
 ('Street 60, St. Gallen', '1982-11-09', 'emma.fischer60@gmail.com', 'Emma', 9, 60, 'Fischer', '+41000000060'),
 ('Street 61, Bern', '1982-06-30', 'emma.kunz61@gmail.com', 'Emma', 4, 61, 'Kunz', '+41000000061'),
 ('Street 62, Neuchâtel', '1995-05-23', 'amelia.wenger62@gmail.com', 'Amelia', 3, 62, 'Wenger', '+41000000062'),
 ('Street 63, Lausanne', '1997-04-12', 'isabella.moser63@gmail.com', 'Isabella', 1, 63, 'Moser', '+41000000063'),
 ('Street 64, Aarau', '1984-12-03', 'emma.lang64@gmail.com', 'Emma', 6, 64, 'Lang', '+41000000064'),
 ('Street 65, Geneva', '1976-06-01', 'amelia.schmidt65@gmail.com', 'Amelia', 2, 65, 'Schmidt', '+41000000065'),
 ('Street 66, St. Gallen', '1988-02-14', 'sophia.meier66@gmail.com', 'Sophia', 9, 66, 'Meier', '+41000000066'),
 ('Street 67, Geneva', '1995-10-11', 'liam.fischer67@gmail.com', 'Liam', 2, 67, 'Fischer', '+41000000067'),
 ('Street 68, Bern', '1997-02-18', 'henry.moser68@gmail.com', 'Henry', 4, 68, 'Moser', '+41000000068'),
 ('Street 69, Bern', '1976-12-27', 'grace.keller69@gmail.com', 'Grace', 4, 69, 'Keller', '+41000000069'),
 ('Street 70, Bern', '1974-07-10', 'oliver.frei70@gmail.com', 'Oliver', 4, 70, 'Frei', '+41000000070'),
 ('Street 71, Bern', '1990-07-08', 'noah.bachmann71@gmail.com', 'Noah', 4, 71, 'Bachmann', '+41000000071'),
 ('Street 72, Lucerne', '1993-06-18', 'ella.maurer72@gmail.com', 'Ella', 7, 72, 'Maurer', '+41000000072'),
 ('Street 73, Aarau', '1981-05-17', 'elijah.lehmann73@gmail.com', 'Elijah', 6, 73, 'Lehmann', '+41000000073'),
 ('Street 74, Neuchâtel', '1997-10-15', 'anna.baumann74@gmail.com', 'Anna', 3, 74, 'Baumann', '+41000000074'),
 ('Street 75, Geneva', '1970-07-25', 'amelia.weber75@gmail.com', 'Amelia', 2, 75, 'Weber', '+41000000075'),
 ('Street 76, Neuchâtel', '1986-07-24', 'william.lang76@gmail.com', 'William', 3, 76, 'Lang', '+41000000076'),
 ('Street 77, Lucerne', '1979-03-21', 'anna.ziegler77@gmail.com', 'Anna', 7, 77, 'Ziegler', '+41000000077'),
 ('Street 78, Aarau', '1994-09-26', 'henry.wenger78@gmail.com', 'Henry', 6, 78, 'Wenger', '+41000000078'),
 ('Street 79, Bern', '1973-02-04', 'amelia.bachmann79@gmail.com', 'Amelia', 4, 79, 'Bachmann', '+41000000079'),
 ('Street 80, Aarau', '1979-10-19', 'liam.keller80@gmail.com', 'Liam', 6, 80, 'Keller', '+41000000080'),
 ('Street 81, Zurich', '1982-02-19', 'anna.ziegler81@gmail.com', 'Anna', 8, 81, 'Ziegler', '+41000000081'),
 ('Street 82, Geneva', '1975-12-10', 'oliver.müller82@gmail.com', 'Oliver', 2, 82, 'Müller', '+41000000082'),
 ('Street 83, Geneva', '1989-03-23', 'emily.fischer83@gmail.com', 'Emily', 2, 83, 'Fischer', '+41000000083'),
 ('Street 84, Lucerne', '1998-05-08', 'ella.weber84@gmail.com', 'Ella', 7, 84, 'Weber', '+41000000084'),
 ('Street 85, Basel', '1974-01-25', 'noah.bachmann85@gmail.com', 'Noah', 5, 85, 'Bachmann', '+41000000085'),
 ('Street 86, Bern', '1987-08-26', 'anna.meier86@gmail.com', 'Anna', 4, 86, 'Meier', '+41000000086'),
 ('Street 87, Bern', '1984-09-17', 'oliver.weber87@gmail.com', 'Oliver', 4, 87, 'Weber', '+41000000087'),
 ('Street 88, Bern', '1988-10-13', 'william.kunz88@gmail.com', 'William', 4, 88, 'Kunz', '+41000000088'),
 ('Street 89, Aarau', '1980-04-21', 'emily.huber89@gmail.com', 'Emily', 6, 89, 'Huber', '+41000000089'),
 ('Street 90, Zurich', '1982-01-28', 'emily.fischer90@gmail.com', 'Emily', 8, 90, 'Fischer', '+41000000090'),
 ('Street 91, Lausanne', '1979-07-16', 'william.müller91@gmail.com', 'William', 1, 91, 'Müller', '+41000000091'),
 ('Street 92, Basel', '1975-03-31', 'william.fischer92@gmail.com', 'William', 5, 92, 'Fischer', '+41000000092'),
 ('Street 93, Lucerne', '1978-08-28', 'emily.moser93@gmail.com', 'Emily', 7, 93, 'Moser', '+41000000093'),
 ('Street 94, Zurich', '1971-06-09', 'elijah.müller94@gmail.com', 'Elijah', 8, 94, 'Müller', '+41000000094'),
 ('Street 95, St. Gallen', '1978-04-19', 'william.wenger95@gmail.com', 'William', 9, 95, 'Wenger', '+41000000095'),
 ('Street 96, Lausanne', '1999-01-20', 'elijah.schmidt96@gmail.com', 'Elijah', 1, 96, 'Schmidt', '+41000000096'),
 ('Street 97, Neuchâtel', '1991-11-08', 'ella.lehmann97@gmail.com', 'Ella', 3, 97, 'Lehmann', '+41000000097'),
 ('Street 98, Basel', '1988-02-27', 'henry.ziegler98@gmail.com', 'Henry', 5, 98, 'Ziegler', '+41000000098'),
 ('Street 99, Basel', '1979-08-09', 'william.schneider99@gmail.com', 'William', 5, 99, 'Schneider', '+41000000099'),
 ('Street 100, Basel', '1985-09-13', 'ella.baumann100@gmail.com', 'Ella', 5, 100, 'Baumann', '+41000000100'),
 ('Street 101, Geneva', '1998-09-13', 'chloe.frei101@gmail.com', 'Chloe', 2, 101, 'Frei', '+41000000101'),
 ('Street 102, Geneva', '1975-06-18', 'charlotte.huber102@gmail.com', 'Charlotte', 2, 102, 'Huber', '+41000000102'),
 ('Street 103, Neuchâtel', '1985-04-26', 'sophia.lehmann103@gmail.com', 'Sophia', 3, 103, 'Lehmann', '+41000000103'),
 ('Street 104, Geneva', '1996-05-10', 'noah.wyss104@gmail.com', 'Noah', 2, 104, 'Wyss', '+41000000104'),
 ('Street 105, Aarau', '1987-07-09', 'sophia.moser105@gmail.com', 'Sophia', 6, 105, 'Moser', '+41000000105'),
 ('Street 106, Basel', '1999-02-24', 'isabella.müller106@gmail.com', 'Isabella', 5, 106, 'Müller', '+41000000106'),
 ('Street 107, Lausanne', '1970-10-09', 'mia.wenger107@gmail.com', 'Mia', 1, 107, 'Wenger', '+41000000107'),
 ('Street 108, Basel', '1997-05-13', 'emily.meier108@gmail.com', 'Emily', 5, 108, 'Meier', '+41000000108'),
 ('Street 109, Lausanne', '1978-10-18', 'henry.bachmann109@gmail.com', 'Henry', 1, 109, 'Bachmann', '+41000000109'),
 ('Street 110, Zurich', '1982-12-04', 'grace.huber110@gmail.com', 'Grace', 8, 110, 'Huber', '+41000000110'),
 ('Street 111, Aarau', '1996-09-05', 'ella.brunner111@gmail.com', 'Ella', 6, 111, 'Brunner', '+41000000111'),
 ('Street 112, Zurich', '1990-07-02', 'oliver.baumann112@gmail.com', 'Oliver', 8, 112, 'Baumann', '+41000000112'),
 ('Street 113, Zurich', '1976-05-18', 'anna.schneider113@gmail.com', 'Anna', 8, 113, 'Schneider', '+41000000113'),
 ('Street 114, Geneva', '1987-02-26', 'mia.lehmann114@gmail.com', 'Mia', 2, 114, 'Lehmann', '+41000000114'),
 ('Street 115, Zurich', '1987-11-07', 'isabella.brunner115@gmail.com', 'Isabella', 8, 115, 'Brunner', '+41000000115'),
 ('Street 116, Lucerne', '1999-04-19', 'charlotte.schmidt116@gmail.com', 'Charlotte', 7, 116, 'Schmidt', '+41000000116'),
 ('Street 117, Lucerne', '1972-09-19', 'emma.baumann117@gmail.com', 'Emma', 7, 117, 'Baumann', '+41000000117'),
 ('Street 118, Lausanne', '1975-12-09', 'amelia.wenger118@gmail.com', 'Amelia', 1, 118, 'Wenger', '+41000000118'),
 ('Street 119, Neuchâtel', '1980-02-26', 'sophia.lehmann119@gmail.com', 'Sophia', 3, 119, 'Lehmann', '+41000000119'),
 ('Street 120, Bern', '1974-06-01', 'emma.huber120@gmail.com', 'Emma', 4, 120, 'Huber', '+41000000120'),
 ('Street 121, Geneva', '1990-04-02', 'emma.huber121@gmail.com', 'Emma', 2, 121, 'Huber', '+41000000121'),
 ('Street 122, St. Gallen', '1988-03-14', 'benjamin.müller122@gmail.com', 'Benjamin', 9, 122, 'Müller', '+41000000122'),
 ('Street 123, Lausanne', '1998-06-14', 'elijah.moser123@gmail.com', 'Elijah', 1, 123, 'Moser', '+41000000123'),
 ('Street 124, St. Gallen', '1981-03-31', 'oliver.meier124@gmail.com', 'Oliver', 9, 124, 'Meier', '+41000000124'),
 ('Street 125, Geneva', '1995-03-26', 'anna.brunner125@gmail.com', 'Anna', 2, 125, 'Brunner', '+41000000125'),
 ('Street 126, Lausanne', '1987-10-18', 'chloe.lang126@gmail.com', 'Chloe', 1, 126, 'Lang', '+41000000126'),
 ('Street 127, St. Gallen', '1984-06-05', 'elijah.bachmann127@gmail.com', 'Elijah', 9, 127, 'Bachmann', '+41000000127'),
 ('Street 128, Zurich', '1975-02-11', 'william.brunner128@gmail.com', 'William', 8, 128, 'Brunner', '+41000000128'),
 ('Street 129, Basel', '1980-12-16', 'mia.keller129@gmail.com', 'Mia', 5, 129, 'Keller', '+41000000129'),
 ('Street 130, Aarau', '1996-10-05', 'oliver.wyss130@gmail.com', 'Oliver', 6, 130, 'Wyss', '+41000000130'),
 ('Street 131, Lausanne', '1988-12-26', 'isabella.huber131@gmail.com', 'Isabella', 1, 131, 'Huber', '+41000000131'),
 ('Street 132, St. Gallen', '1987-03-21', 'sophia.huber132@gmail.com', 'Sophia', 9, 132, 'Huber', '+41000000132'),
 ('Street 133, St. Gallen', '1974-11-23', 'james.huber133@gmail.com', 'James', 9, 133, 'Huber', '+41000000133'),
 ('Street 134, Aarau', '1974-09-29', 'isabella.kunz134@gmail.com', 'Isabella', 6, 134, 'Kunz', '+41000000134'),
 ('Street 135, St. Gallen', '1991-11-14', 'elijah.kunz135@gmail.com', 'Elijah', 9, 135, 'Kunz', '+41000000135'),
 ('Street 136, Zurich', '1998-11-03', 'emma.weber136@gmail.com', 'Emma', 8, 136, 'Weber', '+41000000136'),
 ('Street 137, Bern', '1983-03-27', 'amelia.schmidt137@gmail.com', 'Amelia', 4, 137, 'Schmidt', '+41000000137'),
 ('Street 138, Geneva', '1979-05-31', 'mia.baumann138@gmail.com', 'Mia', 2, 138, 'Baumann', '+41000000138'),
 ('Street 139, Aarau', '1995-07-07', 'isabella.weber139@gmail.com', 'Isabella', 6, 139, 'Weber', '+41000000139'),
 ('Street 140, Geneva', '1981-02-19', 'amelia.ziegler140@gmail.com', 'Amelia', 2, 140, 'Ziegler', '+41000000140'),
 ('Street 141, Geneva', '1971-12-22', 'william.lang141@gmail.com', 'William', 2, 141, 'Lang', '+41000000141'),
 ('Street 142, Geneva', '1992-08-14', 'emily.baumann142@gmail.com', 'Emily', 2, 142, 'Baumann', '+41000000142'),
 ('Street 143, Neuchâtel', '1980-05-29', 'amelia.frei143@gmail.com', 'Amelia', 3, 143, 'Frei', '+41000000143'),
 ('Street 144, Aarau', '1999-11-23', 'isabella.müller144@gmail.com', 'Isabella', 6, 144, 'Müller', '+41000000144'),
 ('Street 145, Bern', '1999-12-30', 'noah.lang145@gmail.com', 'Noah', 4, 145, 'Lang', '+41000000145'),
 ('Street 146, Lausanne', '1996-06-26', 'elijah.maurer146@gmail.com', 'Elijah', 1, 146, 'Maurer', '+41000000146'),
 ('Street 147, Zurich', '1993-08-13', 'mia.ziegler147@gmail.com', 'Mia', 8, 147, 'Ziegler', '+41000000147'),
 ('Street 148, Lausanne', '1977-02-22', 'grace.weber148@gmail.com', 'Grace', 1, 148, 'Weber', '+41000000148'),
 ('Street 149, Lausanne', '2000-03-02', 'chloe.moser149@gmail.com', 'Chloe', 1, 149, 'Moser', '+41000000149'),
 ('Street 150, Aarau', '2000-07-14', 'oliver.wenger150@gmail.com', 'Oliver', 6, 150, 'Wenger', '+41000000150'),
 ('Street 151, Lausanne', '1986-03-31', 'william.baumann151@gmail.com', 'William', 1, 151, 'Baumann', '+41000000151'),
 ('Street 152, Zurich', '1992-03-13', 'noah.huber152@gmail.com', 'Noah', 8, 152, 'Huber', '+41000000152'),
 ('Street 153, St. Gallen', '1995-09-05', 'lucas.bachmann153@gmail.com', 'Lucas', 9, 153, 'Bachmann', '+41000000153');


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
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_People) VALUES
(1101,12,5,3),(1201,13,5,2);

-- Insert 4 Deluxe rooms (2 rooms on floors 9, 10, 11, and 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_People) VALUES
(901,10,1,1),(1001,11,1,3),(1102,12,1,3),(1202,13,1,2);

-- Insert 10 Superior rooms (1 per floor from floors 3 to 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_People) VALUES
(301,4,4,3),(401,5,4,3),(501,6,4,2),(601,7,4,1),(701,8,4,2),(801,9,4,2),(902,10,4,2),(1002,11,4,3),(1103,12,4,2),(1203,13,4,2);

-- Insert 6 Standard Double rooms (2 rooms per floor from floors 1 to 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_People) VALUES
(101,2,3,3),(201,3,3,2),(302,4,3,3),(402,5,3,2),(502,6,3,3),(602,7,3,2);

-- Insert 6 Standard Single rooms (4 rooms per floor from floors 1 to 12)
INSERT INTO Room(number, fk_floorId, fk_room_typeId, max_People) VALUES
(102,2,2,1),(103,2,2,2),(202,3,2,2),(203,3,2,2),(702,8,2,2),(802,9,2,2);

-- Insert predefined reservations, linking to specific People and rooms
INSERT INTO Reservation (fk_PeopleId, fk_roomId, entry_date, out_date, animals, has_arrived, number_People) VALUES
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
INSERT INTO Employee (fk_PeopleId, iban, entry_date, end_date) VALUES
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