# Dashboard Analytics - JetAirways BI Course FILKOM UB

## Backgorund
The rapid growth of information technology and data-driven decision-making has pushed industries, including aviation to adopt Business Intelligence (BI) tools. Jet Airways faces increasingly complex challenges in operations and customer experience, making effective data management essential for improving service quality and business efficiency. To address this, a BI dashboard was developed to simplify complex data analysis and deliver actionable insights. Leveraging both historical and real-time data, the dashboard supports decision-making, identifies trends, and enhances operational performance. 

This project outlines the design and implementation of a BI dashboard for Jet Airways, showcasing how modern analytics can drive strategic value and strengthen the airline’s competitive position.

## Data Source
The dataset used in this project was obtained from [Plane Ticket Price Dataset (Kaggle)](https://www.kaggle.com/datasets/ibrahimelsayed182/plane-ticket-price?resource=download).

<img width="1526" height="640" alt="Image" src="https://github.com/user-attachments/assets/53fcaa27-2d10-4f24-b614-3542f8e9fcae" />

This open-source dataset contains flight information from various airlines, including Jet Airways. Key columns include airline name, departure and arrival details, total stops, route, ticket price, and more.
For this dashboard, the focus is on Jet Airways data, with selected comparisons to competitor airlines. The main dimensions used are:
- Airline : Jet Airways flights only; revenue comparison with other airlines.
- City : Derived from departure (Source) and arrival (Destination) cities.
- Date : Based on Date_of_Journey, with normalized date entries for consistency.
- Route : Based on Route and Total_Stops, capturing stopovers and transit counts.
- Time : Includes Dep_Time, Arrival_Time, and Duration.
- Price : Taken from the Price column representing ticket costs.

Each dimension is structured and assigned unique IDs to support data warehouse integration for the BI dashboard.

<img width="959" height="715" alt="Image" src="https://github.com/user-attachments/assets/fe163e58-8a26-43a1-b5eb-d4e4a49b2e12" />
