/**
 * Eric Pacheco
 * 2/11/20
 * 
 */
--selecting all from employee table
 select
	*
from
	"Employee";
----seclting all employees where lastname is king
 select
	*
from
	"Employee"
where
	"LastName" = 'King';
---Select all albums in Album table and sort result set in descending order by title.
 select
	*
from
	"Album"
order by
	"Title" asc;
--order by a."Title" Title 
 select
	*
from
	"Album" a
order by
	a."Title" asc;
--Select first name from Customer and sort result set in ascending order by city.
 select
	"FirstName"
from
	"Customer"
order by
	"City" asc;
--Select all invoices with a billing address like “T%”.
 select
	*
from
	"Invoice"
where
	"BillingAddress" like 'T%';
--Select the name of the longest track.
 select
	"Name"
from
	"Track"
where
	"Milliseconds" = (
	select
		max("Milliseconds")
	from
		"Track");
--Find the average invoice total.
 select
	avg("Total")
from
	"Invoice";
--Find the total number of employees in each position.

--select count(distinct "Title") as position from "Employee"; 
 select
	"Title",
	count(*)
from
	"Employee"
group by
	"Title";
--Insert two new records into Genre table
 insert
	into
	"Genre" ("GenreId",
	"Name")
values ('26',
'Synth Wave'),
('27',
'Metal');
--Insert two new records into Employee table
 insert
	into
	"Employee"( "EmployeeId",
	"LastName" ,
	"FirstName" ,
	"Title" ,
	"ReportsTo" ,
	"BirthDate" ,
	"HireDate" ,
	"Address" ,
	"City" ,
	"State" ,
	"Country" ,
	"PostalCode" ,
	"Phone" ,
	"Fax" ,
	"Email" )
values ( '9',
'Pacheco',
'Eric',
'Drinks',
'1',
'1988-02-18 00:00:00',
'2002-04-01 00:00:00',
'7727B 41 Ave',
'Arlington',
'TX',
'US',
'T5K 2N1',
'+1 (951) 973-9270',
'+1 (780) 428-3457',
'eric@chinookcorp.com' ),
( '10',
'Chai',
'Sean',
'Data Base',
'1',
'1995-02-18 00:00:00',
'2002-04-01 00:00:00',
'7727B 41 Ave',
'Arlington',
'TX',
'US',
'T5K 2N1',
'+1 (898) 764-9270',
'+1 (780) 428-3457',
'sean@chinookcorp.com' );
--Insert two new records into Customer table 
 insert
	into
	public."Customer" ("CustomerId",
	"FirstName",
	"LastName",
	"Company",
	"Address",
	"City",
	"State",
	"Country",
	"PostalCode",
	"Phone",
	"Fax",
	"Email",
	"SupportRepId")
values(61,
'Eric',
'Pacheco',
'nose',
'4, Rue Milton',
'Arlington',
'TX',
'United States',
'75009',
'(951) 787-4534',
'NULL',
'eric@fun.com',
3),
(60,
'Sean',
'Chai',
'nose',
'4, Rue Milton',
'Arlington',
'TX',
'United States',
'75009',
'(878) 787-4534',
'NULL',
'sean@fun.com',
3);
--Update Aaron Mitchell in Customer table to Robert Walter
UPDATE public."Customer"
SET "FirstName"='Robert',
"LastName" = 'Walter'
WHERE "FirstName" = 'Aaron' and "LastName" ='Mitchell';

--Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE public."Artist"
SET "Name"='CCR'
WHERE "Name"='Creedence Clearwater Revival';

--Inner join
--Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT "FirstName", "LastName", "InvoiceId"  
FROM "Customer" c
INNER JOIN "Invoice" i
ON c."CustomerId" = i."CustomerId";
 
--Create an outer join that joins the customer and invoice table, 
--specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT c."CustomerId", "FirstName", "LastName", "InvoiceId", "Total"
FROM "Customer" c
FULL OUTER JOIN "Invoice" i
ON c."CustomerId" = i."CustomerId";

--Create a right join that joins album and artist specifying artist name and title.

--Create a cross join that joins album and artist and sorts by artist name in ascending order.

--Perform a self-join on the employee table, joining on the reportsto column.	
