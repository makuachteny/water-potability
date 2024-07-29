# Database Schema Documentation

## General Overview

This document provides an overview of the schema for the water quality data collection. It covers information about admins, locations, and water quality measurements, designed to facilitate efficient data design, gathering and analysis using MongoDB.

## Schema Structure

## Design

![Database Schema Design](/App_Screenshots/Schema_design.png)
*Design*

### Collections

#### 1. Admin

**NB**: To manage system administrators and their credentials.

**Fields**:

| Field Name | Data Type | Description                           |
|------------|-----------|---------------------------------------|
| _id        | ObjectId  | Unique identifier for each admin      |
| name       | String    | Full name of the admin                |
| password   | String    | Admin's account password              |
| users      | Array     | List of users managed by the admin    |

**User Subdocument**:

| Field Name | Data Type | Description                           |
|------------|-----------|---------------------------------------|
| user_id    | ObjectId  | Unique identifier for each user       |
| name       | String    | Full name of the user                 |

#### 2. Location

**NB**: To maintain information about the sampling locations for water quality data.

**Fields**:

| Field Name  | Data Type | Description                           |
|-------------|-----------|---------------------------------------|
| _id         | ObjectId  | Unique identifier for each location   |
| name        | String    | Name of the location                  |
| latitude    | Double    | Geographic latitude coordinate        |
| longitude   | Double    | Geographic longitude coordinate       |
| address     | String    | Optional address of the location      |

#### 3. WaterQuality

**NB**: To log water quality measurements associated with specific users and locations.

**Fields**:

| Field Name       | Data Type | Description                                     |
|------------------|-----------|-------------------------------------------------|
| _id              | ObjectId  | Unique identifier for each record               |
| location_id      | ObjectId  | Reference to the Location collection            |
| ph               | Double    | pH level of the water                           |
| hardness         | Double    | Water hardness (e.g., in mg/L as CaCO3)         |
| solids           | Double    | Total dissolved solids (e.g., in mg/L)          |
| chloramines      | Double    | Chloramines level (e.g., in mg/L)               |
| sulfate          | Double    | Sulfate concentration (e.g., in mg/L)           |
| conductivity     | Double    | Water conductivity (e.g., in µS/cm)             |
| organic_carbon   | Double    | Organic carbon concentration (e.g., in mg/L)    |
| trihalomethanes  | Double    | Trihalomethanes concentration (e.g., in µg/L)   |
| turbidity        | Double    | Water turbidity (e.g., in NTU)                  |
| potability       | Boolean   | Indicator of water potability (0 = non-potable, 1 = potable), initially NULL and updated from predictions |

### Relationships

**One-to-Many Relationships**:

- Each Admin can manage multiple Users.
- Each Location can have multiple WaterQuality records.

**References**:

- `WaterQuality.location_id` references `Location._id`.
