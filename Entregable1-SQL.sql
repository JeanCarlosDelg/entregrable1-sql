-- Creada la tabla de users
create table users (
	id serial primary key,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(30)
);

-- Creada la tabla de posts
create table posts (
	id serial primary key,
	title varchar(50),
	texts text,
	creator_id int references users(id)
);

-- Creada la tabla de likes
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

-- Insertar 3 usuarios
insert into users (first_name, last_name, email) values
('Jean', 'Delgado', 'jean@mail.com'),
('Reina', 'Salazar', 'reina@mail.com'),
('Jose', 'Rico', 'jose@mail.com');

-- Informacion de todos los usuarios
select * from users;  

-- Insertar 5 posts
insert into posts (title, texts, creator_id) values 
('Lorem ipsum', 'Consectetur adipiscing elit.', 3),
('Maecenas scelerisque', 'Maecenas vel semper metus.', 1),
('Quisque porttitor', 'Nunc quam orci, ultricies non.', 2),
('Pellentesque eu', 'sodales lorem, vel mollis quam.', 1),
('Nulla facilisi', 'Integer luctus faucibus risus ut gravida.', 3);

-- Informacion de todos los posts
select * from posts; 

-- Insertar 5 likes 
insert into likes (user_id, post_id) values
(1, 2),
(2, 3),
(3, 1),
(2, 5),
(3, 3);

-- Informacion de los like dados po los usuarios
select * from likes; 

-- La informacion de los posts y el usuario el que lo creo
select * from posts inner join users
on users.id = posts.creator_id;  

-- La informacion los posts y de los usuarios que le dieron likes
select * from posts inner join likes
on likes.post_id = posts.id;
