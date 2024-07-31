CREATE PROCEDURE dbo.Query4
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 4: Trip Distance Distribution by Passenger Count
    SELECT 
        passenger_count,
        COUNT(*) AS TripCount,
        AVG(CAST(trip_distance AS FLOAT)) AS AvgTripDistance,
        MIN(CAST(trip_distance AS FLOAT)) AS MinTripDistance,
        MAX(CAST(trip_distance AS FLOAT)) AS MaxTripDistance
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY passenger_count
    ORDER BY passenger_count
    OPTION (LABEL = 'q04');
END;