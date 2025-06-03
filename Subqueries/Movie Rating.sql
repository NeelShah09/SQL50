-- Write your PostgreSQL query statement below
(SELECT name results FROM (
    SELECT name, COUNT(*) num_rated_movies
    FROM MovieRating mr JOIN Users u ON mr.user_id = u.user_id
    GROUP BY name
    ORDER BY num_rated_movies DESC, name
) LIMIT 1
)
UNION ALL
(SELECT title results FROM (
    SELECT title, AVG(rating) avg_rating
    FROM MovieRating mr JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE TO_CHAR(created_at,'YYYY-MM') = '2020-02'
    GROUP BY title
    ORDER BY avg_rating DESC, title
) LIMIT 1)