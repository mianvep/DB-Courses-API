CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "password" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "age" int NOT NULL,
  "rol_id" uuid NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" text NOT NULL,
  "level" varchar NOT NULL,
  "teacher" varchar NOT NULL,
  "categorie_id" uuid NOT NULL
);

CREATE TABLE "courses_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL,
  "courses_id" uuid NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "rol" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_seen" (
  "id" uuid PRIMARY KEY,
  "advance" varchar NOT NULL,
  "course_reviw" text NOT NULL,
  "courses_id" uuid NOT NULL,
  "user_id" uuid NOT NULL
);

ALTER TABLE "courses_seen" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "courses_seen" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "rol" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "courses_video" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");


-- Insertando datos de rol 
insert into rol (
	id,
	"name"
) values (
	'7fefbabb-f7e1-478e-b3c5-be25d2cad2c4',
	'student'
), (
	'ae01f482-c10f-4983-a14a-674bbbdfe15e',
	'teacher'
);

-- Insertando datos de categorias
insert into categories (
	id,
	"name" 
) values (
	'b908af4a-d7cc-49ea-8fe1-7652d5163de5',
	'Programacion'
), (
	'8f928184-3637-4b28-b972-fff17989ea49',
	'Derecho'
);


-- Insertando datos de usuario
insert into users (
	id,
	first_name,
	last_name,
	"password",
	email,
	age,
	rol_id
) values (
	'e8f61bf7-9ff4-40eb-a99d-9b235f5410b9',
	'Miguel',
	'Vera',
	'root123',
	'miguelv@gmail.com',
	26,
	'7fefbabb-f7e1-478e-b3c5-be25d2cad2c4'
), (
	'99523af8-bc27-4b5a-b5f4-6c544cb01909',
	'Javier',
	'Rodriguez',
	'root456',
	'javier.rod@gmail.com',
	24,
	'7fefbabb-f7e1-478e-b3c5-be25d2cad2c4'
);

-- Insertando datos de cursos
insert into courses (
	id,
	title,
	description,
	"level",
	teacher,
	categorie_id
) values (
	'52c7017b-b5c8-4ab8-bd00-6308b258daa3',
	'Programacion Backend',
	'Desarrollo backend usando node js y express',
	'Medium',
	'Sahid Kick',
	'b908af4a-d7cc-49ea-8fe1-7652d5163de5'
), (
	'dc481edf-ad6f-49f7-8e3d-757026972b6e',
	'Derecho empresarial',
	'Politicas y contratos para startups',
	'Advanced',
	'Teresa Ariola',
	'8f928184-3637-4b28-b972-fff17989ea49'
);

-- Insertando datos de videos
insert into courses_video (
	id,
	title,
	url,
	courses_id
) values (
	'cff04b2c-5caf-48a4-b5fb-04cca2d022fa',
	'Fundamentos',
	'www.academlo.com/backend.?fundamentos',
	'52c7017b-b5c8-4ab8-bd00-6308b258daa3'
), (
	'8c15a83b-d8ea-43d7-8c31-f406b31a3509',
	'Politicas de privacidad',
	'www.learnderecho.com/politicas.?startups/',
	'dc481edf-ad6f-49f7-8e3d-757026972b6e'
);

-- Insertando datos de cursos vistos
insert into courses_seen (
	id,
	advance,
	course_reviw,
	courses_id,
	user_id 
) values (
	'78e2d7fc-86a3-4704-959c-53ad51b943a4',
	'58 %',
	'very good',
	'52c7017b-b5c8-4ab8-bd00-6308b258daa3',
	'e8f61bf7-9ff4-40eb-a99d-9b235f5410b9'
), (
	'16fa0c31-0eb5-482b-90c9-07c631397c51',
	'80 %',
	'This cpurse that is great',
	'dc481edf-ad6f-49f7-8e3d-757026972b6e',
	'99523af8-bc27-4b5a-b5f4-6c544cb01909'
);

select * from users;
select * from courses;
select * from rol;
select * from categories;
select * from courses_seen;
select * from courses_video;

