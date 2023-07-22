UPDATE professor
SET salary = 
	CASE 
		WHEN salary > 100000 THEN salary * 1.03
		ELSE salary * 1.04
	END;



SELECT student_id FROM advisement
WHERE professor_id  = 'P001'
INTERSECT
SELECT student_id FROM advisement
WHERE professor_id = 'P002';





SELECT zip_code 
FROM student
GROUP BY zip_code
HAVING COUNT(*) > 100;



SELECT professor_id
FROM professor
WHERE professor_id NOT IN (SELECT professor_id FROM advisement);




SELECT professor.professor_id
FROM professor left outer join advisement on professor.professor_id = advisement.professor_id
where advisement.professor_id IS NULL;



SELECT advisement.student_id
FROM advisement
where advisement.professor_id = some(SELECT advisement.professor_id from advisement	
	where advisement.student_id = 'S001');



SELECT advisement.student_id
FROM advisement, professor 
WHERE NOT EXISTS( 
       SELECT DISTINCT professor.professor_id
        WHERE advisement.professor_id = professor.professor_id
        and advisement.student_id = 'S001');

       
       
       
       
SELECT advisement.professor_id
FROM advisement
GROUP BY advisement.professor_id
HAVING COUNT(*) = 
(
	SELECT MAX(count)
	FROM(SELECT COUNT(*) AS count FROM advisement GROUP BY professor_id)
AS counts);

