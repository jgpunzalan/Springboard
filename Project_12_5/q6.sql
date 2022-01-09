USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- ORIGINAL:
-- 6. List the names of students who have taken all courses offered by department v8 (deptId).
SELECT name FROM Student,
	(SELECT studId
	FROM Transcript
		WHERE crsCode IN
		(SELECT crsCode FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))
		GROUP BY studId
		HAVING COUNT(*) = 
			(SELECT COUNT(*) FROM Course WHERE deptId = @v8 AND crsCode IN (SELECT crsCode FROM Teaching))) as alias
WHERE id = alias.studId;


-- FINAL:
WITH crs_count AS (
	SELECT c.deptId, COUNT(DISTINCT c.crsCode) num_crs
	FROM  Course c 
	LEFT JOIN Teaching t
	  ON c.crsCode = t.crsCode
	WHERE deptId = @v8
	GROUP BY c.deptId
  ),
classes_taken AS (
	SELECT s.id, s.name, c.deptId, COUNT(DISTINCT t.crsCode) num_crs
	FROM Student s 
	INNER JOIN Transcript t 
	  ON s.id = t.studId
	INNER JOIN Course c 
	  ON t.crsCode = c.crsCode
	WHERE c.deptId = @v8
	GROUP BY s.id, s.name, c.deptId
  )
SELECT ct.name
FROM classes_taken ct
INNER JOIN crs_count cc 
  ON ct.deptId = cc.deptId
WHERE ct.num_crs = cc.num_crs;

/* EXPLANATION:
Created CTE to calculate the number of courses that have been taught in a given department.
Created CTE to calculate the number of courses a student took in a given department.
Compared the the CTEs to see if the number of courses a student took matches the number of courses a department offered.  

Change in Cost:
Original query cost:	1441.00
Tuned query cost:		452.50

*/