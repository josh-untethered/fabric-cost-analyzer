CREATE PROCEDURE dbo.Query7
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 7: Most Profitable Pickup and Dropoff Location Pairs
    SELECT TOP 10
        pu_location_id,
        do_location_id,
        SUM(CAST(total_amount AS FLOAT)) AS TotalRevenue
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY pu_location_id, do_location_id
    ORDER BY TotalRevenue DESC
    OPTION (LABEL = 'q07');
END;