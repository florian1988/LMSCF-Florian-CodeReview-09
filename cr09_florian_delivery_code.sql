
-- create tables 


CREATE table sender( id_sender int AUTO_INCREMENT, PRIMARY key(id_sender),
                    first_name_sender varchar(50),
                    last_name_sender varchar(50),
                    address_sender varchar (100),
                    fk_zip_sender int,
                    fk_area_sender int);



CREATE table recipient( id_recipient int AUTO_INCREMENT, PRIMARY key(id_recipient),
                    first_name_recipient varchar(50),
                    last_name_recipient varchar(50),
                    address_recipient varchar (100),
                    fk_zip_recipient int,
                    fk_area_recipient int);


CREATE table letter( id_letter int AUTO_INCREMENT, PRIMARY key(id_letter)
					weight smallint);


CREATE table package( id_package int AUTO_INCREMENT, PRIMARY key(id_package),
                   wight smallint);


CREATE table local_post_counter( id_local_post_counter int AUTO_INCREMENT, PRIMARY key(id_local_post_counter),
                    address varchar (100),
                    tel_number int,
                    received_mail timestamp);


CREATE table postbox( id_postbox int AUTO_INCREMENT, PRIMARY key(id_postbox),
					 address varchar (100),
                     fk_sender int,
                     FOREIGN key(fk_sender) REFERENCES sender(id_sender));


CREATE table postman( id_postman int AUTO_INCREMENT, PRIMARY key(id_postman),
					 name varchar (50),
                     id_postcar smallint,
                     fk_recipient int,
                     FOREIGN key(fk_recipient) REFERENCES recipient(id_recipient));



CREATE table delivery_basis( id_delivery_basis int AUTO_INCREMENT, PRIMARY key(id_delivery_basis),
                    address varchar (100),
                    tel_number int,
                    received_mail timestamp,
                    fk_postbox int,
                    fk_local_post_counter int,
                    fk_pick_up_location int,
                    fk_postman int,
                    foreign key (fk_postbox) references postbox(id_postbox),
                    foreign key (fk_local_post_counter) references local_post_counter(id_local_post_counter),
                    foreign key (fk_pick_up_location) references pick_up_location(id_pick_up_location),
                    foreign key (fk_postman) references postman(id_postman));



CREATE table central_delivery_center( id_central_delivery_center int AUTO_INCREMENT, PRIMARY key(id_central_delivery_center),
                    address varchar (100),
                    tel_number int,
                    received_mail timestamp,
                    fk_delivery_basis int,
                    foreign key (fk_delivery_basis) references delivery_basis(id_delivery_basis));


CREATE table ZIP_register( id_ZIP_register int AUTO_INCREMENT, PRIMARY key(id_ZIP_register),
                    fk_central_delivery_center int,
                    fk_sender int,
                    fk_recipient int,
                    fk_letter int,
                    foreign key (fk_central_delivery_center) references central_delivery_center(id_central_delivery_center),
                    foreign key (fk_sender) references sender(id_sender),
                    foreign key (fk_recipient) references recipient(id_recipient),
                    foreign key (fk_letter) references letter(id_letter));



-- rows of data for database

-- sender
insert into sender(first_name_sender, last_name_sender, address_sender, ZIP_sender)
values(
	'michael',
    'fischer',
    'irgendwogasse_12',
    4515
    
);
insert into sender(first_name_sender, last_name_sender, address_sender, ZIP_sender)
values(
	'berta',
    'meier',
    'wogasse_12',
    8915
    
);
insert into sender(first_name_sender, last_name_sender, address_sender, ZIP_sender)
values(
	'alm',
    'öhie',
    'berg_12',
    6354
    
);
insert into sender(first_name_sender, last_name_sender, address_sender, ZIP_sender)
values(
	'heidi',
    'öhie',
    'berg_16',
    3824
    
);

-- recipient

insert into recipient(first_name_recipient, last_name_recipient, address_recipient, ZIP_recipient)
values(
     'mozart',
    'fredl',
    'salzgasse_12',
    4675
    
);
insert into recipient(first_name_recipient, last_name_recipient, address_recipient, ZIP_recipient)
values(
     'amadeus',
    'özi',
    'burggasse_15',
    8989
    
);
insert into recipient(first_name_recipient, last_name_recipient, address_recipient, ZIP_recipient)
values(
     'fade',
    'gschicht',
    'dasganze_122',
    6337
    
);
insert into recipient(first_name_recipient, last_name_recipient, address_recipient, ZIP_recipient)
values(
     'zeug',
    'austauschen',
    'dodagasse_136',
    1234
    
);

-- pick_up_location

insert into pick_up_location(address, locker_nr)
values(
    'salzg_12',
    46
    
);
insert into pick_up_location(address, locker_nr)
values(
    'burgg_15',
    89
    
);
insert into pick_up_location(address, locker_nr)
values(
    'dasg_122',
    37
    
);
insert into pick_up_location(address, locker_nr)
values(
    'dodag_136',
    34
    
);

-- local_post_counter

insert into local_post_counter(address, tel_number)
values(
    'salzg_12',
    46564552
    
);
insert into local_post_counter(address, tel_number)
values(
    'burgg_15',
    89452453
    
);
insert into local_post_counter(address, tel_number)
values(
    'dasg_122',
    37453453
    
);
insert into local_post_counter(address, tel_number)
values(
    'dodag_136',
    34453453
    
);



