# HNG-Rides

To review the performance of the ride business between mid-2021 to end-2024.


## Project Overview

The objective of this task is to review performance for the period mid-2021 through Dec 2024 to understand how operations have evolved and where to improve. My task is to clean the data, answer key business questions, and prepare a short insight summary that management can use for decision-making.


## Data Source

[HNG Cohort 13](https://hng.tech/internship)


## Tools

[PostgreSQL](https://www.postgresql.org/download/)


## Data Cleaning & Preparation

The data was imported into POSTGRESQL, where it was cleaned by replacing the abbreviations in the city column with the full names, checking for duplicate records, null values, and dropping records that are not within the range of June 2021 to December 2024.


## Exploratory Data Analysis (EDA)

- Find the top 10 longest rides (by distance), including driver name, rider name, pickup/dropoff cities, and payment method.
  
  <img width="2048" height="938" alt="carbon (14)" src="https://github.com/user-attachments/assets/bcecb969-c233-487a-904b-0e7ae0975a38" />
  

  <img width="601" height="298" alt="1" src="https://github.com/user-attachments/assets/39f16e6a-7012-4609-9f47-9058dd537f3f" />


- How many riders who signed up in 2021 still took rides in 2024?

  <img width="1670" height="640" alt="carbon (15)" src="https://github.com/user-attachments/assets/d72e4427-96b9-47e9-bc4b-ea9110f2c485" />
  

  <img width="152" height="73" alt="2" src="https://github.com/user-attachments/assets/90b64f80-87bb-4eff-8417-d934c7c54698" />


- Compare quarterly revenue between 2021, 2022, 2023, and 2024. Which quarter had the biggest YoY growth?

  <img width="2048" height="1348" alt="carbon (16)" src="https://github.com/user-attachments/assets/efb3af8c-4ba3-477a-87b4-dddf3e2775ad" />


  <img width="609" height="324" alt="3" src="https://github.com/user-attachments/assets/7dc09b1a-bb83-47cd-a1ca-9f4379e5052b" />


- For each driver, calculate their average monthly rides since signup. Who are the top 5 drivers with the highest consistency (most rides per active month)?


  <img width="1956" height="1198" alt="carbon (17)" src="https://github.com/user-attachments/assets/25b48267-45a2-4091-a844-c724b6dbc7c4" />


  <img width="287" height="170" alt="4" src="https://github.com/user-attachments/assets/f6393f1a-89c4-41fd-b1ef-2db12a8126b5" />


- Calculate the cancellation rate per city and identify which city had the highest cancellation rate?


  <img width="1990" height="1012" alt="carbon (18)" src="https://github.com/user-attachments/assets/8c899963-97b0-40c8-a98b-5314e7085faa" />

  <img width="510" height="310" alt="5" src="https://github.com/user-attachments/assets/e0dd57fe-97dd-47ae-898f-c935ab4e037e" />

  
- Identify riders who have taken more than 10 rides but never paid with cash.

  
  <img width="2024" height="938" alt="carbon (19)" src="https://github.com/user-attachments/assets/d086b975-ade8-4f51-93d0-2353e1ab8bdc" />


  <img width="266" height="80" alt="6" src="https://github.com/user-attachments/assets/5dce0592-1323-448b-b065-b229c6350342" />


- Find the top 3 drivers in each city by total revenue earned between June 2021 and Dec 2024. If a driver has multiple cities, count revenue where they picked up passengers in that city.

  <img width="1872" height="1386" alt="carbon (20)" src="https://github.com/user-attachments/assets/a0af5bd5-d0d9-4b2c-92ff-91463fbae115" />


  <img width="323" height="445" alt="7a" src="https://github.com/user-attachments/assets/93b12bd1-6719-4a12-b3fe-2ddb6c9d9ed9" />


  <img width="326" height="450" alt="7b" src="https://github.com/user-attachments/assets/b2e2ef8d-ab43-4b03-be5c-801819c446b3" />

  
- Management wants to know the top 10 drivers that are qualified to receive bonuses using the criteria below;
  - at least 30 rides completed,
  - an average rating ≥ 4.5, and
  - a cancellation rate under 5%.


  <img width="2048" height="1646" alt="carbon (21)" src="https://github.com/user-attachments/assets/38e6f3ca-ee19-4ce3-9b44-aa4669b3c72a" />


  <img width="524" height="105" alt="8" src="https://github.com/user-attachments/assets/181d852f-d279-4962-b5c7-78c3efb43ff1" />
