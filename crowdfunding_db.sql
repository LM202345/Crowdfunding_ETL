-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Drop table if exists
DROP TABLE campaign;
DROP TABLE category;
DROP TABLE subcategory;
DROP TABLE contacts;

-- Using the database schema, create the tables in the correct order to handle the foreign keys.

CREATE TABLE "contacts" (
    "contact_id" INTEGER   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "email" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "subcategory" (
    "subcategory_id" VARCHAR(10)   NOT NULL,
    "subcategory" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

CREATE TABLE "category" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "campaign" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(50)   NOT NULL,
    "description" VARCHAR   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR   NOT NULL,
    "backers_count" INTEGER   NOT NULL,
    "country" VARCHAR(10)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launch_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR   NOT NULL,
    "subcategory_id" VARCHAR   NOT NULL
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");


--Verify the table creation by running a SELECT statement for each table.
SELECT* FROM category;
SELECT* FROM subcategory;
SELECT* FROM contacts;
SELECT* FROM campaign;

--Import each CSV file into its corresponding SQL table

DELETE FROM campaign;
DELETE FROM category;
DELETE FROM subcategory;
DELETE FROM contacts;

--Remember to change the path according to the local location of the csv files

COPY category FROM 'C:\Git\Crowdfunding_ETL\Resources\category.csv' DELIMITER ',' CSV HEADER;
COPY subcategory FROM 'C:\Git\Crowdfunding_ETL\Resources\subcategory.csv' DELIMITER ',' CSV HEADER;
COPY contacts FROM 'C:\Git\Crowdfunding_ETL\Resources\contacts.csv' DELIMITER ',' CSV HEADER;
COPY campaign FROM 'C:\Git\Crowdfunding_ETL\Resources\campaign.csv' DELIMITER ',' CSV HEADER;

--Verify that each table has the correct data by running a SELECT statement for each.

SELECT* FROM category;
SELECT* FROM subcategory;
SELECT* FROM contacts;
SELECT* FROM campaign;




