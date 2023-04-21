-- insert into products(
-- productCode,
-- productName,
-- productPrice ,
-- productAmount ,
-- productDescription ,
-- productStatus
-- ) values
-- ("P01","nike air",10,100,"chat luong",1),
-- ("P02","nike air1",10,100,"chat luong",1),
-- ("P03","nike air2",10,100,"chat luong",1),
-- ("P04","nike air3",10,100,"chat luong",1),
-- ("P05","nike air4",10,100,"chat luong",1),
-- ("P06","nike air5",10,100,"chat luong",1),
-- ("P07","nike air6",10,100,"chat luong",1),
-- ("P08","nike air7",10,100,"chat luong",1),
-- ("P09","nike air8",10,100,"chat luong",1),
-- ("P010","nike air9",10,100,"chat luong",1);


create unique index idx_code on products(productCode);
create view product_view as select productCode, productName, productPrice, productStatus from products;
select * from product_view;
 CREATE OR REPLACE VIEW product_view as select id from products;
 drop view product_view;
 
 DELIMITER //

CREATE PROCEDURE insertProduct(
proCode varchar(10),
proName varchar(100),
proPrice real,
proAmount int,
proDescription varchar(100) ,
proStatus tinyint)

BEGIN

insert into products(
productCode,
productName,
productPrice ,
productAmount ,
productDescription ,
productStatus
) 
values
(proCode,proName,proPrice,ProAmount,proDescription,proStatus);

END //

DELIMITER ;

call insertProduct("P011","nike air 99",100,1000,"chat luong",0);
select * from products;



DELIMITER //
create procedure update_product(idpro int, proname varchar(100))
begin
update products
set productName = proname where idpro;
end;//
DELIMITER ;

call update_product(1,"adidas PO1");

DELIMITER //
create procedure delete_product(idpro int)
begin
delete from products
where id = idpro;
end;//
DELIMITER ;
  
  call delete_product(10)
