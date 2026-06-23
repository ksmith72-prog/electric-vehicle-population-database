# Electric Vehicle Population Database

University of Maryland | INST327 Database Design & Modeling

## Project Overview

Designed and implemented a normalized relational database to analyze electric vehicle population data from Washington State.

The database supports analysis of:

- Electric vehicle adoption trends
- Vehicle make and model popularity
- Geographic distribution of EVs
- Utility provider coverage
- Electric range statistics

## Team Members

- Keith Smith
- Chigozie Uwandu
- Justin Seibure
- Miguel Rivas
- Ryan Tran

## Technical Highlights

- Designed and implemented a relational database in Third Normal Form (3NF)
- Created seven normalized tables with primary and foreign key relationships
- Imported, cleaned, and transformed real-world electric vehicle population data
- Implemented SQL views utilizing JOINs, GROUP BY, HAVING clauses, and subqueries
- Developed analytical queries to identify electric vehicle adoption patterns and trends
- Built an Entity Relationship Diagram (ERD) to model database structure and relationships
- Applied database design, normalization, and data integrity principles

## Database Tables

### Core Tables
- Vehicle
- Make
- Model
- Location
- Utility

### Linking Tables
- Vehicle_Inventory
- Location_Utility

### Key Data Elements
- Vehicle make and model information
- Electric vehicle type (BEV and PHEV)
- Electric range statistics
- CAFV eligibility status
- Geographic location data
- Utility provider information

## Example SQL Features

This project demonstrates:

- INNER JOIN operations across multiple tables
- Aggregate functions including COUNT() and AVG()
- GROUP BY and HAVING clauses
- Filtering with WHERE conditions
- Subqueries for comparative analysis
- Many-to-many relationships using linking tables
- Data normalization and referential integrity
- Analytical SQL views for reporting and decision support

## Technologies

- SQL
- MySQL
- Database Design
- Database Modeling
- Entity Relationship Diagrams (ERD)
- Data Normalization

## Files

### SQL Scripts
- `sql/EVP.sql`
- `sql/team_6_evp_queries.sql`

### Documentation
- Final Project Report
- Entity Relationship Diagram (ERD)

### Dataset
- Cleaned Electric Vehicle Population Dataset

## Course

INST327: Database Design and Modeling

University of Maryland
