/* Crear base de datos dbRestaurante */
CREATE DATABASE dbRestaurante;

/* Poner en uso la base de datos */
USE dbRestaurante;

/*---------------------------------- CREACION DE TABLAS ------------------------------*/


/* Crear tabla: CLIENTE */
CREATE TABLE CLIENTE (
    CODCLI char(9) NOT NULL,
    DNICLI char(8) NOT NULL,
    NOMCLI varchar(50) NOT NULL,
    APECLI varchar(50) NOT NULL,
    CELCLI char(9) NOT NULL,
    GMLCLI varchar(50) NOT NULL,
    CODUBIG char(9) NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (CODCLI)
);

/* Crear tabla: EMPLEADO */
CREATE TABLE EMPLEADO (
    CODEMP char(9) NOT NULL,
    DNIEMP char(8) NOT NULL,
    NOMEMP varchar(50) NOT NULL,
    APEEMP varchar(50) NOT NULL,
    CELEMP char(9) NOT NULL,
    GMLEMP varchar(50) NOT NULL,
    CODUBIG char(9) NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY (CODEMP)
);



/* Crear tabla: PRODUCTO */

CREATE TABLE PRODUCTO (
    CODPRO char(9) NOT NULL,
    NOMPRO varchar(50) NOT NULL,
    CATPRO char(1) NOT NULL,
    DESPRO varchar(500) NOT NULL,
    PREPRO decimal(8,2) NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (CODPRO)
);

/* Crear tabla: UBIGEO */
CREATE TABLE UBIGEO (
    CODUBIG char(9) NOT NULL,
    PROUBI varchar(50) NOT NULL,
    DEPUBI varchar(50) NOT NULL,
    DISUBI varchar(50) NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBIG)
);

/* Crear tabla: VENTA */
CREATE TABLE VENTA (
    IDVENT int NOT NULL,
    FECVENT date NOT NULL,
    TOTVENT double(5,2) NOT NULL,
    TIPVENT char(1) NOT NULL COMMENT 'E = Efectivo, Y = Yape, P = Plin, T = Transferencias',
    CODEMP char(9) NOT NULL,
    CODCLI char(9) NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVENT)
);

/* Crear tabla: VENTA_DETALLE*/
CREATE TABLE VENTA_DETALLE (
    IDVENTDET int NOT NULL,
    CANVENTDET int NOT NULL,
    IDVENT int NOT NULL,
    CODPRO char(9) NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (IDVENTDET)
);

/*---------------------------------- RELACION DE TABLAS ------------------------------*/


/* Relacionar : CLIENTE*UBIGEO  */
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY CLIENTE_UBIGEO (CODUBIG)
    REFERENCES UBIGEO (CODUBIG);

/* Relacionar : EMPLEADO*UBIGEO */
ALTER TABLE EMPLEADO ADD CONSTRAINT EMPLEADO_UBIGEO FOREIGN KEY EMPLEADO_UBIGEO (CODUBIG)
    REFERENCES UBIGEO (CODUBIG);
    
/* Relacionar : VENTA*CLIENTE  */
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (CODCLI)
    REFERENCES CLIENTE (CODCLI);

/* Relacionar : VENTA_DETALLE_PRODUCTO  */
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRODUCTO FOREIGN KEY VENTA_DETALLE_PRODUCTO (CODPRO)
    REFERENCES PRODUCTO (CODPRO);
    
/* Relacionar : VENTA_DETALLE_VENTA  */
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (IDVENT)
    REFERENCES VENTA (IDVENT);

/* Relacionar : VENTA_EMPLEADO  */
ALTER TABLE VENTA ADD CONSTRAINT VENTA_EMPLEADO FOREIGN KEY VENTA_EMPLEADO (CODEMP)
    REFERENCES EMPLEADO (CODEMP);

/*---------------------------------- INSERCION DE DATOS ------------------------------*/

/* Insertar datos ubigeo */
INSERT INTO UBIGEO
(CODUBIG, PROUBI, DEPUBI, DISUBI)
VALUES
('190000001','Cañete','Lima','Lunahuana'),
('190000002','Cañete','Lima','SanVicente'),
('190000003','Cañete','Lima','Imperial'),
('190000004','Cañete','Lima','Asia'),
('190000005','Cañete','Lima','NuevoImperial');


/* Insertar datos PRODUCTO */
INSERT INTO PRODUCTO
(CODPRO, NOMPRO, CATPRO, DESPRO, PREPRO)
VALUES
('PR0000001','Chaufa','C','PorcionDeArroz','10.00'),
('PR0000002','Un cuarto de Pollo a la brasa','C','Papa y Arroz y Pollo y Ensalada','10.00'),
('PR0000003','Mostrito','C','Papa y Arroz y Pollo y Ensalada','12.00'),
('PR0000004','Lomo saltado','C','Papa y Arroz y Pollo y Ensalada','10.00'),
('PR0000005','Cerveza Pilsen','B','Botella Cerveza 600ml','10.00'),
('PR0000006','Caldo de Gallina','C','2 huevos, presa de gallita, fideos,papa huayro','10.00'),
('PR0000007','Gaseosa 1Litro','B','1L Gaseosa','6.00'),
('PR0000008','3Litro INKA COLA','B','Gaseosa 3L','15.00');


/* Insertar datos EMPLEADO */
INSERT INTO EMPLEADO
(CODEMP, DNIEMP, NOMEMP, APEEMP, CELEMP, GMLEMP, CODUBIG)
VALUES
('DE0000001','73183575','Pedro Hugo','Porras Luyo','986062248','pedro.porras@vallegrande.edu.pe','190000001'),
('DE0000002','75849414','Fabio Alonso','Martel Antonio','933462615','fabio.martel@vallegrande.edu.pe','190000002'),
('DE0000003','45849584','Cinthia','Mayuri Chamorro','952194167','cinthia.mayuri@vallegrande.edu.pe','190000002'),
('DE0000004','76564965','Edy Anthony','Beingolea Castro','952194166','edy.beingolea@vallegrande.edu.pe','190000002');

/* Insertar datos CLIENTE */
INSERT INTO CLIENTE
(CODCLI, DNICLI, NOMCLI, APECLI, CELCLI, GMLCLI, CODUBIG)
VALUES
('CL0000001','73183575','Pedro Hugo','Porras Luyo','986062248','pedro.porras@vallegrande.edu.pe','190000001'),
('CL0000002','75849414','Fabio Alonso','Martel Antonio','933462615','fabio.martel@vallegrande.edu.pe','190000002'),
('CL0000003','45849584','Cinthia','Mayuri Chamorro','952194167','cinthia.mayuri@vallegrande.edu.pe','190000002'),
('CL0000004','76564965','Edy Anthony','Beingolea Castro','952194167','edy.beingolea@vallegrande.edu.pe','190000002');

/* Listar registros tablas maestras */
SELECT * FROM CLIENTE;
SELECT * FROM PRODUCTO;
SELECT * FROM EMPLEADO;
SELECT * FROM UBIGEO;


/*---------------------------------- CREACION DE TABLA PEDIDO ------------------------------*/

CREATE TABLE Pedido
(
     IDPED int AUTO_INCREMENT,
     USERPED varchar(80),
     EMAUSPED varchar(80),
     CELUSPED char(9),
     FOODPED varchar(80),
     MSGPED   varchar(250),
     PRIMARY KEY (IDPED)
);

/* Insertar registros */
INSERT INTO Pedido
(USERPED, EMAUSPED, CELUSPED, FOODPED, MSGPED)
VALUES
('José Ramírez', 'jose.ramirez@outlook.com', '974815236', 'Arroz con Pollo', 'Por favor enviar a la dirección Av. Miraflores 253, San Vicente de Cañete'),
('Ana Guerra Solano', 'ana.guerra@gmail.com', '981526321', 'Sopa Seca de Gallina', 'Necesito 4 platos');

/* Listar los registros de la tabla PEDIDO */
SELECT * FROM PEDIDO;
