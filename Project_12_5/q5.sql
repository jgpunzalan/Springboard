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
-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND Course.crsCode = Transcript.crsCode
	AND studId NOT IN
	(SELECT studId FROM Transcript, Course WHERE deptId = @v7 AND Course.crsCode = Transcript.crsCode)) as alias
WHERE Student.id = alias.studId;


-- FINAL:
WITH stud_dept AS (
	SELECT DISTINCT t.studId, c.deptId
	FROM Transcript t
	INNER JOIN Course c
      ON c.crsCode = t.crsCode
)
SELECT *
FROM Student s
INNER JOIN (
	SELECT studId
	FROM stud_dept 
    WHERE deptId = @v6) a1
  ON s.id = a1.studId
LEFT JOIN (
	SELECT studId
	FROM stud_dept 
    WHERE deptId = @v7) a2
  ON s.id = a2.studId
WHERE a2.studId IS NULL;


/* EXPLANATION:
Moved the join between Transcript and Course into a CTE.
Added a DISTINCT clause to remove duplicates from the result set.  
Change to a Left JOIN to mimic a MINUS of the data sets.  

Change in Cost:
Original query cost:	4112.69
Tuned query cost:		2841.00

*/