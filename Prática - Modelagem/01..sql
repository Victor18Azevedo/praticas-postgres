CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL,
	"email" VARCHAR(50) NOT NULL UNIQUE,
	"password" VARCHAR(16) NOT NULL
)

CREATE TABLE "products" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE,
	"description" TEXT NOT NULL UNIQUE,
	"price" INT NOT NULL DEFAULT 0,
	"categoryId" INT NOT NULL REFERENCES "categories"("id"),
	"imageUrl" TEXT NOT NULL
) 

CREATE TABLE "categories" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL UNIQUE
) 

CREATE TABLE "sizes" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(10) NOT NULL UNIQUE
) 

CREATE TABLE "sizesAvailable" (
	"id" SERIAL PRIMARY KEY,
	"sizeId" INT NOT NULL REFERENCES "sizes"("id"),
	"producId" INT NOT NULL REFERENCES "products"("id"),
	"amountAvailable" INT NOT NULL DEFAULT 0
) 

CREATE TABLE "orders" (
	"id" SERIAL PRIMARY KEY,
	"userId" INT NOT NULL REFERENCES "users"("id"),
	"status" VARCHAR(20) NOT NULL,
	"buyDate" DATE NOT NULL  DEFAULT NOW(),
	"addres" TEXT NOT NULL
) 

CREATE TABLE "productsOrder" (
	"id" SERIAL PRIMARY KEY,
	"orderId" INT NOT NULL REFERENCES "orders"("id"),
	"productId" INT NOT NULL REFERENCES "products"("id"),
	"amount" INT NOT NULL,
	"sizeId" INT NOT NULL REFERENCES "sizes"("id")
)