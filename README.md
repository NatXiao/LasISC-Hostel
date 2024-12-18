# LasISC-Hostel

## Description
This project represent a managment of one hotel (Clients, rooms, reservations, services) in a database. We are using PostgeSQL for this.
The time we have for this is 2 weeks.

## Why this choice?

We choose this topic because we found it interesting. We still find hotel that doesn't have a computerised system for the check-in or the check-out, so it would be useful for people who works on this topic, especially for small business. We want the administration to be simple and easy.

## Complexity / Particularity / Modelisation

We decide to not be further than one hotel, because we are limited in time, and we found it complex enough without a chain of hotels. We also thought about adding a restaurant or other services, but for the same reason, we agreed not to go further, except we find the time.

## Challenges
The challenge we expect to uncounter are:
  - the management of the reservation (dates, an reservation in advance), with insert and the queries.
  - the management of the time and our complexity of the project.
  - the diversity of the client (family for example)

## Metrics

Our hotel has 12 floors, with around 4 to 10 rooms each. It has 4 deluxe rooms, 50 standard single rooms, 30 standards double rooms, 10 superior rooms and 2 suites. It has 123 customers today, with 20 leaving tomorrow. We have 2 employees in charge of the cleaning of each floor, and 4 for welcoming the guests (which are represent at the floor 0).

## Interesting queries to do 

- Get all available rooms at specific dates for specific number of people
- Statistic, where do the clients come from, the percentage of no show, the different length of stay of customer
- Get the total for the check out
- Verify a person reservation

With those queries, We think we need to add an index on the reservation table on the entry_date and out_date, because we think employee will often execute a querie that use this columns (typically for get available rooms). Otherwise, we don't think the table will be big enough to need index.

## Filling the table

We think finding some random customer names will be easy to generates, and the other already has some terminology (single, double, triple, ... or standard, superior, deluxe and suites), so we don't think we will have some trouble to create it.

![LasISC Hostel diagram](https://github.com/user-attachments/assets/ad88f7c2-ad3a-4aaa-bf38-933eb0348db5)

Our schema is in NF3.

## Questions from Feedback

### 1) How can I ensure that reservation.number_people does not exceed Room.max_people?

We need to create a trigger which is activated when there is an update or an insert on the reservation table. This will take place before the update or insert events taking into account the reservation and room table. The trigger will retrieve the value of Room.max_people and ensure that the value of Reservation.number_people does not exceed it, otherwise the program will display an exception and interrupt the process.

### 2) How to model if someone is working at reception (i.e. not on a floor)

The Floor_Employee table handles this case, using foreign keys to make references to the Floor => value 0, Employee => the employee concerned and Employee_Type => the receptionist function.
