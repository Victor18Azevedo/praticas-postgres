CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"email" VARCHAR(62) NOT NULL UNIQUE
);

CREATE TABLE "classes" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"code" VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE "studentsClasses" (
	"id" SERIAL PRIMARY KEY,
	"studentId" INTEGER NOT NULL REFERENCES "students"("id"),
	"classId" INTEGER NOT NULL REFERENCES "classes"("id"),
	"entryDate" DATE NOT NULL DEFAULT NOW(),
	"departureDate" DATE
);

CREATE TABLE "projects" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"moduleId" INTEGER NOT NULL REFERENCES "modules"("id")
);

CREATE TABLE "modules" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
);


CREATE TYPE gradeType AS ENUM ('Abaixo das expectativas', 'Dentro das Expectativas', 'Acima das Expectativas');
CREATE TABLE "studentsProjects" (
	"id" SERIAL PRIMARY KEY,
	"studentId" INTEGER NOT NULL REFERENCES "students"("id"),
	"projectId" INTEGER NOT NULL REFERENCES "projects"("id"),
	"deliveryDate" DATE NOT NULL,
	"grade" gradeType NOT NULL
);