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
-- 4. List the names of students who have taken a course taught by professor v5 (name).
SELECT name FROM Student,
	(SELECT studId FROM Transcript,
		(SELECT crsCode, semester FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;



-- FINAL:
WITH prof_taught AS (
	SELECT crsCode, semester
	FROM Teaching te
	INNER JOIN Professor p 
	  ON te.profId = p.id
	WHERE p.name = @v5
)
SELECT *
FROM Student s 
INNER JOIN Transcript t
  ON s.id = t.studId
WHERE (t.crsCode, t.semester) IN (SELECT crsCode, semester FROM prof_taught);

/* EXPLANATION:
Simplified the query to retrieve courses taught by professor to a CTE.
Simplified join between Student and Transcript to join tables directly.
Utilized the results of the prof_taught CTE inside an IN clause.

Change in Cost:
Original query cost:	17513.72
Tuned query cost:		1533.60

*/