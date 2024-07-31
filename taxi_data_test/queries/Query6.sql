CREATE PROCEDURE dbo.Query6
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 6: Revenue by Hour of Day and Day of Week
    SELECT 
        DATEPART(hour, CAST(pickup_datetime AS DATETIME)) AS HourOfDay,
        DATEPART(weekday, CAST(pickup_datetime AS DATETIME)) AS DayOfWeek,
        SUM(CAST(total_amount AS FLOAT)) AS TotalRevenue
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY DATEPART(hour, CAST(pickup_datetime AS DATETIME)), DATEPART(weekday, CAST(pickup_datetime AS DATETIME))
    ORDER BY TotalRevenue DESC
    OPTION (LABEL = 'q06');
END;