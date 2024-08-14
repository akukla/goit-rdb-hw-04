use `goit-rdb-hw-03`;

-- 1

select count(*) from order_details as details
inner join orders on details.order_id = orders.id
inner join customers on orders.customer_id = customers.id
inner join products on details.product_id = products.id
inner join categories on products.category_id = categories.id
inner join employees on orders.employee_id = employees.employee_id
inner join shippers on orders.shipper_id = shippers.id
inner join suppliers on products.supplier_id = suppliers.id
;

-- 2
select count(*) from order_details as details
left join orders on details.order_id = orders.id
left join customers on orders.customer_id = customers.id
left join products on details.product_id = products.id
inner join categories on products.category_id = categories.id
inner join employees on orders.employee_id = employees.employee_id
inner join shippers on orders.shipper_id = shippers.id
inner join suppliers on products.supplier_id = suppliers.id
;

-- 3
select details.*, orders.*, customers.*, products.*, categories.*, employees.*, shippers.*, suppliers.* from order_details as details
inner join orders on details.order_id = orders.id
inner join customers on orders.customer_id = customers.id
inner join products on details.product_id = products.id
inner join categories on products.category_id = categories.id
inner join employees on orders.employee_id = employees.employee_id
inner join shippers on orders.shipper_id = shippers.id
inner join suppliers on products.supplier_id = suppliers.id
where employees.employee_id > 3 and employees.employee_id <= 10
;

-- 4
select categories.name,
    count(*) as row_count,
    avg(order_details.quantity) as avg_quantity
from
    categories
inner join products on categories.id = products.category_id
inner join order_details on products.id = order_details.product_id
group by categories.name;
;

-- 5
select categories.name,
    count(*) as row_count,
    avg(order_details.quantity) as avg_quantity
from
    categories
inner join products on categories.id = products.category_id
inner join order_details on products.id = order_details.product_id
group by categories.name
having avg_quantity > 21;
;

-- 6
select categories.name,
    count(*) as row_count,
    avg(order_details.quantity) as avg_quantity
from
    categories
inner join products on categories.id = products.category_id
inner join order_details on products.id = order_details.product_id
group by categories.name
order by row_count desc
;

-- 7
select categories.name,
    count(*) as row_count,
    avg(order_details.quantity) as avg_quantity
from
    categories
inner join products on categories.id = products.category_id
inner join order_details on products.id = order_details.product_id
group by categories.name
order by row_count desc
limit 1, 4;