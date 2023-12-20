-- 1) Selezionare tutti gli studenti nati nel 1990 (160)
--per estrapolare tutti i dati degli studenti nati nel 1990 ordinati x nascita in modo ascendente:
SELECT
   *
FROM
    `students`
WHERE
    YEAR(date_of_birth) = 1990
ORDER BY
    date_of_birth ASC;

--per estrapolare tutti i dati degli studenti nati nel 1990 ordinati in ordine alfabetico x cognome
SELECT
    *
FROM
    `students`
WHERE
    YEAR(date_of_birth) = 1990
ORDER BY
    surname ASC;
-- Oppure per estrapolare i dati degli studenti nati nel 1990 ordinati in ordine alfabetico x cognome mostrando solo id, cognome, degree_id, fiscal_code, registratrion_number
SELECT
    id,
    surname,
    degree_id,
    fiscal_code,
    registration_number
FROM
    students
WHERE
    YEAR(date_of_birth) = 1990
ORDER BY
    surname ASC;

-- oppure per estrapolare solo il numero totale degli studenti nati nel 1990
SELECT
    COUNT(*) AS total_students
FROM
    students
WHERE
    YEAR(date_of_birth) = 1990;

--2) Selezionare tutti i corsi che valgono più di 10 crediti (479)

--estrapolare tutti i dati dei corsi con più di 10 cfu:
SELECT
    *
FROM
    `courses`
WHERE
    `cfu` > 10;

--estrapolare i dati di tutti i corsi con più di 10 crediti del primo semestre del primo anno 
SELECT
    *
FROM
    `courses`
WHERE
    `cfu` > 10
    AND `period` = 'I semestre'
    AND `year` = '1';

--Contare i corsi con + di 10 cfu appartenenti al primo semestre del primo anno:
SELECT
    COUNT(*)
FROM
    `courses`
WHERE
    `cfu` > 10
    AND `period` = 'I semestre'
    AND `year` = 1;

--contare tutti i corsi con più di 10 cfu

SELECT
    COUNT(*)
FROM
    `courses`
WHERE
    `cfu` > 10;

-- 3.Selezionare tutti gli studenti che hanno più di 30 anni

-- soluzionw 1 usando un semplice >
SELECT
    *
FROM
    students
WHERE
    date_of_birth < '1994-01-01'
ORDER BY
    date_of_birth ASC;

--soluzione 2 utilizzando DATE_ADD con parametro INTERVAL + 30 anni  < =  DATE ADD con data odierna + 11 giorni per coloro che compiranno 30anni entro il 31/12
SELECT
    *
FROM
    students
WHERE
    DATE_ADD(date_of_birth, INTERVAL 30 YEAR) <= DATE_ADD(CURRENT_DATE(), INTERVAL 11 DAY)
ORDER BY
    date_of_birth ASC;

--ambedue le soluzioni, impostante per il conteggio, danno come risultato 3646 e se ordinate in maniera discendente, il primo risultato ha come data di nascita 27/12/1993

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

--estrapolare tutti i dati dei corsi appartenenti al primo anno, primo semestre, ordinandoli in maniera ascendente per CFU

SELECT
    *
FROM
    `courses`
WHERE
    `year` = '1'
    AND period = 'I semestre'
ORDER BY
    cfu ASC;
-- Contare tutti i corsi del primo anno, primo semestre
SELECT
    COUNT(*)
FROM
    `courses`
WHERE
    `year` = '1'
    AND period = 'I semestre';

--5. 5.Selezionare tutti gli appelli d 'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
--estrapolazione dati
SELECT
    *
FROM
    `exams`
WHERE
    `date` = '2020-06-20'
    AND `hour` > '14:00:00';

--conto 
SELECT
    COUNT(*)
FROM
    `exams`
WHERE
    `date` = '2020-06-20'
    AND `hour` > '14:00:00';

--6.Selezionare tutti i corsi di laurea magistrale (38)
-- estrapolare dati ordinandili in ordine alfabetico x nomr

SELECT
    *
FROM
    `degrees`
WHERE
    `level` = 'magistrale'
ORDER BY
    `name` ASC;
--contare il totale
SELECT
    COUNT(*)
FROM
    `degrees`
WHERE
    `level` = 'magistrale';

--7 Da quanti dipartimenti è composta l 'università? (12)
SELECT
    COUNT(*)
FROM
    `departments`;
--estrapolare dati ordinati in maniera ascendente x id
SELECT
    *
FROM
    `departments`
ORDER BY
    `id` ASC;

-- 8 Quanti sono gli insegnanti che non hanno un numero di telefono ? (50)

--conto del totale 
SELECT
    COUNT(*)
FROM
    `teachers`
WHERE
    `phone` IS NULL
    
--estrapolazione dati semplice ordinata alfabeticamente x cognome
SELECT 
    *
FROM
    `teachers`
WHERE
    `phone` IS NULL
ORDER BY
    `surname` ASC;

--estrapolazione dati mostrando solo id, nome, cognome, telefono, mail, ordinata x id
SELECT
    `id`,
    `name`,
    `surname`,
    `phone`,
    `email`
FROM
    `teachers`
WHERE
    `phone` IS NULL
ORDER BY
    `id` ASC;