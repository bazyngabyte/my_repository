## 1.How many products are in the catalogue offered by the company?
SELECT
count(*) as 'Total of Products in Catalogue'
FROM
product
-- Ten different products are offered by the company

## 2.How many products are in stock?
SELECT 
count(*) as 'Products in stock'
FROM
product
WHERE
current_status='Stock'
-- Seven different products are in stock

## 3.Which products have never been sold?
SELECT
p.id_product as 'Unsold products'
FROM
product p
LEFT OUTER JOIN
order_placed op
ON
p.id_product=op.id_product
WHERE
op.invoice is null;
-- Products 406 and 508 are not been sell yet.

## 4.How many units been sold for each product?
SELECT
id_product,sum(quantity) as 'Units Sold'
FROM
order_placed
GROUP BY
id_product;

## 5.What is the average number of units sold of each product?
SELECT
id_product, avg(quantity) as 'avg units sold'
FROM
order_placed
GROUP BY
id_product;

## 6. Who is the top seller?
create view Top_Seller
as
SELECT
s.id_salesrep,count(*)as Quantity_Sales
FROM
sales s
GROUP BY
s.id_salesrep;
SELECT
ts.id_salesrep as top_Seller
FROM
Top_Seller ts
WHERE
ts.Quantity_Sales=(
select
max(ts.Quantity_Sales)
from
top_seller ts
);
-- Top seller Sales representative with id 221 Paolo Scatolini

## 7.List all products for which more than 120 units have been sold
SELECT
op.id_product
FROM
order_placed op
GROUP BY 
op.id_product
HAVING
sum(op.quantity)>120
-- Products 237,499 and 850 were sold up more 120 units.

## 8. Which are the customers located in Rome
SELECT
id_company,Address,city
FROM
contact_information
WHERE
city='Roma'
order by
id_company desc;
