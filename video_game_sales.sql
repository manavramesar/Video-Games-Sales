-- Table -- 
SELECT *
FROM video_game_sales.sales;

-- Sales Per Genre -- 
SELECT Genre, ROUND(SUM((NA_Sales)+ (EU_Sales)+(JP_Sales)+(Other_Sales)),2) AS sales_per_genre
FROM video_game_sales.sales
GROUP BY 1;

-- Number Of Games Per Publisher -- 
SELECT Publisher,COUNT(Name)
FROM video_game_sales.sales
GROUP BY 1
ORDER BY 2 DESC;

-- Number of games sold each year -- 
SELECT year,COUNT(Name) as number_of_games
FROM video_game_sales.sales
WHERE year IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- Sales Per Platform --
SELECT Platform, ROUND(SUM((NA_Sales)+ (EU_Sales)+(JP_Sales)+(Other_Sales)),2) AS sales_per_game
FROM video_game_sales.sales
GROUP BY 1
ORDER BY 2 DESC;

-- Sales Per region --

SELECT
    Region,
    ROUND(SUM(Sales),2) AS TotalSales
FROM (
    SELECT 'NA Sales' AS Region, NA_Sales AS Sales FROM video_game_sales.sales
    UNION ALL
    SELECT 'EU Sales', EU_Sales FROM video_game_sales.sales
    UNION ALL
    SELECT 'JP Sales', JP_Sales FROM video_game_sales.sales
    UNION ALL
    SELECT 'Rest Of World Sales', Other_Sales FROM video_game_sales.sales
) AS a
GROUP BY Region;


