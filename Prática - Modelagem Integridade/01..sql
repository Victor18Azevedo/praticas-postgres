CREATE TABLE "customers" (
	"id" SERIAL PRIMARY KEY,
	"fullName" TEXT NOT NULL,
	"cpf" VARCHAR(11) NOT NULL UNIQUE,
	"email" VARCHAR(50) NOT NULL UNIQUE,
	"password" VARCHAR(16) NOT NULL
);

CREATE TYPE phoneType AS ENUM ('landline', 'mobile');
CREATE TABLE "customerPhones" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
	"number" VARCHAR(11) NOT NULL UNIQUE,
	"type" phoneType
);

CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE "cities" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES "states"("id")
);

CREATE TABLE "customerAddresses" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
	"street" TEXT NOT NULL,
	"number" VARCHAR(10) NOT NULL,
	"complement" TEXT,
	"postalCode" VARCHAR(10) NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "bankAccount" (
	"id" SERIAL PRIMARY KEY,
	"customerId" INTEGER NOT NULL UNIQUE REFERENCES "customers"("id"),
	"accountNumber" VARCHAR(20) NOT NULL UNIQUE,
	"agency" VARCHAR(4) NOT NULL,
	"openDate" DATE NOT NULL DEFAULT NOW(),
	"closeDate" DATE DEFAULT NULL
);

CREATE TYPE transactionType AS ENUM ('deposit', 'withdraw');
CREATE TABLE "transactions" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"amount" INTEGER NOT NULL,
	"type" transactionType NOT NULL,
	"time" TIMESTAMP NOT NULL DEFAULT NOW(),
	"description" TEXT,
	"cancelled" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE "credtCards" (
	"id" SERIAL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" VARCHAR(30) NOT NULL,
	"number" VARCHAR(16) NOT NULL UNIQUE,
	"securityCode" VARCHAR(3) NOT NULL,
	"expirationMonth" VARCHAR(2) NOT NULL,
	"expirationYear" VARCHAR(4) NOT NULL,
	"password" VARCHAR(8) NOT NULL,
	"limit" INTEGER NOT NULL
);