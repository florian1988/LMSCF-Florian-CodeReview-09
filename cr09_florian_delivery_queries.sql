-- SQL queries


SELECT  postman.name,
		postman.id_postcar,
        area.area_nr,
        recipient.first_name_recipient,
        recipient.last_name_recipient
        from area
        INNER JOIN postman
        on postman.id_postman = area.id_area
        INNER join recipient
        on recipient.id_recipient = area.id_area; 

-- *********************

SELECT  count(*)
FROM sender;

-- ************************

SELECT received_mail
from pass_control
WHERE received_mail
BETWEEN '2020-01-01' and '2020-03-03';

-- ***************************

select	delivery_center.address,
        basis_center.fk_delivery_basis,
        basis_center.fk_delivery_center,
        delivery_basis.address,
        postbox.address
        from delivery_basis
        inner JOIN basis_center
        on basis_center.id_basis_center=delivery_basis.id_delivery_basis
        inner join postbox
        on postbox.id_postbox = delivery_basis.id_delivery_basis
        inner join delivery_center
        on delivery_center.id_delivery_center = delivery_basis.id_delivery_basis;

  --******************************** 

select objekt.id_objekt, objekt.fk_sender
from objekt; 

-- *****************************************

SELECT recipient.first_name_recipient,
		recipient.last_name_recipient,
        objekt.id_objekt
FROM recipient
INNER JOIN objekt
on objekt.fk_recipient = recipient.id_recipient;     


-- ********************************************


SELECT recipient.first_name_recipient,
		recipient.last_name_recipient,
        objekt.id_objekt,
        sender.first_name_sender,
        sender.last_name_sender
FROM recipient
INNER JOIN objekt
on objekt.fk_recipient = recipient.id_recipient
INNER join sender
on sender.id_sender = recipient.id_recipient;