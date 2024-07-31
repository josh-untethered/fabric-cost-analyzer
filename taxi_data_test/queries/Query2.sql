CREATE PROCEDURE dbo.Query2
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 2: Top 5 Most Common Dropoff Locations
    SELECT TOP 5
        do_location_id,
        COUNT(*) AS DropoffCount
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY do_location_id
    ORDER BY DropoffCount DESC
    OPTION (LABEL = 'q02');
END;