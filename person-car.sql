create table car (
	id uuid NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

create table person (
	id uuid not NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(7) NOT NULL,
	email VARCHAR(100),
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
	car_id uuid references car (id),
	unique(car_id)
);

insert into
	person (
		id,
		first_name,
		last_name,
		gender,
		email,
		date_of_birth,
		country_of_birth
	)
values
	(
		uuid_generate_v4(),
		'Fernanda',
		'Beardon',
		'Female',
		'fernandab@is.gd',
		'1953-10-28',
		'Comoros'
	);

insert into
	person (
		id,
		first_name,
		last_name,
		gender,
		email,
		date_of_birth,
		country_of_birth
	)
values
	(
		uuid_generate_v4(),
		'Omar',
		'Colmore',
		'Male',
		null,
		'1921-04-03',
		'Finland'
	);

insert into
	person (
		id,
		first_name,
		last_name,
		gender,
		email,
		date_of_birth,
		country_of_birth
	)
values
	(
		uuid_generate_v4(),
		'John',
		'Matuschek',
		'Male',
		'john@feedburner.com',
		'1965-02-28',
		'England'
	);

insert into
	car (id, make, model, price)
values
	(
		uuid_generate_v4(),
		'Land Rover',
		'Sterling',
		'87665.38'
	);

insert into
	car (id, make, model, price)
values
	(uuid_generate_v4(), 'GMC', 'Acadia', '17662.69');