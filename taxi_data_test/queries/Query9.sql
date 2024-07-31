CREATE PROCEDURE dbo.Query9
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 9: Monthly Revenue Growth Rate
    WITH MonthlyRevenue AS (
        SELECT 
            puYear,
            puMonth,
            SUM(CAST(total_amount AS FLOAT)) AS TotalRevenue
        FROM taxi_lh.dbo.nyc_taxi
        GROUP BY puYear, puMonth
    ),
    RevenueGrowth AS (
        SELECT 
            puYear,
            puMonth,
            TotalRevenue,
            LAG(TotalRevenue) OVER (ORDER BY puYear, puMonth) AS PreviousMonthRevenue
        FROM MonthlyRevenue
    )
    SELECT 
        puYear,
        puMonth,
        TotalRevenue,
        PreviousMonthRevenue,
        CASE 
            WHEN PreviousMonthRevenue = 0 THEN 0
            ELSE ((TotalRevenue - PreviousMonthRevenue) / PreviousMonthRevenue) * 100
        END AS GrowthRate
    FROM RevenueGrowth
    WHERE PreviousMonthRevenue IS NOT NULL
    ORDER BY puYear, puMonth
    OPTION (LABEL = 'q09');
END;