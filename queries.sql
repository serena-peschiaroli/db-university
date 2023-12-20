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

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
