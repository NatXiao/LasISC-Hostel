-- Reservation request

-- Get all available rooms at specific dates for specific number of people
SELECT r.id AS room_id, r.number AS room_number, rt.name AS room_type, rt.unit_price AS price
FROM Room r
JOIN Room_Type rt ON r.fk_room_typeId = rt.id
LEFT JOIN Reservation res ON r.id = res.fk_roomId 
    AND NOT (res.out_date <= '2024-12-20' OR res.entry_date >= DATE_ADD('2024-12-20', INTERVAL 5 DAY))
WHERE res.id IS NULL;
-- still in work

-- get the price for the reservation of one specific reservation for the check out
SELECT (re.number_people * rt.unit_price * (re.entry_date - re.out_date)) AS "Price" FROM Reservation as re
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

-- no show
SELECT id FROM Reservation as re
WHERE re.has_arrived == False and CURDATE() < re.entry_date
-- work, but still in work

-- Percentage of no show
SELECT (no_shows / total_reservations) * 100 AS no_show_percentage
FROM (
    SELECT COUNT(*) AS total_reservations, SUM(NOT has_arrived) AS no_shows
    FROM Reservation
    WHERE entry_date <= CURDATE()
)

