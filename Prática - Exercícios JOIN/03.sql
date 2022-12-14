SELECT u."id", u."name", c."name" AS course, s."name" AS school, e."endDate" FROM users AS u
  JOIN educations AS e ON e."userId" = u."id"
  JOIN courses AS c ON c."id" = e."courseId"
  JOIN schools AS s ON s."id" = e."schoolId"
  WHERE u."id" = 30 AND e."status" ILIKE 'finished';