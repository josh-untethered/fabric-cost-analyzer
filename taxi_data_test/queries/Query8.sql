CREATE PROCEDURE dbo.Query8
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 8: Longest Trips with Details
    SELECT TOP 10 *
    FROM taxi_lh.dbo.nyc_taxi
    ORDER BY CAST(trip_distance AS FLOAT) DESC
    OPTION (LABEL = 'q08');
END;