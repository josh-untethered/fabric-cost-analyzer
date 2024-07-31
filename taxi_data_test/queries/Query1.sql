CREATE PROCEDURE dbo.Query1
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 1: Average Fare and Tip Amount by Month and Year
    SELECT 
        puYear,
        puMonth,
        AVG(CAST(fare_amount AS FLOAT)) AS AvgFareAmount,
        AVG(CAST(tip_amount AS FLOAT)) AS AvgTipAmount
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY puYear, puMonth
    ORDER BY puYear, puMonth
    OPTION (LABEL = 'q01');
END;