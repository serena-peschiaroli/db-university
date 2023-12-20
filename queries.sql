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
    (
        SELECT
            *
        FROM
            students
        WHERE
            YEAR(date_of_birth) = 1990
    ) AS students_born_in_1990;

--2) Selezionare tutti i corsi che valgono più di 10 crediti (479)