-- Reservation request

-- Get all available rooms at specific dates for specific number of people
SELECT count(re.fk_roomId) FROM Reservation AS re
JOIN Room AS r ON r.id = re.fk_roomId
WHERE r.fk_room_typeId == 1
GROUP BY 
HAVING CURDATE() > out
-- still in work

-- get the price for the reservation of one specific people for the check out
SELECT (rt.unit_price * (re.entry_date - re.out_date)) AS "Price" FROM Reservation as re
JOIN Room AS r ON r.id = re.fk_roomId
JOIN Room_Type AS rt ON rt.id = r.id
JOIN People AS p ON p.id = re.fk_peopleId
WHERE p.lastname = 'Landry' AND p.firstname = 'Natasha'
-- normally works

--Verify a person reservation
SELECT re.entry_date, re.out_date FROM Reservation as re
JOIN People AS p ON p.id = re.fk_peopleId
WHERE p.lastname = 'Landry' AND p.firstname = 'Natasha'

--Statistic

--Where do the clients come from (city)
SELECT City.name, count(p.id) FROM People as p
JOIN City ON City.id = p.fk_cityId
GROUP BY City.name
-- normally works

--Where do the clients come from (Country)
SELECT Country.name, count(p.id) FROM People as p
JOIN City ON City.id = p.fk_cityId
JOIN Country ON Country.id = City.fk_countryId
GROUP BY Country.name
-- normally works

-- Percentage of no show
SELECT id FROM Reservation as re
WHERE re.has_arrived == False and CURDATE() < re.entry_date
-- still in work

