SELECT s."name" AS "school", c."name" AS "course", COUNT(e."courseId") AS "studentsCount", e."status" AS "status"
FROM educations AS e
JOIN schools AS s ON s."id" = e."schoolId"
JOIN courses AS c ON c."id" = e."courseId"
WHERE e."status" ILIKE 'ongoing' OR e."status" ILIKE 'finished'
GROUP BY "school", "course", "status"
ORDER BY "studentsCount" DESC
LIMIT 3;