create database pizza_project;

create table orders (
order_id int not null,
order_date date not null ,
order_time time not null ,
primary key (order_id));

create table order_details (
order_details_id int not null,
order_id int not null ,
pizza_id text not null ,
quantity int not null ,
primary key (order_details_id));


select * from order_details;
select * from orders;
select * from pizzas;
select * from pizza_types;

# operation to be performed:
/*
  1.Retrieve the total number of orders placed. 
  select count(order_id) as total_orders from orders; = 21350 

 2.Calculate the total revenue generated from pizza sales. = 817860.05
SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price),
            2)
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id  
    
-- 3. •	Identify the highest-priced pizza. =  The Greek Pizza	(35.95)
select pizza_types.name, pizzas.price from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

4.•	Identify the most common pizza size ordered. 
L	18526
M	15385
S	14137
XL	544
XXL	28
select pizzas.size,count(order_details.order_details_id) as order_count
       from
       pizzas join order_details on pizzas.pizza_id = order_details.pizza_id
       group by pizzas.size order by order_count desc;
*/
-/* 5. •	List the top 5 most ordered pizza types along with their quantities.
The Classic Deluxe Pizza	2453
The Barbecue Chicken Pizza	2432
The Hawaiian Pizza	2422
The Pepperoni Pizza	2418
The Thai Chicken Pizza	2371

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;
*/













