PRAGMA foreign_keys = ON;

CREATE TABLE house(
    house_id INTEGER PRIMARY KEY,
    district TEXT,
    addr TEXT,
    bedrooms INTEGER,
    price INTEGER
);

insert into house(district, addr, bedrooms, price) values ('south', '5 rose street', 4, 3000);
insert into house(district, addr, bedrooms, price) values ('north', '12 main street', 3, 2250);
insert into house(district, addr, bedrooms, price) values ('south', '5 rose street', 4, 3000);
insert into house(district, addr, bedrooms, price) values ('west', '3 nice street', 2, 1750);
insert into house(district, addr, bedrooms, price) values ('west', '10 park avenue', 4, 3500);
insert into house(district, addr, bedrooms, price) values ('south', '7 little street', 4, 3000);
insert into house(district, addr, bedrooms, price) values ('north', '8 main street', 3, 2100);

create table renter(
    renter_id INTEGER PRIMARY KEY,
    `name` TEXT,
    district TEXT,
    bedrooms INTEGER,
    rent_min INTEGER,
    rent_max INTEGER
);

insert into renter(`name`, district, bedrooms, rent_min, rent_max) values ('helen boss', 'south', 3, 2500, 3200);
insert into renter(`name`, district, bedrooms, rent_min, rent_max) values ('michael lane', 'west', 2, 1500, 2500);
insert into renter(`name`, district, bedrooms, rent_min, rent_max) values ('susan sanders', 'west', 4, 2500, 4000);
insert into renter(`name`, district, bedrooms, rent_min, rent_max) values ('tom white', 'north', 3, 2200, 2500);
insert into renter(`name`, district, bedrooms, rent_min, rent_max) values ('sofia brown', 'north', 3, 1800, 2300);

create table deal(
    deal_id INTEGER PRIMARY KEY,
    house INTEGER,
    renter INTEGER,
    `date` DATE,
    fee INTEGER,
    FOREIGN KEY (house) REFERENCES house(house_id),
    FOREIGN KEY (renter) REFERENCES renter(renter_id)
);

insert into deal(house, renter, `date`, fee) values (1, 1, '2020-01-30', 600);
insert into deal(house, renter, `date`, fee) values (2, 4, '2020-02-03', 350);
insert into deal(house, renter, `date`, fee) values (3, 5, '2020-03-12', 700);
insert into deal(house, renter, `date`, fee) values (4, 2, '2020-04-10', 450);
