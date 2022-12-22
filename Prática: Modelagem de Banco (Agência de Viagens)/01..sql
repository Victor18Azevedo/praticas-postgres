CREATE TABLE "airlines" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"abbreviation" VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE "airports" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"abbreviation" VARCHAR(3) NOT NULL UNIQUE
);

CREATE TABLE "flights" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(7) NOT NULL UNIQUE,
	"airlineId" INTEGER NOT NULL,
	"departureAirportId" INTEGER NOT NULL,
	"landingAirportId" INTEGER NOT NULL,
	"departureTime" TIME NOT NULL,
	"landingTime" TIME NOT NULL
);