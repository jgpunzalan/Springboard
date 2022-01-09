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
-- 3. List the names of students who have taken course v4 (crsCode).
SELECT name FROM Student WHERE id IN (SELECT studId FROM Transcript WHERE crsCode = @v4);


-- FINAL:
select *
from student s 
left join transcript  t
  on s.id = t.studid
where crscode = @v4;


/* EXPLANATION:
Changed subquery to a join as joins can be more efficient.  Saw a small improvement in query cost.  

Change in Cost:
Original query cost:	414.29
Tuned query cost:		411.37
*/