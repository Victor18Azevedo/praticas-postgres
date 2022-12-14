SELECT u."id", u."name", c."name", s."name", e."endDate" FROM users AS u
  JOIN educations AS e ON e."userId" = u."id"
  JOIN courses AS c ON c."id" = e."courseId"
  JOIN schools AS s ON s."id" = e."schoolId"
  WHERE u."id" = 30;