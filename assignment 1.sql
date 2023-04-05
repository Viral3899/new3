show databases;
use assignment_1;
show tables;

Create Table products (
Code int auto_increment primary key,
Name varchar(15),
Price int(3),
Manufacturer int(2)
);
 
select * from products;
insert into products(code,name,price,Manufacturer) values 
(1,'Hard drive',240,5),
(2,'Memory',120,6),
(3,'ZIP drive',150,4),
(4,'Floppy disk',5,6),
(5,'Monitor',240,1),
(6,'DVD drive',180,2),
(7,'CD drive',90,2),
(8,'Printer',270,3),
(9,'Toner cartridge',66,3),
(10,'DVD burner',180,2);

show tables;

select * from manufactures ;
create table manufactures(
code int(2),
name varchar(15)
);

insert into manufactures (code,name) values
(1,'Sony'),
(2,'Creative Labs'),
(3,'Hewlett-Packard'),
(4,'Lomega'),
(5,'Fujitsu'),
(6,'Winchester');

select *from products;

#1. Select the names of all the products in the store
select name from products;

#2. Select the names and the prices of all the products in the store
select name, price from products ;

#3. Select the name of the products with a price less than or equal to $200
select price from products where price <200;

#4. Select all the products with a price between $60 and $120.
select price from products where price between 60 and 120;

#5. Select the name and price in cents (i.e. the price must be multiplied by 100).
select name,price,price*100 as price_in_cents from products;

#6. Compute the average price of all the products.
select avg(price) from products;


#7. Compute the average price of all products with manufacturer code equal to 2.
select avg(price) from products where manufacturer=2;

#8. Compute the number of products with a price larger than or equal to $180.
select count(price) from products where price>=180;

#9. Select the name and price of all products with a 
#price larger than or equal to $180, and sort first by
# price (in descending order), and then by name (in ascending order).
select name,price from products where price >=180 order by price desc, name asc;

#10. Select all the data from the products, including all the data for each product's manufacturer.
select*from products join manufactures 
on products.manufacturer=manufactures.code;

#11. Select the product name, price, and manufacturer name of all the products.
select products.Name,products.Price, manufactures.name as Manufacturer_name 
from products join manufactures 
on products.Manufacturer=Manufactures.code;

#12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
select avg(price), Manufactures.code 
from products join manufactures on products.manufacturer=Manufactures.code 
group by Manufacturer ;

#13. Select the average price of each manufacturer's products, showing the manufacturer's name
select avg(price), Manufactures.name 
from products join manufactures on products.manufacturer=Manufactures.code 
group by Manufacturer ;

#14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
select avg(price), Manufactures.name 
from products join manufactures on products.manufacturer=Manufactures.code 
group by Manufacturer having avg(price)>=150 ;

#15. Select the name and price of the cheapest product
select name,price from products order by  Price asc limit 1;

#16. Select the name of each manufacturer along with the name and price of its most expensive product.
select p.Name ,p.Price, m.name 
from products p join manufactures m
on p.Manufacturer=m.code order by Price desc limit 1;

#17. Add a new product: Loudspeakers, $70, manufacturer 2.
insert into products (name,Price,Manufacturer)
values ('loudspeakers',70,2);

select *from products p ;

#18. Update the name of product 8 to "Laser Printer".
update products set name='leser printer' where code=8 ;

#19. Apply a 10% discount to all products.
select price*0.90 from products p ;

#20. Apply a 10% discount to all products with a price larger than or equal to $120.
select Price, price*0.9 as discount from products having Price>=120;





