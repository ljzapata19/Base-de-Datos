CREATE TABLE PERS (
    Correo VARCHAR(255),
    NomU VARCHAR(255),
    Nom VARCHAR(255)
);

CREATE TABLE CURSO (
    Nom VARCHAR(255),
    Ch INTEGER
);

CREATE TABLE INSC (
    Correo VARCHAR(255),
    Nom VARCHAR(255),
    Correod VARCHAR(255),
    Nota INTEGER
);

CREATE TABLE DICTA (
    Correo VARCHAR(255),
    Nom VARCHAR(255)
);

CREATE TABLE TEMAS (
    Nom VARCHAR(255),
    Tema VARCHAR(255)
);
-- Insertar datos en la tabla PERS
INSERT INTO PERS (Correo, NomU, Nom)
VALUES
    ('anagarcia32@gmail.com','AnaGarcia131','Ana Garcia'),
    ('pablogomes45@gmail.com','Pablito45','Pablo Gomes'),
    ('rubengonzales104@gmail.com','RubenG10','Ruben Gonzales'),
    ('estefaniaperalta@gmail.com','Estefania22','Estefania Peralta'),
    ('gonzaloramos1978@yahoo.com.ar','GonzaloR78','Gonzalo Ramos');

-- Insertar datos en la tabla CURSO
INSERT INTO CURSO (Nom, Ch)
VALUES
    ('Javascript I', 50),
    ('Javascript II', 38),
    ('SQL', 25);

-- Insertar datos en la tabla INSC
INSERT INTO INSC (Correo, Nom, Correod, Nota)
VALUES
    ('anagarcia56@gmail.com', 'Javascript I', 'pablogomes45@gmail.com', 7),
    ('gisellevasquez201@yahoo.com.ar', 'Javascript I', 'pablogomes45@gmail.com', 8),
    ('gisellevasquez201@yahoo.com.ar', 'Javascript II', 'pablogomes45@gmail.com', 7),
    ('giselleV146@gmail.com', 'Javascript II', 'pablogomes45@gmail.com', 7);

-- Insertar datos en la tabla DICTA
INSERT INTO DICTA (Correo, Nom)
VALUES
    ('pedroibañez@yahoo.com.ar', 'Kotlin I'),
    ('gonzaloramos1978@yahoo.com.ar', 'Python I'),
    ('gonzaloramos1978@yahoo.com.ar', 'SQL'),
    ('pablogomes45@gmail.com', 'Javascript I'),
    ('pablogomes45@gmail.com', 'Javascript II');

-- Insertar datos en la tabla TEMAS
INSERT INTO TEMAS (Nom, Tema)
VALUES
    ('Python I', 'Estructuras de datos'),
    ('Python I', 'Caracteristicas'),
    ('Python II', 'Aplicacion'),
    ('Python II', 'Caracteristicas'),
    ('Javascript I', 'Estructuras de datos'),
    ('Javascript I', 'Estructuras de control'),
    ('Javascript I', 'Aplicacion'),
    ('Javascript I', 'Caracteristicas'),
    ('Javascript II', 'Estructuras de datos'),
    ('Javascript II', 'Estructuras de control'),
    ('Javascript II', 'Aplicacion'),
    ('Javascript II', 'Caracteristicas'),
    ('Kotlin I', 'Estructuras de control'),
    ('Kotlin I', 'Caracteristicas'),
    ('Kotlin II', 'Estructuras de datos'),
    ('Kotlin II', 'Estructuras de control'),
    ('Kotlin II', 'Aplicacion'),
    ('Kotlin II', 'Caracteristicas');
-- 2
INSERT INTO PERS (correo, nomu, nom) VALUES 
('anagarcia56@gmail.com', 'AnaG56', 'Ana Garcia'),
('franciscopeña52@yahoo.com.ar', 'FranPeña865', 'Gonzalo Ramos'),
('pedroibañez@yahoo.com.ar', 'PedroIbañez223', 'Pedro Ibañez'),
('gisellevasquez201@yahoo.com.ar', 'Giselle201', 'Giselle Vasquez'),
('giselleV146@gmail.com', 'GVasquez24', 'Giselle Vasquez');

--3
INSERT INTO CURSO (nom, ch) VALUES 
('Python I', 29),
('Python II', 28),
('Kotlin I', 45),
('Kotlin II', 42);

--4
INSERT INTO TEMAS (nom, tema) VALUES 
('Python I', 'Estructuras de control'),
('Python I', 'Aplicacion'),
('Python II', 'Estructuras de datos'),
('Python II', 'Estructuras de control'),
('Kotlin I', 'Estructuras de datos'),
('Kotlin I', 'Aplicacion');

--5
INSERT INTO DICTA (correo, nom) VALUES 
('estefaniaperalta@gmail.com', 'Python I'),
('estefaniaperalta@gmail.com', 'Python II'),
('gonzaloramos1978@yahoo.com.ar', 'Kotlin I'),
('gonzaloramos1978@yahoo.com.ar', 'Kotlin II');

--6
INSERT INTO INSC (correo, nom, correod, nota) VALUES 
('anagarcia32@gmail.com', 'Python I', 'estefaniaperalta@gmail.com', 7),
('franciscopeña52@yahoo.com.ar', 'Python I', 'estefaniaperalta@gmail.com', 9),
('anagarcia32@gmail.com', 'Python II', 'pedroibañez@yahoo.com.ar', 8),
('anagarcia56@gmail.com', 'Python II', 'estefaniaperalta@gmail.com', 6),
('pedroibañez@yahoo.com.ar', 'Python I', 'estefaniaperalta@gmail.com', 9),
('rubengonzales104@gmail.com', 'Kotlin I', 'gonzaloramos1978@yahoo.com.ar', 8),
('rubengonzales104@gmail.com', 'Kotlin II', 'gonzaloramos1978@yahoo.com.ar', 6);

-- 7
INSERT INTO CURSO (nom, ch) VALUES ('Ruby',35);
UPDATE CURSO SET ch=60 WHERE nom = 'Ruby';
SELECT * FROM CURSO ;
--8 
DELETE FROM CURSO WHERE nom='Ruby';

--9
SELECT correo, nom FROM PERS

--10
SELECT count(distinct nom) FROM CURSO

--11
SELECT count(distinct correo) FROM DICTA;

--12
SELECT Max(nota) FROM INSC WHERE nom='Python I'

--13
SELECT nom FROM CURSO ORDER BY nom

--14
SELECT * FROM CURSO WHERE ch >(SELECT ch FROM CURSO WHERE nom IN 
	(SELECT nom FROM DICTA WHERE correo='pedroibañez@yahoo.com.ar'))

-- 15 
INSERT INTO PERS (correo, nomu, nom) VALUES ('rosaluna@gmail.com', 'RosiL596', 'Rosa');
DELETE FROM PERS WHERE nom='Rosa'
SELECT * FROM PERS WHERE nom = 'Rosa'

--16
SELECT NOM FROM CURSO WHERE ch>(SELECT ch FROM CURSO WHERE nom='Kotlin I') ORDER BY ch ASC

--17
SELECT * FROM CURSO WHERE ch>40

--18
SELECT * FROM CURSO WHERE 40<ch and ch<45

--19
SELECT * FROM DICTA	
SELECT NOM, CORREO FROM PERS NATURAL JOIN (SELECT distinct CORREO FROM DICTA)

--20
SELECT curso.nom, pers.correo, pers.nomu, pers.nom  FROM DICTA JOIN CURSO ON CURSO.nom=DICTA.nom JOIN pers on pers.correo= DICTA.correo;

--21
SELECT * FROM CURSO LEFT OUTER JOIN INSC ON CURSO.nom = INSC.nom LEFT OUTER JOIN PERS ON PERS.correo=INSC.correo

--22
SELECT * FROM PERS JOIN DICTA ON PERS.correo=DICTA.correo and DICTA.nom = 'Python I'

--23
SELECT * FROM PERS JOIN DICTA ON PERS.correo=DICTA.correo and DICTA.nom = 'Python II'

--24
(SELECT PERS.correo FROM PERS JOIN DICTA ON PERS.correo=DICTA.correo and DICTA.nom = 'Python I') UNION (SELECT PERS.correo FROM PERS JOIN DICTA ON PERS.correo=DICTA.correo and DICTA.nom = 'Python II')

--25
(SELECT PERS.correo FROM PERS JOIN DICTA ON PERS.correo=DICTA.correo and DICTA.nom = 'Python I') INTERSECT (SELECT PERS.correo FROM PERS JOIN DICTA ON PERS.correo=DICTA.correo and DICTA.nom = 'Python II')

--26
SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC INTERSECT SELECT DICTA.correo FROM DICTA)

--27
SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC WHERE INSC.nom='Kotlin I')

--28
SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC WHERE INSC.nom='Kotlin II')

--29
(SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC WHERE INSC.nom='Kotlin I')) INTERSECT (SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC WHERE INSC.nom='Kotlin II'))

--30
(SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC WHERE INSC.nom='Python I' and INSC.nota>6 )) 
	INTERSECT
	(SELECT * FROM PERS NATURAL JOIN (SELECT INSC.correo FROM INSC WHERE INSC.nom='Python II' and INSC.nota>6 ))

--31
SELECT distinct INSC.correo FROM INSC,INSC AS AUX WHERE INSC.correo=AUX.correo and INSC.nom!=AUX.nom

--32
SELECT distinct DICTA.correo FROM DICTA,DICTA AS AUX WHERE DICTA.correo=AUX.correo and DICTA.nom!=AUX.nom

--33
WITH DICTAINF AS (
	SELECT DICTA.CORREO, DICTA.NOM 
	FROM DICTA 
	JOIN CURSO ON DICTA.nom = CURSO.nom 
	WHERE CH<30
), 
DICTAINFAUX AS (
	SELECT DICTAINF.CORREO 
	FROM DICTAINF,DICTAINF AS AUX 
	WHERE DICTAINF.CORREO=AUX.CORREO AND DICTAINF.NOM!=AUX.NOM
)
SELECT distinct PERS.CORREO, PERS.NOMU, PERS.NOM
	FROM PERS
	JOIN DICTAINFAUX ON PERS.CORREO=DICTAINFAUX.CORREO;

--34 
WITH AlumnosCursos AS (
    SELECT 
        correo,
        STRING_AGG(nom, ',') AS cursos
    FROM 
        INSC
    GROUP BY 
        correo
)
SELECT 
    a1.correo AS alumno1_correo,
    a2.correo AS alumno2_correo
FROM 
    AlumnosCursos a1
INNER JOIN 
    AlumnosCursos a2 ON a1.cursos = a2.cursos AND a1.correo < a2.correo
ORDER BY 
    alumno1_correo, alumno2_correo;


SELECT a1.correo AS alumno1_correo, a2.correo AS alumno2_correo
FROM INSC a1
JOIN INSC a2 ON a1.correo < a2.correo
GROUP BY a1.correo, a2.correo
HAVING COUNT(a1.nom) = COUNT(a2.nom)
   AND COUNT(a1.nom) = (
       SELECT COUNT(*)
       FROM INSC a3
       WHERE a3.correo = a1.correo AND EXISTS (
           SELECT 1
           FROM INSC a4
           WHERE a4.correo = a2.correo AND a4.nom = a3.nom
       )
   );

--35. Pares de Alumnos (todos los datos) que cursaron los mismos cursos

--36. Pares de Alumnos que cursaron los mismos cursos con distinto profesor.

--37. division en alg rel
INSERT INTO PERS (Correo, NomU, Nom) VALUES     ('fz@gmail.com','fseasd','freyh asdda');
delete from pers where correo='fz@gmail.com'
select * from insc
delete from INSC where correo='fz@gmail.com'
	('fz@gmail.com', 'Javascript I', 'pablogomes45@gmail.com', 7),
	('fz@gmail.com', 'Javascript II', 'pablogomes45@gmail.com', 7),
	('fz@gmail.com', 'SQL', 'pablogomes45@gmail.com', 7),
	('fz@gmail.com', 'Python I', 'estefaniaperalta@gmail.com', 7),
	('fz@gmail.com', 'Python II', 'pablogomes45@gmail.com', 7),
	('fz@gmail.com', 'Kotlin I', 'gonzaloramos1978@yahoo.com.ar', 7),
	('fz@gmail.com', 'Kotlin II', 'gonzaloramos1978@yahoo.com.ar', 7);
	
	
select * 
	from pers 
	where not exists 
	(select * 
	from curso
	where not exists
		(select * 
		from insc 
		where insc.correo=pers.correo
		and insc.nom=curso.nom));

--38
with cursospedro as (
	select nom
	from dicta
	where correo= 'pedroibañez@yahoo.com.ar'
)
select pers.correo, pers.nomu, pers.nom
	from pers
	join 
	(select * from insc join cursospedro on insc.nom=cursospedro.nom) as aux on pers.correo=aux.correo;

--39
select * from curso where ch=(select max(ch) from curso)

--40
create view Cursoscortos as 
select curso.nom, curso.ch from curso natural join (select ch from curso where ch<40)

select * from Cursoscortos
	
--41
select * from Cursoscortos order by nom asc

--42
create view Alumnos_python1 as
select pers.* from pers join insc on pers.correo=insc.correo where insc.nom='Python I'

--43
select * from Alumnos_python1 where correo like '%@gmail.com'

