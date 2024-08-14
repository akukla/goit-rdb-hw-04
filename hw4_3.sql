use `goit-rdb-hw-03`;

select details.*, orders.*, customers.*, products.*, categories.*, employees.*, shippers.*, suppliers.* from order_details as details
inner join orders on details.order_id = orders.id
inner join customers on orders.customer_id = customers.id
inner join products on details.product_id = products.id
inner join categories on products.category_id = categories.id
inner join employees on orders.employee_id = employees.employee_id
inner join shippers on orders.shipper_id = shippers.id
inner join suppliers on products.supplier_id = suppliers.id
;
