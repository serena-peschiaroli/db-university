--1. Contare quanti iscritti ci sono stati ogni anno

SELECT
    YEAR(enrolment_date) AS enrollment_year,
    COUNT(*) AS total_students
FROM
    students
GROUP BY
    YEAR(enrolment_date)
ORDER BY
    enrollment_year ASC;

--2.Contare gli insegnanti che hanno l 'ufficio nello stesso edificio

SELECT
    office_address,
    COUNT(*) as total_teachers
FROM
    teachers
GROUP BY
    office_address
ORDER BY
    total_teachers ASC;

--3.Calcolare la media dei voti di ogni appello d 'esame
SELECT
    exam_student.exam_id,
    AVG(vote) AS average_vote
FROM
    exam_student
GROUP BY
    exam_student.exam_id
ORDER BY
    average_vote ASC;

--4.Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT
    department_id,
    COUNT(*) AS number_of_degrees
FROM
    degrees
GROUP BY
    department_id;
