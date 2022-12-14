SELECT u."id", u."name", r."name" AS "role", c."name" AS "company", e."startDate" FROM users AS u
  JOIN experiences AS e ON e."userId" = u."id"
  JOIN roles AS r ON r."id" = e."roleId"
  JOIN companies AS c ON c."id" = e."companyId"
  WHERE u."id" = 50 AND e."endDate" IS NULL;