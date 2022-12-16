SELECT COUNT(id) AS currentExperiences
FROM experiences
WHERE "endDate" IS NOT NULL;