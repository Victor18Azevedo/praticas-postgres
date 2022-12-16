SELECT u."name" AS "writer", COUNT(t."writerId") AS "testimonialCount"
FROM testimonials AS t
JOIN users AS u ON u."id" = t."writerId"
WHERE t."writerId" = 435
GROUP BY  u."name";