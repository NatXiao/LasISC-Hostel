------------------------------------------  Reservation request

--  Get all available rooms at specific dates for specific number of people
SELECT r.id AS room_id, r.number AS room_number, rt.name AS room_type, r.max_people, rt.unit_price*5 AS total_price_5_nights
FROM Room AS r
JOIN Room_Type AS rt ON r.fk_room_typeId = rt.id
WHERE r.id NOT IN (
    SELECT res.fk_roomId
    FROM Reservation AS res
    WHERE NOT (res.out_date <= '2024-12-20' OR res.entry_date >= DATE_ADD('2024-12-20', INTERVAL '5 days')))
AND r.max_people >= 2;

--  Get the price for the reservation of one specific reservation for the check out
SELECT 'CHF ' || (res.number_people * rt.unit_price * (res.out_date - res.entry_date)) || '.-' AS "Price"
FROM Reservation AS res
JOIN Room AS r ON r.id = res.fk_roomId
JOIN Room_Type AS rt ON rt.id = r.id
JOIN People AS p ON p.id = res.fk_peopleId
WHERE p.lastname = 'Baumann' AND p.firstname = 'Chloe'

--  Verify a person reservation
SELECT r.number AS room, res.entry_date, res.out_date
FROM Reservation AS res
JOIN People AS p ON res.fk_peopleId = p.id
JOIN Room AS r ON res.fk_roomId = r.id
WHERE p.lastname = 'Schneider' AND p.firstname = 'Amelia'

------------------------------------------  Statistic

--  Where do the clients come from (city)
SELECT c.name, COUNT(p.id)
FROM People AS p
JOIN City AS c ON c.id = p.fk_cityId
GROUP BY c.name

--  Where do the clients come from (Country)
SELECT Country.name, COUNT(p.id)
FROM People AS p
JOIN City ON City.id = p.fk_cityId
JOIN Country ON Country.id = City.fk_countryId
GROUP BY Country.name

--  No show
SELECT res.id
FROM Reservation AS res
WHERE res.has_arrived = False

--  Percentage of no-show
SELECT (no_shows * 100.0/ total_reservations)::INTEGER || '%' AS no_show_percentage
FROM (
    SELECT COUNT(*) AS total_reservations, SUM(CASE WHEN NOT has_arrived THEN 1 ELSE 0 END) AS no_shows
    FROM Reservation
    WHERE entry_date <= CURRENT_DATE)