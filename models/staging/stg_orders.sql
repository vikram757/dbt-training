select 
-- from raw_orders
o.ORDERID  ,
	o.ORDERDATE ,
	o.SHIPDATE ,
	o.SHIPMODE,
o.ORDERCOSTPRICE,
o.ORDERSELLINGPRICE
 , o.ORDERSELLINGPRICE -o.ORDERCOSTPRICE 	 as orderprofit,
-- from raw customer
 c.CUSTOMERNAME  ,
	c.SEGMENT ,
	c.COUNTRY,

-- from raw product

p.CATEGORY  ,
p.PRODUCTNAME  ,
p.SUBCATEGORY

from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
on o.CUSTOMERID = c.CUSTOMERID
left join {{ ref('raw_product') }} as p
on o.PRODUCTID = p.PRODUCTID