SELECT t."id", w."name" AS writer, r."name" AS recipient, t."message" FROM testimonials AS t
  JOIN users AS w ON t."writerId" = w."id"
  JOIN users AS r ON t."recipientId" = r."id"
  ORDER BY t."id";