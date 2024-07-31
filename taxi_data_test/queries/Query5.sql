CREATE PROCEDURE dbo.Query5
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 5: Peak Pickup Times by Day of Week
    SELECT 
        DATEPART(weekday, CAST(pickup_datetime AS DATETIME)) AS DayOfWeek,
        DATEPART(hour, CAST(pickup_datetime AS DATETIME)) AS HourOfDay,
        COUNT(*) AS PickupCount
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY DATEPART(weekday, CAST(pickup_datetime AS DATETIME)), DATEPART(hour, CAST(pickup_datetime AS DATETIME))
    ORDER BY PickupCount DESC
    OPTION (LABEL = 'q05');
END;