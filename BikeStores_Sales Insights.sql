Select
ord.order_id,
concat(cus.first_name,' ',cus.last_name) as fullname,
cus.city,
cus.state,
ord.order_date,
Sum(ite.quantity) as 'total_units', 
Sum(ite.quantity * ite.list_price) as 'revenue',
pro.product_name,
cat.category_name,
sto.store_name,
Concat(sta.first_name,' ',sta.last_name) as 'Sales_Rep'

From sales.orders ord
Join sales.customers cus
on ord.customer_id = cus.customer_id
Join sales.order_items ite
on ord.order_id = ite.order_id
Join production.products pro
on ite.product_id = pro.product_id
Join production.categories cat
on pro.category_id = cat.category_id
Join sales.stores sto
on ord.store_id = sto.store_id
Join sales.staffs sta
on ord.staff_id = sta.staff_id
Group by 
	ord.order_id,
	concat(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	Concat(sta.first_name,' ',sta.last_name)