##Diagramma dipartimento universitario

**piattaforma utilizzata: https://dbdiagram.io/** */

Link: https://dbdiagram.io/d/Diagramma_dipartimento_universitario-658215fe56d8064ca057940f

**Relazioni tra le tabelle:**

1. **Tabella Dipartimenti:**

    - Relazione 1 a molti con Corsi_di_Laurea (ogni dipartimento può offrire più corsi di laurea).
    - Relazione 1 a molti con Insegnanti (ogni dipartimento può avere più insegnanti).
    
2. **Tabella Corsi_di_Laurea:**

Relazione molti a 1 con Dipartimenti (ogni corso di laurea appartiene a un solo dipartimento).
Relazione 1 a molti con corso_di_studio (ogni corso di laurea include più corsi di studio).
Relazione 1 a molti con Studenti (ogni corso di laurea ha molti studenti iscritti).
Tabella corso_di_studio:

Relazione molti a 1 con Corsi_di_Laurea (ogni corso di studio è parte di un solo corso di laurea).
Relazione molti a molti con Insegnanti (gestita dalla tabella Corso_Singolo_Insegnanti, un insegnante può insegnare più corsi di studio e un corso di studio può avere più insegnanti).
Relazione 1 a molti con Appello_d_Esame (ogni corso di studio può avere più appelli d'esame).
Tabella Insegnanti:

Relazione molti a 1 con Dipartimenti (ogni insegnante appartiene a un solo dipartimento).
Relazione molti a molti con corso_di_studio (un insegnante può insegnare più corsi di studio e un corso di studio può essere insegnato da più insegnanti).
Tabella Corso_Singolo_Insegnanti (tabella di associazione):

Collega Insegnanti con corso_di_studio per gestire la relazione molti a molti tra queste entità.
Tabella Studenti:

Relazione molti a 1 con Corsi_di_Laurea (ogni studente è iscritto a un solo corso di laurea).
Relazione molti a molti con Appello_d_Esame (gestita dalla tabella Esami_Studenti, uno studente può iscriversi a molti esami e un esame può avere molti studenti iscritti).
Tabella Appello_d_Esame:

Relazione molti a 1 con corso_di_studio (ogni appello d'esame è associato a un solo corso di studio).
Relazione molti a molti con Studenti (gestita dalla tabella Esami_Studenti, un esame può avere molti studenti iscritti e uno studente può iscriversi a molti esami).
Tabella Esami_Studenti (tabella di associazione):

Collega Studenti con Appello_d_Esame per gestire la relazione molti a molti tra queste entità.
