# DML Pizza hut

# 1. Retrieve the number of orders placed
# 2. Calculate the total revenue generated from pizza sales
# 3. Identify the highest-priced pizza
# 4. Identify the most common pizza size ordered.
# 5. List the top 5 most ordered pizza types along with their quantities
#____________________________________________________________________________________

# 1. Retrieve the number of orders placed

select
count(order_id) as Total_Orders
from
orders;

# 21.350 Total Orders

# 2. Calculate the total revenue generated from pizza sales

select * from order_details;
select * from pizzas;

select
round(sum(price*quantity)) as Total_Sales
from
order_details od,pizzas p
where
od.pizza_id=p.pizza_id;

# Total Sales 817.860

# 3. Identify the highest-priced pizza

select * from pizza_types;
select * from pizzas;

select
name,price
from
pizza_types pt,pizzas p
where
pt.pizza_type_id=p.pizza_type_id
order by
price desc limit 1;

# The priciest pizza is the "The Greek Pizza" $35.95

# 4. Identify the most common pizza size ordered.

select * from pizzas;
select * from order_details;

select
size,sum(quantity) as Total_Ordered
from
pizzas p,order_details od
where
p.pizza_id=od.pizza_id
group by
size
order by
Total_ordered desc;

# The most ordered pizza size is L with 18.956.

# 5. List the top 5 most ordered pizza types along with their quantities

select * from pizza_types;
select * from order_details;
select * from pizzas;

select
name,sum(quantity) as Total_Ordered
from
pizza_types pt
join pizzas p on pt.pizza_type_id=p.pizza_type_id
join order_details od on od.pizza_id=p.pizza_id
group by
name
order by
Total_Ordered desc limit 5;

# Out of the top 5 the "Classic Deluxe Pizza" is the most ordered one with 2.453 orders.