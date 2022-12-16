SELECT MAX(j."salary") AS "maximumSalary", r."name" AS "role"
FROM jobs AS j
JOIN roles AS r ON r."id" = j."roleId"
WHERE j."active" IS TRUE
GROUP BY  r."name"
ORDER BY "maximumSalary" DESC;