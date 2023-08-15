CREATE VIEW sales_per_genre AS (SELECT Genre, ROUND(SUM((NA_Sales)+ (EU_Sales)+(JP_Sales)+(Other_Sales)),2) AS sales_per_genre
FROM video_game_sales.sales
GROUP BY 1);


CREATE VIEW games_per_publisher AS (SELECT Publisher,COUNT(Name)
FROM video_game_sales.sales
GROUP BY 1
ORDER BY 2 DESC);

CREATE VIEW number_of_games_sold_each_year AS (SELECT year,COUNT(Name) as number_of_games
FROM video_game_sales.sales
WHERE year IS NOT NULL
GROUP BY 1
ORDER BY 1);

CREATE VIEW sales_per_platform AS (SELECT Platform, ROUND(SUM((NA_Sales)+ (EU_Sales)+(JP_Sales)+(Other_Sales)),2) AS sales_per_game
FROM video_game_sales.sales
GROUP BY 1
ORDER BY 2 DESC);