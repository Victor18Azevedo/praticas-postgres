SELECT u."id", u."name", c."name" AS course, s."name" AS school, e."endDate" FROM users AS u
  JOIN schools AS s ON e."schoolId" = s."id"
  JOIN courses AS c ON e."courseId" = c."id"
  JOIN educations AS e ON e."userId" = u."id";