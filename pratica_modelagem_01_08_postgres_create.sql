CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"address" TEXT NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" double NOT NULL UNIQUE,
	"type" TEXT NOT NULL,
	"stock" bigint NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos" (
	"id" serial NOT NULL UNIQUE,
	"mainPhoto" BOOLEAN NOT NULL DEFAULT 'false',
	"idProduct" integer NOT NULL UNIQUE,
	"url" TEXT NOT NULL UNIQUE,
	CONSTRAINT "photos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes" (
	"id" serial NOT NULL UNIQUE,
	"category" TEXT NOT NULL UNIQUE,
	"size" TEXT NOT NULL,
	"idProduct" integer,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.orders" (
	"id" serial NOT NULL,
	"currentState" TEXT NOT NULL,
	"idCustomer" integer NOT NULL,
	"idProduct" integer NOT NULL,
	"amount" bigint NOT NULL,
	"dateOfSale" DATE NOT NULL DEFAULT 'now()',
	"totalPrice" double NOT NULL,
	"deliveryDate" DATE NOT NULL DEFAULT 'now()',
	CONSTRAINT "orders_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sales" (
	"id" serial NOT NULL UNIQUE,
	"idOrder" integer NOT NULL UNIQUE,
	"dateOfSale" DATE NOT NULL,
	"totalValue" double NOT NULL
) WITH (
  OIDS=FALSE
);





ALTER TABLE "photos" ADD CONSTRAINT "photos_fk0" FOREIGN KEY ("idProduct") REFERENCES "products"("id");

ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("idProduct") REFERENCES "products"("id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("idCustomer") REFERENCES "customers"("id");
ALTER TABLE "orders" ADD CONSTRAINT "orders_fk1" FOREIGN KEY ("idProduct") REFERENCES "products"("id");

ALTER TABLE "sales" ADD CONSTRAINT "sales_fk0" FOREIGN KEY ("idOrder") REFERENCES "orders"("id");







