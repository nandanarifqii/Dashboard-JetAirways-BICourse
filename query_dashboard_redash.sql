-- Total Revenue
SELECT 
    SUM(ff.Price) as total_revenue
FROM fact_flights ff
JOIN dim_airline da ON da.id_Airline = ff.id_Airline
WHERE da.Airline_Name = 'Jet Airways';

-- Total Flight
SELECT COUNT(*) AS total_flights
FROM fact_flights ff
JOIN dim_airline da ON da.id_Airline = ff.id_Airline
WHERE da.Airline_Name = 'Jet Airways';

-- Route Profitability Matrix
SELECT 
    dr.Flight_Route AS "Route",
    ds.City_Name AS "Source",
    dc.City_Name AS "Destination",
    COUNT(*) AS "Frequency",
    ROUND(AVG(ff.Price), 0) AS "Average Price",
    SUM(ff.Price) AS "Total Revenue",
    ROUND(AVG(ff.Duration_in_Minutes), 0) AS "Average Duration",
    ROUND(SUM(ff.Price) / COUNT(*), 2) AS "Revenue Per Flight",
    CASE 
        WHEN SUM(ff.Price) > 100000 AND COUNT(*) > 5 THEN 'High-Value High-Volume'
        WHEN SUM(ff.Price) > 100000 THEN 'High-Value Low-Volume'
        WHEN COUNT(*) > 5 THEN 'Low-Value High-Volume'
        ELSE 'Low-Value Low-Volume'
    END AS "Category"
FROM fact_flights ff
JOIN dim_route dr ON dr.id_Route = ff.id_Route
JOIN dim_city ds ON ds.id_City = ff.id_Source
JOIN dim_city dc ON dc.id_City = ff.id_Destination
JOIN dim_airline da ON da.id_Airline = ff.id_Airline
WHERE da.Airline_Name = 'Jet Airways'
GROUP BY da.Airline_Name, dr.Flight_Route, ds.City_Name, dc.City_Name
ORDER BY "Total Revenue" DESC;

-- Airline Market Share
SELECT 
    da.Airline_Name,
    COUNT(*) as Flight_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_flights), 2) as Market_Share_Percent,
    SUM(ff.Price) as Total_Revenue
FROM fact_flights ff
JOIN dim_airline da ON da.id_Airline = ff.id_Airline
GROUP BY da.Airline_Name
ORDER BY Market_Share_Percent DESC;

-- Customer Journey Flow Analysis
SELECT 
    ds.City_Name as stage1,
    da.Airline_Name as stage2,
    ddt.Time_Period as stage3,
    dr.Total_Stops as stage4,
    COUNT(*) as value
FROM fact_flights ff
JOIN dim_city ds ON ds.id_City = ff.id_Source
JOIN dim_airline da ON da.id_Airline = ff.id_Airline
JOIN dim_time ddt ON ddt.id_Time = ff.id_Dep_Time
JOIN dim_route dr ON dr.id_Route = ff.id_Route
GROUP BY ds.City_Name, da.Airline_Name, ddt.Time_Period, dr.Total_Stops
ORDER BY value DESC;

-- Revenue Trend by Time Period
SELECT 
    dd.Full_Date,
    ddt.Time_Period,
    SUM(CASE WHEN da.Airline_Name = 'Jet Airways' THEN ff.Price ELSE 0 END) as Jet_Airways_Revenue,
    SUM(ff.Price) as Total_Market_Revenue
FROM fact_flights ff
JOIN dim_date dd ON dd.id_Date = ff.id_Date
JOIN dim_time ddt ON ddt.id_Time = ff.id_Dep_Time
JOIN dim_airline da ON da.id_Airline = ff.id_Airline
GROUP BY dd.Full_Date, ddt.Time_Period
ORDER BY dd.Full_Date;