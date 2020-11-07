--Select all people and show their ID and names--
SELECT customerID, firstName, lastName FROM customer;

--Select all employees they are recipients--
SELECT * FROM employee 
WHERE employee.role LIKE 'recipient';

--Show all addresses of the points and their name--
SELECT p.name, a.street, a.housNumber, a.postCode, a.city FROM point AS p
INNER JOIN address AS a 
ON a.addressID = p.fk_addressID;

--Select people who live in Vienna and Linz--
SELECT b.firstName, b.lastName, a.street, a.housNumber, a.postCode, a.city FROM address AS a
INNER JOIN customer AS b ON b.fk_addressID = a.addressID
WHERE a.city = 'Vienna' OR a.city = 'Linz';

--Select people who send mail between 01.01.2020 and 01.03.2020--
SELECT c.firstName, c.lastName, m.sendDate FROM customer AS c
INNER JOIN mail AS m
on m.fk_senderID = c.customerID
WHERE m.sendDate BETWEEN '2020-01-01' AND '2020-03-01';

--Select customer (name, date of resipient) they received mail between 01.01.2020 and 30.06.2020 and sort by date ascending--
SELECT c.firstName, c.lastName, m.deliveryDate FROM customer AS c
INNER JOIN mail AS m
ON m.fk_recipientID = c.customerID
WHERE m.deliveryDate BETWEEN '2020-01-01' AND '2020-06-30'
ORDER BY m.deliveryDate ASC;

--Select people who send mail from Bregenz and sort the date--
SELECT c.firstName, c.lastName, a.city, m.sendDate FROM mail AS m
INNER JOIN customer AS c
ON c.customerID = m.fk_senderID
INNER JOIN address AS a 
ON a.addressID = c.fk_addressID
WHERE a.city LIKE 'Bregenz'
ORDER BY m.sendDate ASC;

--Select names and addresses(street, house number and city) of recipient, delivery dates, names of delivery points and names and id of emplyees delivery--
SELECT c.firstName, c.lastName, a.street, a.housNumber, a.city, m.deliveryDate, p.name, e.employeeID, e.empLastName FROM customer AS c
INNER JOIN address AS a ON a.addressID = c.fk_addressID
INNER JOIN mail AS m ON m.fk_recipientID = c.customerID
INNER JOIN point AS p ON p.pointID = m.fk_dropOffPoint
INNER JOIN employee AS e ON e.employeeID = m.fk_eDeliverID
WHERE m.deliveryDate BETWEEN '2020-07-01' AND CURRENT_DATE
ORDER BY m.deliveryDate ASC;