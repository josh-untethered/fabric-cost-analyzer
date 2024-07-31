CREATE PROCEDURE dbo.Query3
AS
BEGIN
    SET NOCOUNT ON;

    -- Query 3: Total Revenue by Vendor and Payment Type
    SELECT 
        vendor_id,
        payment_type,
        SUM(CAST(total_amount AS FLOAT)) AS TotalRevenue
    FROM taxi_lh.dbo.nyc_taxi
    GROUP BY vendor_id, payment_type
    ORDER BY TotalRevenue DESC
    OPTION (LABEL = 'q03');
END;