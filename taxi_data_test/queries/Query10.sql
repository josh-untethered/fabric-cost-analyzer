CREATE PROCEDURE dbo.Query10
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 10: Detailed Customer Loyalty Analysis
    WITH CustomerTrips AS (
        SELECT 
            passenger_count,
            COUNT(*) AS TripCount,
            COUNT(DISTINCT passenger_count) AS UniquePassengers,
            AVG(CAST(fare_amount AS FLOAT)) AS AvgFareAmount,
            AVG(CAST(tip_amount AS FLOAT)) AS AvgTipAmount
        FROM taxi_lh.dbo.nyc_taxi
        GROUP BY passenger_count
    )
    SELECT 
        passenger_count,
        TripCount,
        UniquePassengers,
        CASE 
            WHEN UniquePassengers = 0 THEN 0
            ELSE (TripCount / UniquePassengers)
        END AS TripsPerPassenger,
        AvgFareAmount,
        AvgTipAmount
    FROM CustomerTrips
    ORDER BY TripsPerPassenger DESC
    OPTION (LABEL = 'q10');
END;