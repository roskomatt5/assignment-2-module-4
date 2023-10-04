CREATE TABLE "Customer" (
  "cust_id" SERIAL,
  "first_name" VARCHAR(150),
  "last_name" VARCHAR(150),
  "card_num_file" SERIAL,
  PRIMARY KEY ("cust_id")
);
insert into customer (cust_id,first_name,last_name,card_num_file)
values
(1234,'matt','rosko','12345678910')

CREATE TABLE "Tickets" (
  "ticket_id" SERIAL,
  "cost" NUMERIC(12,2),
  "cust_id" SERIAL,
  "movie_id" SERIAL,
  "time_of_purchase" DATE(current Date),
  "is_child_ticket" BOOLEAN,
  PRIMARY KEY ("ticket_id")
);

insert into tickets (ticket_id,cost,cust_id,movie_id,time_of_purchase,is_child_ticket)
values
  (4321,3.99,1234,2468,'2023-10-03 14:30:00',false)

CREATE TABLE "Movie" (
  "movie_id" SERIAL,
  "ticket_id" SERIAL,
  "start_time" DATE(current Date),
  "Genre" VARCHAR(100),
  PRIMARY KEY ("movie_id")
);

insert into movie (movie_id,ticket_id,start_time, Genre)
values
(2468,4321,'2023-10-03 15:00:00','Romcom')

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

insert into concessions (item_id,item_name,cust_id,sub_total,total_cost,purchase_time)
  values (4689,'popcorn',1234,4.99,5.25,'2023-10-03 14:45:00')
