-- 1. Join the necessary tables to find the total quantity of each pizza category ordered.
-- 2.Determine the distribution of orders by hour of the day.
-- 3.Join relevant tables to find the category-wise distribution of pizzas.
-- 4.Group the orders by date and calculate the average number of pizzas ordered per day.
-- 5.Determine the top 3 most ordered pizza types based on revenue.


-- 1. Join the necessary tables to find the total quantity of each pizza category ordered.
 /* Sol: 
Classic	14888
Supreme	11987
Veggie	11649
Chicken	11050  */

select pizza_types.category , sum(order_details.quantity) as quantity from
pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id 
join order_details on order_details.pizza_id = pizzas.pizza_id 
group by pizza_types.category 
order by quantity desc;


-- 2.Determine the distribution of orders by hour of the day.
/* sol:
 11	1231
12	2520
13	2455
14	1472
15	1468
16	1920
17	2336
18	2399
19	2009
20	1642
21	1198
22	663
23	28
10	8
9	1   
*/
select hour(order_time) as hour, count(order_id) as order_count from orders
group by hour(order_time);

-- 3.Join relevant tables to find the category-wise distribution of pizzas.
/* sol: 
Chicken	6
Classic	8
Supreme	9
Veggie	9
*/
select category, count(name) from pizza_types group by category;


-- 4.Group the orders by date and calculate the average number of pizzas
-- ordered per day.
-- sol: 138
select round(avg(quantity),0) as avg_pizza_order_per_day 
from (select orders.order_date, sum(order_details.quantity) as quantity
from orders join  order_details on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity;



-- 5.Determine the top 3 most ordered pizza types based on revenue.
/* sol:
 The Thai Chicken Pizza	43434.25
The Barbecue Chicken Pizza	42768
The California Chicken Pizza	41409.5
*/
 select pizza_types.name, sum(order_details.quantity * pizzas.price) as revenue
 from pizza_types join pizzas on pizzas.pizza_type_id = pizza_types.pizza_type_id
 join order_details on order_details.pizza_id = pizzas.pizza_id 
 group by pizza_types.name order by revenue desc limit 3 ;














