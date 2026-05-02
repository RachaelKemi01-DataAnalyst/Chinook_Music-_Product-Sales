--join sales table with products table to  calculate 
--Total Revenue per playlist

CREATE OR REPLACE VIEW 
PlayList_Total_Revenue_vIEW AS
WITH PlayList_Total_Revenue AS(
SELECT
P.name AS PlayList_Name,
COALESCE(il.UnitPrice * il.Quantity,0) as Total_Revenue
from Playlists as P
left JOIN PlayListtrack PT on P.playlistid =PT.playlistid
left JOIN  Track T  on PT.Trackid= T.trackid
JOIN Invoice_line il on T.trackid= il.Trackid
GROUP BY PlayList_Name, il.unitprice, il.Quantity

)
select
*
FROM Playlist_Total_Revenue
order by Total_Revenue DESC;

SELECT * FROM PlayList_Total_Revenue_vIEW;

--Revenue per Album
CREATE OR REPLACE VIEW
Album_Total_Revenue_VIEW AS
WITH Album_Total_Revenue AS(
SELECT
A.title as AlbumName,
T.UnitPrice AS UNIT_Price,
COALESCE(COUNT(A.ALBUMID)* T.unitprice)  AS TOTAL_REVENUE
FROM Album AS A
LEFT JOIN Track T on A.albumid=t.albumid
GROUP BY A.title, unit_price
)
SELECT 
Albumname,
total_Revenue
from
ALBUM_Total_Revenue
ORDER BY Total_Revenue desc
limit 10;

SELECT * FROM Album_Total_Revenue_VIEW;

---totalrevenue by region
CREATE OR REPLACE VIEW 
Region_Total_Revenue_VIEW AS
WITH Region_Total_Revenue as(
SELECT
c.country,
SUM(i.total) AS Total_Revenue
FROM
invoice as i
LEFT JOIN Customers c on i.customerid = c.customerid
GROUP BY  c.country

)
SELECT 
*
FROM Region_Total_Revenue
ORDER BY 
Total_Revenue;

SELECT * FROM Region_Total_Revenue_VIEW


--GENRE_TOTAL_REVENUE
CREATE OR REPLACE VIEW 
GENRE_TOTAL_REVENUE_VIEW AS 
WITH GENRE_TOTAL_REVENUE AS(
SELECT
G.NAME AS Genre_name,
T.uNITpRICE AS UNITPRICE,
COALESCE(COUNT(G.GENREID) * UNITPRICE,0) AS TOTAL_REVENUE
FROM 
GENRE AS G
LEFT JOIN TRACK T ON G.GENREID= T.GENREID
GROUP BY Genre_name, UNITPRICE
)
SELECT 
*
FROM GENRE_tOTAL_rEVENUE
ORDER BY TOTAL_REVENUE DESC;

SELECT *
FROM GENRE_TOTAL_REVENUE_VIEW;


--MEDIA_REVENUE
WITH mEDIA_TYPE_REVENUE AS(
SELECT
M.NAME AS MEDIA_NAME,
T.UNITPRICE AS UNITPRICE,
COALESCE(COUNT(M.MEDIATYPEID) * UNITPRICE,0) AS TOTAL_rEVENUE
FROM
MEDIATYPE AS M
LEFT JOIN TRACK T ON M.MEDIATYPEID = T.MEDIATYPEID
GROUP BY MEDIA_NAME, UNITPRICE
)

SELECT 
MEDIA_NAME,
TOTAL_REVENUE
FROM
mEDIA_TYPE_REVENUE;

--YEARLY PERFORMANCE
CREATE OR REPLACE VIEW 
YEARLY_REVENUE_VIEW AS 
WITH YEARLY_rEVENUE AS(
SELECT
EXTRACT ( YEAR FROM INVOICEDATE) AS YEAR,
SUM(TOTAL) AS TOTAL_rEVENUE
FROM INVOICE
GROUP BY YEAR
)
SELECT * FROM yEARLY_REVENUE;

SELECT * FROM YEARLY_REVENUE_VIEW;

--MONTHLY PERFORMANCE
CREATE OR REPLACE VIEW 
MONTHLY_RANKS AS
WITH monthly_revenue AS (
    SELECT
        TO_CHAR(invoicedate, 'Month') AS month_name,
        
        SUM(total) AS total_revenue,
		RANK() OVER (ORDER BY SUM(TOTAL) DESC) AS monthly_rank
    FROM invoice
    GROUP BY month_namE
)

SELECT
    *
    
FROM monthly_revenue;

SELECT * FROM mONTHLY_rANKS;




--
