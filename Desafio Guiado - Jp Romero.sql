/* Requerimiento 1
Crear una base de datos llamada blog */
CREATE DATABASE blog;
-- \c blog
/*
Requerimiento 2
Crear las tablas indicadas de acuerdo al modelo de datos.
*/
/*
CREATE TABLE usuario(
id SERIAL PRIMARY KEY,
email VARCHAR(40) NOT NULL UNIQUE
);
*/
CREATE TABLE usuario(
id SERIAL,
email VARCHAR(40) NOT NULL UNIQUE,
PRIMARY KEY (id)
);
/*
CREATE TABLE post(
id SERIAL PRIMARY KEY,
usuario_id INTEGER NOT NULL REFERENCES usuario(id),
titulo VARCHAR(100) NOT NULL UNIQUE,
fecha date

);
*/
CREATE TABLE post(
id SERIAL ,
usuario_id INTEGER NOT NULL ,
titulo VARCHAR(100) NOT NULL UNIQUE,
fecha date,
PRIMARY KEY(id),
FOREIGN KEY(usuario_id)REFERENCES usuario(id)

);
/*

CREATE TABLE comentario(
id SERIAL PRIMARY KEY,
usuario_id INTEGER NOT NULL REFERENCES usuario(id),
post_id INTEGER NOT NULL REFERENCES post(id),
texto VARCHAR(500) NOT NULL,
fecha date
);
*/

CREATE TABLE comentario(
id SERIAL,
usuario_id INT ,
post_id INT NOT NULL,
texto VARCHAR(500) NOT NULL,
fecha date,
PRIMARY KEY(id),
FOREIGN KEY(usuario_id)REFERENCES usuario(id),
FOREIGN KEY(post_id) REFERENCES  post(id)
);
/*
Requerimiento 3
Insertar los siguientes registros*/

--USUARIO
INSERT INTO USUARIO(EMAIL) VALUES ('usuario01@hotmail.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario02@gmail.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario03@gmail.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario04@hotmail.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario05@yahoo.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario06@hotmail.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario07@yahoo.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario08@yahoo.com');
INSERT INTO USUARIO(EMAIL) VALUES ('usuario09@yahoo.com');

--POST
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (1, 'Post 1: Esto es
malo ', '2020-06-29');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (5, 'Post 2: Esto es
malo ', '2020-06-20');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (1, 'Post 3: Esto es
excelente ', '2020-05-30');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (9, 'Post 4: Esto es
bueno ', '2020-05-09');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (7, 'Post 5: Esto es
bueno ', '2020-07-10');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (5, 'Post 6: Esto es
excelente ', '2020-07-18');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (8, 'Post 7: Esto es
excelente ', '2020-07-07');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (5, 'Post 8: Esto es
excelente ', '2020-05-14');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (2, 'Post 9: Esto es
bueno ', '2020-05-08');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (6, 'Post 10: Esto
es bueno ', '2020-06-02');

INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (4, 'Post 11: Esto
es bueno ', '2020-05-05');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (9, 'Post 12: Esto
es malo ', '2020-07-23');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (5, 'Post 13: Esto
es excelente', '2020-05-30');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (8, 'Post 14: Esto
es excelente', '2020-05-01');
INSERT INTO POST (USUARIO_ID, TITULO, FECHA) VALUES (7, 'Post 15: Esto
es malo ', '2020-06-17');

-- COMENTARIO
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (3,1,
'Este es el comentario 1 ','2020-07-08');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (4,2,
'Este es el comentario 2 ','2020-06-07');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (6,3,
'Este es el comentario 3 ','2020-06-16');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (2,4,
'Este es el comentario 4 ','2020-06-15');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (6,5,
'Este es el comentario 5 ','2020-05-14');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (3,6,
'Este es el comentario 6 ','2020-07-08');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (6,7,
'Este es el comentario 7 ','2020-05-22');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (6,8,
'Este es el comentario 8 ','2020-07-09');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (8,9,
'Este es el comentario 9 ','2020-06-30');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (8,10,
'Este es el comentario 10','2020-06-19');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (5,11,
'Este es el comentario 11','2020-05-09');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (8,12,
'Este es el comentario 12','2020-06-17');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (1,13,
'Este es el comentario 13','2020-05-01');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (2,14,
'Este es el comentario 14','2020-05-31');
INSERT INTO COMENTARIO (USUARIO_ID, POST_ID, TEXTO, FECHA) VALUES (4,15,
'Este es el comentario 15','2020-06-28');

/*Requerimiento 4
Seleccionar el correo, id y título de todos los post publicados por el usuario 5.
*/
select email, u.id, titulo
from usuario u
join post p on u.id = p.usuario_id
where u.id = 5;

/*Requerimiento 5
Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados por el
usuario con email usuario06@hotmail.com.
*/
select email, u.id, texto, fecha
from usuario u
join comentario c on u.id = c.usuario_id
where u.email != 'usuario06@hotmail.com';

/*Requerimiento 6
Listar los usuarios que no han publicado ningún post.*/
select *
from usuario u
left join post p on u.id = p.usuario_id
where p.id is null;

/*Requerimiento 7
Listar todos los post con sus comentarios (incluyendo aquellos que no poseen
comentarios).*/
select *
from post p
full outer join comentario c on p.id = c.post_id;

/*Requerimiento 8 Listar todos los usuarios que hayan publicado un post en Junio.  */

select usuario.*
from usuario
LEFT JOIN post ON usuario.id = post.usuario_id
WHERE fecha between '2020-06-01' and '2020-06-30';