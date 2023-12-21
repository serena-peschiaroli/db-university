--1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT
    students.surname,
    students.registration_number,
    students.enrolment_date
FROM
    students
    JOIN degrees ON students.degree_id = degrees.id
WHERE
    degrees.name = 'Corso di Laurea in Economia'
ORDER BY
    students.surname ASC;
--conto totale
SELECT
    COUNT(*) as total_economy_students
FROM
    students
    JOIN degrees ON students.degree_id = degrees.id
WHERE
    degrees.name = 'Corso di Laurea in Economia';

--unire la tabella studenti con la tabella degrees per fitrare gli studenti per corso di laurea in economia + unendo la tabella exam_student per accedere ai voti per oggni studente e mostrato AVG 
SELECT
    students.surname,
    students.registration_number,
    AVG(exam_student.vote) AS average_vote
FROM
    students
    JOIN degrees ON students.degree_id = degrees.id
    JOIN exam_student ON students.id = exam_student.student_id
WHERE
    degrees.name = 'Corso di Laurea in Economia'
GROUP BY
    students.surname,
    students.registration_number
ORDER BY
    students.surname;

---2.Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze


SELECT
    degrees.name AS degree_name,
    degrees.id AS degree_id,
    departments.name AS department_name
FROM
    degrees
    JOIN departments ON degrees.department_id = departments.id
WHERE
    degrees.level = 'Magistrale'
    AND departments.name = 'Dipartimento di Neuroscienze';

--3.Selezionare tutti i corsi in cui insegna Fulvio Amato (id = 44)
SELECT
    courses.name,
    courses.period,
    teachers.name,
    teachers.surname
FROM
    courses
    JOIN course_teacher ON courses.id = course_teacher.course_id
    JOIN teachers ON course_teacher.teacher_id = teachers.id
WHERE
    teachers.id = 44;

--per mostrare anche nome del corso di laurea 
SELECT
    courses.name AS course_name,
    courses.period,
    teachers.name AS first_name,
    teachers.surname AS last_name,
    degrees.name AS degree_name
FROM
    courses
    JOIN course_teacher ON courses.id = course_teacher.course_id
    JOIN teachers ON course_teacher.teacher_id = teachers.id
    JOIN degrees ON courses.degree_id = degrees.id
WHERE
    teachers.id = 44
ORDER BY
    courses.period;

-- 4.Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT
    students.surname,
    students.name,
    degrees.name AS degree_name,
    departments.name AS department_name
FROM
    students
    JOIN degrees ON students.degree_id = degrees.id
    JOIN departments ON degrees.department_id = departments.id
ORDER BY
    students.surname,
    students.name;

--5.Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT
    degrees.name AS degree_name,
    degrees.level,
    courses.name AS course_name,
    teachers.name AS teacher_first_name,
    teachers.surname AS teacher_last_name
FROM
    degrees
    JOIN courses ON courses.degree_id = degrees.id
    JOIN course_teacher ON courses.id = course_teacher.course_id
    JOIN teachers ON course_teacher.teacher_id = teachers.id
ORDER BY
    degrees.name ASC;

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT
    DISTINCT teachers.name AS teacher_name,
    teachers.surname AS teacher_surname
FROM
    teachers
    JOIN course_teacher ON teachers.id = course_teacher.teacher_id
    JOIN courses ON course_teacher.course_id = courses.id
    JOIN degrees ON courses.degree_id = degrees.id
    JOIN departments ON degrees.department_id = departments.id
WHERE
    departments.name = 'Dipartimento di Matematica';

--7.Selezionare per ogni studente quanti tentativi d ’ esame ha sostenuto per superare ciascuno dei suoi esami