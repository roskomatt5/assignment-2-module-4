CREATE TABLE "Customer" (
  "cust_id" SERIAL,
  "first_name" VARCHAR(150),
  "last_name" VARCHAR(150),
  "card_num_file" SERIAL,
  PRIMARY KEY ("cust_id")
);

CREATE TABLE "Tickets" (
  "ticket_id" SERIAL,
  "cost" NUMERIC(12,2),
  "cust_id" SERIAL,
  "movie_id" SERIAL,
  "time_of_purchase" DATE(current Date),
  "is_child_ticket" BOOLEAN,
  PRIMARY KEY ("ticket_id")
);

CREATE TABLE "Movie" (
  "movie_id" SERIAL,
  "ticket_id" SERIAL,
  "start_time" DATE(current Date),
  "Genre" VARCHAR(100),
  PRIMARY KEY ("movie_id")
);

CREATE TABLE "Concessions" (
  "item_id" SERIAL,
  "item_name" VARCHAR(100),
  "cust_id" SERIAL,
  "sub_total" NUMERIC(12,2),
  "total_cost" NUMERIC(12,2),
  "purchase_time" DATE(current Date),
  PRIMARY KEY ("item_id"),
  CONSTRAINT "FK_Concessions.cust_id"
    FOREIGN KEY ("cust_id")
      REFERENCES "Customer"("cust_id")
);
