-- Sales per genre--
CREATE VIEW sales_per_genre AS (SELECT Genre, ROUND(SUM((NA_Sales)+ (EU_Sales)+(JP_Sales)+(Other_Sales)),2) AS sales_per_genre
FROM video_game_sales.sales
GROUP BY 1);

-- Number of games per publisher
CREATE VIEW games_per_publisher AS (SELECT Publisher,COUNT(Name)
FROM video_game_sales.sales
GROUP BY 1
ORDER BY 2 DESC);

-- Number Of Games Sold Each Year--

CREATE VIEW number_of_games_sold_each_year AS (SELECT year,COUNT(Name) as number_of_games
FROM video_game_sales.sales
WHERE year IS NOT NULL
GROUP BY 1
ORDER BY 1);

-- Sales Per Platform--

CREATE VIEW sales_per_platform AS (SELECT Platform, ROUND(SUM((NA_Sales)+ (EU_Sales)+(JP_Sales)+(Other_Sales)),2) AS sales_per_game
FROM video_game_sales.sales
GROUP BY 1
ORDER BY 2 DESC);

-- Sales Per region --

CREATE VIEW sales_per_region_ AS(
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
) AS unpivoted_data
GROUP BY Region);
