CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "username" varchar(256),
  "password" varchar(256),
  "role" varchar,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "products" (
  "id" integer PRIMARY KEY,
  "name" TEXT,
  "price" float,
  "stock" int,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "suppliers" (
  "id" integer PRIMARY KEY,
  "name" TEXT,
  "phone_number" varchar(256),
  "address" TEXT,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "customers" (
  "id" integer PRIMARY KEY,
  "name" TEXT,
  "phone_number" varchar(256),
  "address" TEXT,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "quotation" (
  "id" integer PRIMARY KEY,
  "id_users" integer,
  "id_customer" integer,
  "date" TIMESTAMP,
  "quotation_number" varchar(256),
  "price" float,
  "quantity" integer,
  "amount" float,
  "tax" float,
  "total" float,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "sales" (
  "id" integer PRIMARY KEY,
  "id_purchase" integer,
  "id_users" integer,
  "id_customer" integer,
  "date" TIMESTAMP,
  "sales_number" varchar(256),
  "status" TEXT,
  "price" float,
  "quantity" integer,
  "amount" float,
  "tax" float,
  "total" float,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "detail_transaction" (
  "id" integer PRIMARY KEY,
  "id_transaction" integer,
  "id_product" integer,
  "type_transaction" TEXT,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "purchase" (
  "id" integer PRIMARY KEY,
  "id_quotation" integer,
  "id_users" integer,
  "id_supplier" integer,
  "id_customer" integer,
  "date" TIMESTAMP,
  "purchase_number" varchar(256),
  "status" TEXT,
  "price" float,
  "quantity" integer,
  "amount" float,
  "tax" float,
  "total" float,
  "is_from_sales" int,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "Delivery" (
  "id" integer PRIMARY KEY,
  "id_purchase" integer,
  "date" TIMESTAMP,
  "delivery_number" varchar(256),
  "status" TEXT,
  "price" float,
  "quantity" integer,
  "amount" float,
  "tax" float,
  "total" float,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "Payment" (
  "id" integer PRIMARY KEY,
  "id_delivery" integer,
  "date" TIMESTAMP,
  "payment_number" varchar(256),
  "status" TEXT,
  "price" float,
  "quantity" integer,
  "amount" float,
  "tax" float,
  "total" float,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "Stock" (
  "id" integer PRIMARY KEY,
  "id_product" integer,
  "id_transaction" integer,
  "transaction_type" TEXT,
  "date" TIMESTAMP,
  "price" float,
  "quantity" integer,
  "amount" float,
  "total_quantity" int,
  "total_value" float,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int,
  "deleted_at" TIMESTAMP,
  "deleted_by" int
);

CREATE TABLE "work_detail" (
  "id" integer PRIMARY KEY,
  "id_transaction" integer,
  "transaction_type" TEXT,
  "field_change" TEXT,
  "status" TEXT,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int
);

CREATE TABLE "chart_of_account" (
  "id" integer PRIMARY KEY,
  "header_account" int,
  "account_number" int,
  "name" TEXT,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int
);

CREATE TABLE "journal" (
  "id" integer PRIMARY KEY,
  "id_account" int,
  "id_transaction" int,
  "type_transaction" TEXT,
  "date" TIMESTAMP,
  "total" float,
  "created_at" TIMESTAMP,
  "created_by" int,
  "updated_at" TIMESTAMP,
  "updated_by" int
);

ALTER TABLE "Stock" ADD FOREIGN KEY ("id_product") REFERENCES "products" ("id");

ALTER TABLE "Stock" ADD FOREIGN KEY ("id_transaction") REFERENCES "sales" ("id");

ALTER TABLE "Stock" ADD FOREIGN KEY ("id_transaction") REFERENCES "purchase" ("id");

ALTER TABLE "Stock" ADD FOREIGN KEY ("id_transaction") REFERENCES "Delivery" ("id");

ALTER TABLE "Stock" ADD FOREIGN KEY ("id_transaction") REFERENCES "Payment" ("id");

ALTER TABLE "detail_transaction" ADD FOREIGN KEY ("id_transaction") REFERENCES "sales" ("id");

ALTER TABLE "detail_transaction" ADD FOREIGN KEY ("id_transaction") REFERENCES "purchase" ("id");

ALTER TABLE "detail_transaction" ADD FOREIGN KEY ("id_transaction") REFERENCES "Delivery" ("id");

ALTER TABLE "detail_transaction" ADD FOREIGN KEY ("id_transaction") REFERENCES "Payment" ("id");

ALTER TABLE "detail_transaction" ADD FOREIGN KEY ("id_product") REFERENCES "products" ("id");

ALTER TABLE "sales" ADD FOREIGN KEY ("id_users") REFERENCES "users" ("id");

ALTER TABLE "sales" ADD FOREIGN KEY ("id_customer") REFERENCES "customers" ("id");

ALTER TABLE "purchase" ADD FOREIGN KEY ("id_users") REFERENCES "users" ("id");

ALTER TABLE "purchase" ADD FOREIGN KEY ("id_supplier") REFERENCES "suppliers" ("id");

ALTER TABLE "purchase" ADD FOREIGN KEY ("id_customer") REFERENCES "customers" ("id");

ALTER TABLE "Delivery" ADD FOREIGN KEY ("id_purchase") REFERENCES "purchase" ("id");

ALTER TABLE "Payment" ADD FOREIGN KEY ("id_delivery") REFERENCES "Delivery" ("id");

ALTER TABLE "sales" ADD FOREIGN KEY ("id_purchase") REFERENCES "purchase" ("id");

ALTER TABLE "purchase" ADD FOREIGN KEY ("id_quotation") REFERENCES "quotation" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("id_account") REFERENCES "chart_of_account" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("id_transaction") REFERENCES "quotation" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("id_transaction") REFERENCES "Payment" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("id_transaction") REFERENCES "purchase" ("id");

ALTER TABLE "journal" ADD FOREIGN KEY ("id_transaction") REFERENCES "sales" ("id");

ALTER TABLE "work_detail" ADD FOREIGN KEY ("id_transaction") REFERENCES "quotation" ("id");

ALTER TABLE "work_detail" ADD FOREIGN KEY ("id_transaction") REFERENCES "Payment" ("id");

ALTER TABLE "work_detail" ADD FOREIGN KEY ("id_transaction") REFERENCES "Delivery" ("id");

ALTER TABLE "work_detail" ADD FOREIGN KEY ("id_transaction") REFERENCES "purchase" ("id");

ALTER TABLE "work_detail" ADD FOREIGN KEY ("id_transaction") REFERENCES "sales" ("id");

ALTER TABLE "quotation" ADD FOREIGN KEY ("id_users") REFERENCES "users" ("id");

ALTER TABLE "quotation" ADD FOREIGN KEY ("id_customer") REFERENCES "customers" ("id");
