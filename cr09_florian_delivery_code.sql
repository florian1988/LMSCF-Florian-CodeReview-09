
-- create tables 


CREATE table sender( id_sender int AUTO_INCREMENT, PRIMARY key(id_sender),
                    first_name_sender varchar(50),
                    last_name_sender varchar(50),
                    address_sender varchar (100),
                    fk_fk_zip_sender, fk_area_sender int,
                    fk_area_sender int);

alter table sender add foreign key(fk_fk_zip_sender, fk_area_sender)
REFERENCES zip(id_zip);


alter table sender add foreign key(fk_area_sender)
REFERENCES area(id_area);

CREATE table recipient( id_recipient int AUTO_INCREMENT, PRIMARY key(id_recipient),
                    first_name_recipient varchar(50),
                    last_name_recipient varchar(50),
                    address_recipient varchar (100),
                    fk_fk_zip_recipient, fk_area_recipient int,
                    fk_area_recipient int);

alter table recipient add foreign key(fk_fk_zip_recipient, fk_area_recipient)
REFERENCES zip(id_zip);


alter table recipient add foreign key(fk_area_recipient)
REFERENCES area(id_area);


CREATE table letter( id_letter int AUTO_INCREMENT, PRIMARY key(id_letter),
					weight smallint);


CREATE table package( id_package int AUTO_INCREMENT, PRIMARY key(id_package),
                   wight smallint);


CREATE table fk_kind_of_objekt( id_fk_kind_of_objekt int AUTO_INCREMENT, PRIMARY key(id_fk_kind_of_objekt),
                    fk_letter int,
                    quantity_letter int,
                    fk_package int,
                    quantity_package int,
                    foreign key (fk_letter) references letter(id_letter),
                    foreign key (fk_package) references package(id_package));





CREATE table objekt( id_objekt int AUTO_INCREMENT, PRIMARY key(id_objekt),                   
                    fk_sender int,
                    fk_recipient int,
                    fk_fk_kind_of_objekt int,
                    foreign key (fk_sender) references sender(id_sender),
                    foreign key (fk_recipient) references recipient(id_recipient),
                    foreign key (fk_fk_kind_of_objekt) references fk_kind_of_objekt(id_fk_kind_of_objekt));


CREATE table postbox( id_postbox int AUTO_INCREMENT, PRIMARY key(id_postbox),
					 address varchar (100));


CREATE table postman( id_postman int AUTO_INCREMENT, PRIMARY key(id_postman),
					 name varchar (50),
                     id_postcar smallint);



CREATE table delivery_basis( id_delivery_basis int AUTO_INCREMENT, PRIMARY key(id_delivery_basis),
                    address varchar (100),
                    tel_number int,                    
                    fk_postbox int,
                    fk_zip int,
                    fk_area int,
                    foreign key (fk_postbox) references postbox(id_postbox),
                    foreign key (fk_zip) references zip(id_zip),
                    foreign key (fk_area) references area(id_area));


CREATE table pass_control( id_pass_control int AUTO_INCREMENT, PRIMARY key(id_pass_control),
					received_mail timestamp,
					fk_delivery_basis int,
					fk_objekt int,
					foreign key (fk_delivery_basis) references delivery_basis(id_delivery_basis),
					foreign key (fk_objekt) references objekt(id_objekt));

CREATE table basis_center( id_basis_center int AUTO_INCREMENT, PRIMARY key(id_basis_center),
					fk_delivery_basis int,
					fk_delivery_center int,
					foreign key (fk_delivery_basis) references delivery_basis(id_delivery_basis),
					foreign key (fk_delivery_center) references delivery_center(id_delivery_center));



CREATE table delivery_center( id_delivery_center int AUTO_INCREMENT, PRIMARY key(id_delivery_center),
                    address varchar (100),
                    tel_number int);


CREATE table zip( id_zip int AUTO_INCREMENT, PRIMARY key(id_zip),
                    country varchar(50),
                    zip_nr int);


CREATE table area( id_area int AUTO_INCREMENT, PRIMARY key(id_area),
                    fk_postman int,
                    area_nr int,
                    foreign key (fk_postman) references postman(id_postman));


-- rows of data for database

-- sender
insert into sender(first_name_sender, last_name_sender, address_sender, fk_zip_sender, fk_area_sender)
values(
	'michael',
    'fischer',
    'irgendwogasse_12',
    7,
    4
    
);
insert into sender(first_name_sender, last_name_sender, address_sender, fk_zip_sender, fk_area_sender)
values(
	'berta',
    'meier',
    'wogasse_12',
    5,
    5
    
);
insert into sender(first_name_sender, last_name_sender, address_sender, fk_zip_sender, fk_area_sender)
values(
	'alm',
    'öhie',
    'berg_12',
    2,
    1
    
);
insert into sender(first_name_sender, last_name_sender, address_sender, fk_zip_sender, fk_area_sender)
values(
	'heidi',
    'öhie',
    'berg_16',
    2,
    3
    
);

-- recipient

insert into recipient(first_name_recipient, last_name_recipient, address_recipient, fk_zip_recipient, fk_area_recipient)
values(
     'mozart',
    'fredl',
    'salzgasse_12',
    3,
    1
    
);
insert into recipient(first_name_recipient, last_name_recipient, address_recipient, fk_zip_recipient, fk_area_recipient)
values(
     'amadeus',
    'özi',
    'burggasse_15',
    2,
    2
    
);
insert into recipient(first_name_recipient, last_name_recipient, address_recipient, fk_zip_recipient, fk_area_recipient)
values(
     'fade',
    'gschicht',
    'dasganze_122',
   5,
   5
    
);
insert into recipient(first_name_recipient, last_name_recipient, address_recipient, fk_zip_recipient, fk_area_recipient)
values(
     'zeug',
    'austauschen',
    'dodagasse_136',
    6,
    6
    
);


-- letter

insert into letter(weight)
values(
    50    
);
insert into letter(weight)
values(
    100    
);
insert into letter(weight)
values(
    150    
);
insert into letter(weight)
values(
    200    
);

-- package
insert into package(wight)
values(
    500    
);
insert into package(wight)
values(
    1000   
);
insert into package(wight)
values(
    1500    
);
insert into package(wight)
values(
    2000    
);


-- kind of objekt

insert into fk_kind_of_objekt(fk_letter, quantity_letter, fk_package, quantity_package)
values(
    2,
    1,
    1,
    1

);
insert into fk_kind_of_objekt(fk_letter, quantity_letter, fk_package, quantity_package)
values(
    1,
    1,
    3,
    1

);
insert into fk_kind_of_objekt(fk_letter, quantity_letter, fk_package, quantity_package)
values(
    2,
    1,
    1,
    1

);
insert into fk_kind_of_objekt(fk_letter, quantity_letter, fk_package, quantity_package)
values(
    4,
    1,
    2,
    1

);


-- delivery_center

insert into delivery_center(address, tel_number)
values(
    'fuchshaufen 12',
    45673233

);insert into delivery_center(address, tel_number)
values(
    'scheibenkleister 12',
    14785236

);


-- postbox

insert into postbox(address)
values(
    'rasen 12'
);
insert into postbox(address)
values(
    'wiese 12'
);
insert into postbox(address)
values(
    'laub 12'
);
insert into postbox(address)
values(
    'wald 12'
);

-- postman

insert into postman(name, id_postcar)
values(
    'fritz',
    12
);
insert into postman(name, id_postcar)
values(
    'manfred',
    3
);
insert into postman(name, id_postcar)
values(
    'ferdl',
    21
);
insert into postman(name, id_postcar)
values(
    'fungus',
    5
);


-- zip 

insert into zip(zip_nr, country)
values(
    3975,
    'hintertupfing'
);
insert into zip(zip_nr, country)
values(
    3913,
    'hintertupfing'
);
insert into zip(zip_nr, country)
values(
    3924,
    'hintertupfing'
);
insert into zip(zip_nr, country)
values(
    3995,
    'hintertupfing'
);
insert into zip(zip_nr, country)
values(
    4075,
    'almwiesn'
);
insert into zip(zip_nr, country)
values(
    4075,
    'almwiesn'
);
insert into zip(zip_nr, country)
values(
    4075,
    'almwiesn'
);


-- pass_control

insert into pass_control(fk_delivery_basis, fk_objekt)
values(
    1,
    5
);insert into pass_control(fk_delivery_basis, fk_objekt)
values(
    2,
    8
);insert into pass_control(fk_delivery_basis, fk_objekt)
values(
    3,
    6
);insert into pass_control(fk_delivery_basis, fk_objekt)
values(
    4,
    7
);

-- area

insert into area(area_nr, fk_postman)
values(
    407,
    2
);insert into area(area_nr, fk_postman)
values(
    402,
    1
);insert into area(area_nr, fk_postman)
values(
    460,
    2
);insert into area(area_nr, fk_postman)
values(
    370,
    4
);insert into area(area_nr, fk_postman)
values(
    350,
    3
);insert into area(area_nr, fk_postman)
values(
    307,
    4
);


-- object

insert into objekt(fk_sender, fk_recipient, fk_kind_of_objekt)
values(
    1,
    4,
    1
);insert into objekt(fk_sender, fk_recipient, fk_kind_of_objekt)
values(
    4,
    1,
    4
);insert into objekt(fk_sender, fk_recipient, fk_kind_of_objekt)
values(
    3,
    2,
    3
);insert into objekt(fk_sender, fk_recipient, fk_kind_of_objekt)
values(
    2,
    3,
    2
);


-- delivery_basis

insert into delivery_basis(address, tel_number, fk_postbox, fk_zip, fk_area)
values(
    'hinternhaufen 1',
    323465444,
    1,
    2,
    1
);insert into delivery_basis(address, tel_number, fk_postbox, fk_zip, fk_area)
values(
    'tante 1',
    3234231444,
    2,
    4,
    3
);insert into delivery_basis(address, tel_number, fk_postbox, fk_zip, fk_area)
values(
    'haupt 1',
    678965444,
    3,
    5,
    4
);insert into delivery_basis(address, tel_number, fk_postbox, fk_zip, fk_area)
values(
    'paltz 1',
    3234354677,
    4,
    7,
    6
);

-- basis_center

insert into basis_center(fk_delivery_basis, fk_delivery_center)
values(
   1,
   1
);insert into basis_center(fk_delivery_basis, fk_delivery_center)
values(
   3,
   1
);insert into basis_center(fk_delivery_basis, fk_delivery_center)
values(
   2,
   2
);insert into basis_center(fk_delivery_basis, fk_delivery_center)
values(
   4,
   2
);




