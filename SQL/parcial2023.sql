-- Tabla Lugar
CREATE TABLE Lugar (
    codL INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    altura INTEGER,
    país VARCHAR(100),
    latitud DECIMAL(10, 6),
    longitud DECIMAL(10, 6)
);

-- Tabla Competencia
CREATE TABLE Competencia (
    num INTEGER PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_i DATE,
    dificultad INTEGER CHECK (dificultad BETWEEN 1 AND 6),
    codL INTEGER,
    FOREIGN KEY (codL) REFERENCES Lugar(codL)
);

-- Tabla Competidor
CREATE TABLE Competidor (
    cuil CHAR(11) PRIMARY KEY,
    nya VARCHAR(100),
    sexo CHAR(1) CHECK (sexo IN ('M', 'F')),
    telc VARCHAR(15),
    twitter VARCHAR(50),
    cantseg INTEGER
);

-- Tabla Participa
CREATE TABLE Participa (
    cuil CHAR(11),
    num INTEGER,
    cumbre CHAR(2) CHECK (cumbre IN ('SI', 'NO')),
    PRIMARY KEY (cuil, num),
    FOREIGN KEY (cuil) REFERENCES Competidor(cuil),
    FOREIGN KEY (num) REFERENCES Competencia(num)
);

-- Insertar datos en Lugar
INSERT INTO Lugar (codL, nombre, altura, país, latitud, longitud) VALUES
(2600, 'Everest', 8848, 'Nepal', 27.9881, 86.9250),
(2601, 'Aconcagua', 6960, 'Argentina', -32.6532, -70.0109),
(2602, 'Los Alpes', 4810, 'Francia', 45.8326, 6.8652),
(2603, 'Himalaya', 8848, 'Nepal', 27.9881, 86.9250);

-- Insertar datos en Competencia
INSERT INTO Competencia (num, nombre, fecha_i, dificultad, codL) VALUES
(1001, 'Competencia Everest 2023', '2023-05-15', 5, 2600),
(1002, 'Competencia Aconcagua 2023', '2023-02-20', 4, 2601),
(1003, 'Competencia Alpes 2023', '2023-03-10', 3, 2602),
(1004, 'Competencia Himalaya 2023', '2023-04-05', 6, 2603);

-- Insertar datos en Competidor
INSERT INTO Competidor (cuil, nya, sexo, telc, twitter, cantseg) VALUES
(1, 'Juan Perez', 'M', '123456789', '@juanperez', 1500),
(2, 'Ana Gomez', 'F', '987654321', '@anagomez', 2000),
(3, 'Carlos Sanchez', 'M', '456789123', '@carlossanchez', 1200),
(4, 'Luis Martinez', 'M', '789123456', '@luismartinez', 900);

-- Insertar datos en Participa
INSERT INTO Participa (cuil, num, cumbre) VALUES
(1, 1001, 'SI'),
(2, 1002, 'NO'),
(3, 1003, 'SI'),
(4, 1004, 'SI'),
(1, 1002, 'NO'),
(3, 1004, 'SI');

-- Insertar más datos en Competidor
INSERT INTO Competidor (cuil, nya, sexo, telc, twitter, cantseg) VALUES
(5, 'Mario Lopez', 'M', '1122334455', '@mariolopez', 1100),
(6, 'Sofia Ramirez', 'F', '9988776655', '@sofiaramirez', 1400),
(7, 'Pedro Torres', 'M', '6677889900', '@pedrotorres', 1300),
(8, 'Lucia Fernandez', 'F', '5566778899', '@luciafernandez', 1700),
(9, 'David Martinez', 'M', '2233445566', '@davidmartinez', 1200),
(10, 'Carla Gomez', 'F', '3344556677', '@carlagomez', 1600);

-- Insertar más datos en Participa
INSERT INTO Participa (cuil, num, cumbre) VALUES
(5, 1001, 'SI'),
(5, 1002, 'SI'),
(5, 1004, 'NO'),
(6, 1001, 'NO'),
(7, 1001, 'SI'),
(7, 1003, 'SI'),
(7, 1004, 'SI'),
(8, 1001, 'SI'),
(8, 1003, 'NO'),
(8, 1004, 'SI'),
(9, 1003, 'SI'),
(9, 1004, 'NO'),
(10, 1001, 'NO'),
(10, 1003, 'SI');


--1.Para el lugar con código 2600, competencias (nombre) que se realizaron junto a la cantidad de participantes.
select nombre, count(*)
from competencia natural join participa
where codl=2600
group by nombre

--2. Competencias (nombre y dificultad) realizadas en Los Alpes en el 2023.
select competencia.nombre, dificultad
from competencia join lugar on competencia.codl=lugar.codl
where extract (year from fecha_i)=2023
	and lugar.nombre='Los Alpes'

--3. Competencias (todos los datos) en las que participaron solamente hombres.
select distinct competencia.*
from competencia natural join participa natural join competidor 
where num not in (select num
	from participa natural join competidor
	where sexo='F')
order by num

--4. Competidores (todos sus datos) que escalaron el Himalaya pero no escalaron el Aconcagua.
select *
from competidor natural join (
	select cuil
	from (participa natural join competencia)
			join lugar on competencia.codl=lugar.codl
	where lugar.nombre='Himalaya'
	and cuil not in (select cuil
				from (participa natural join competencia)
						join lugar on competencia.codl=lugar.codl
				where lugar.nombre='Aconcagua')
)

--5. Competencias (todos los datos) en las que hicieron cumbre como mínimo 5 hombres.
select *
from competencia natural join (
				select num
				from competidor natural join participa natural join competencia
				where sexo='M' and cumbre='SI'
				group by num
				having count(*)>=5
)

--6. Cantidad de lugares en los que se realizaron competencias con dificultad 3.
select count(distinct *)
from competencia join lugar on competencia.codl=lugar.codl
where dificultad =3

--7. Twitter de los competidores que han participado en todas las competencias realizadas en el año 2021.
select twitter
from competidor 
where not exists
	(select *
	from competencia
	--where extract(year from fecha_i)=2021
	where fecha_i>=date('2021-01-01') and fecha_i<=date('2021-12-31')
	and not exists 
		(select *
		from participa
		where participa.cuil=competidor.cuil
		and participa.num=competencia.num)
	)





