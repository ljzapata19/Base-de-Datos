CREATE TABLE obras
	(
    	Co INT NOT NULL  PRIMARY KEY,
    	Descrip VARCHAR(50),
   	 Direc VARCHAR(50),
   	 Zona VARCHAR(50),
   	 EmpCon VARCHAR(50)
   	 
	);

Insert into obras values
(100,'Construccion de Barrio','Av. José Ignacio de la Roza Oeste 2174','Santa Lucia','FyF'),
(200,'Departamentos','Av. Rioja 2174 (s)','Rawson','CREAR'),
(300,'Barrio','Av. Libertador 774 (e)','Rivadavia','CREAR'),
(400,'Mantenimiento Parque de Mayo','25 de Mayo 650 (o)','Capital','PEPE S.A.'),
(500,'Hotel 5 Estrellas','Santiago 64 (o)','Zonda','CONSTRUIR S.A.')
;

CREATE TABLE Materiales
	(
    	Cm INT NOT NULL  PRIMARY KEY,
    	Descrip VARCHAR(50),
   	 Precio INT    
   	 
	);

Insert into Materiales values
(10,'Arena',700),
(20,'Cal',6000),
(30,'Hierro',10000),
(40,'Tornillos',1),
(50,'Tuercas',4),
(60,'Arandelas',3),
(70,'Pintura',420),
(80,'Herramienta: Amoladora',4000),
(90,'Herramienta: Destornillador',350),
(100,'Puerta',3250),
(110,'Cemento Avellaneda',3685)
;

CREATE TABLE Ferreterias
	(
    	Cuit INT NOT NULL  PRIMARY KEY,
    	Nom VARCHAR(50),
   	 Direc VARCHAR(50),
   	 Zona VARCHAR(50),
   	 Tel INT
   	 
	);

Insert into Ferreterias values
(10289,'Ferreteria Cordoba','Av. Cordoba 44 (e)','Capital','4282169'),
(13263,'La cosita del coso','Mendoza 15(s)','Rawson','4452132'),
(20277,'Ferre San Juan','Av. Cordoba 44 (e)','Chimbas','4272169'),
(10267,'Todo para la Construccion','Santa Fe 68(o)','Caucete','4219974'),
(2246,'MR S.A','Av. Rawson 84 (n)','Capital','4682989')
;

CREATE TABLE Pedidos
	(
    	Co INTEGER NOT NULL,
   	 Cm INTEGER NOT NULL,
   	 Cuit INTEGER NOT NULL,
   	 Fecha DATE NOT NULL,
   	 Cant INTEGER,
   	 primary key(Co,Cm,Cuit,Fecha),
   	 constraint fk_obra FOREIGN KEY (Co) REFERENCES Obras(Co),
   	 constraint fk_material FOREIGN KEY (Cm) REFERENCES Materiales(Cm),
   	 constraint fk_ferreteria FOREIGN KEY (Cuit) REFERENCES Ferreterias(Cuit)    
	);

Insert into Pedidos values
(100,40,10289,'2020/12/05',100),
(100,40,10289,'2018/04/22',600),
(200,50,13263,'2019/06/05',400),
(300,10,2246,'2020/12/05',300),
(200,70,10267,'2020/02/13',10),
(200,30,20277,'2020/02/13',5000),
(400,100,20277,'2020/10/06',250),
(300,50,2246,'2020/05/16',238),
(300,20,2246,'2020/05/16',45),
(300,20,2246,'2020/05/13',10),
(100,50,2246,'2020/04/16',45),
(400,10,2246,'2020/01/13',10),
(200,40,13263,'2019/06/05',400),
(300,40,2246,'2020/04/05',300),
(500,40,10289,'2020/05/15',300),
(400,40,10289,'2020/05/15',300)
;

select * from ferreterias
select * from materiales
select * from obras
select * from pedidos 


-- 1. Muestre, a través de una consulta, los materiales (descripción) pedidos el día 06/06/2020.
select descrip
from materiales natural join
(select cm from pedidos where fecha=date('2020-06-06')) 
	
-- 2. Muestre para cada obra (indicando descripción) todos los materiales solicitados 
-- (descripción). Deben informarse todas las obras, más allá que aún no tenga materiales 
-- pedidos.

SELECT Obras.Descrip, Materiales.Descrip
FROM Obras
LEFT JOIN Pedidos ON Obras.Co = Pedidos.Co
LEFT JOIN Materiales ON Pedidos.Cm = Materiales.Cm
ORDER BY Obras.Descrip, Materiales.Descrip;

--3. Muestre la cantidad total de bolsas de cal que han sido pedidas a la ferretería MR S.A.

select count(*)
from pedidos
where 
	cm=(select cm from materiales where descrip='Cal') and
	cuit=(select cuit from ferreterias where nom='MR S.A');

--4. Muestre la cantidad total de obras que han pedido materiales a la ferretería MR S.A.
select count(distinct co)
from pedidos 
where cuit=(select cuit from ferreterias where nom='MR S.A')

--5. Muestre, para cada material pedido a alguna ferretería, el código de material, código 
--de obra y la cantidad total pedida (independientemente de la ferretería)
select cm, co, sum(cant)
from pedidos
group by cm, co
order by cm, co asc

--6. Muestre la descripción de materiales pedidos para alguna obra en una cantidad 
--promedio mayor a 320 unidades.


--division, interseccion o union, por lo gral una recta, grooup by, min max funciones sum count