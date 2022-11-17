/*==============================================================*/
/* Table: TIPO_EMPLEADO                                         */
/*==============================================================*/
create table TIPO_EMPLEADO (
   ID_TIPOEMPLEADO      INT4                 not null,
   EMPLEADODESCRIPCION  VARCHAR(50)          null,
   constraint PK_TIPO_EMPLEADO primary key (ID_TIPOEMPLEADO)
);

----------------------------------------------------------------------
INSERT INTO public.tipo_empleado(
id_tipoempleado, empleadodescripcion)
VALUES 
(1010, 'mantenimiento'),
(1011, 'atencion al cliente'),
(1012, 'profesional de arbitraje')

/*==============================================================*/
/* Table: EMPLEADOS                                             */
/*==============================================================*/
create table EMPLEADOS (
   ID_EMPLEADO          INT4                 not null,
   ID_TIPOEMPLEADO      INT4                 null,
   EMPLEADO_NOMB        VARCHAR(20)          null,
   EMPLEADO_APELL       VARCHAR(20)          null,
   CEDIDENTIDADEMPLE    VARCHAR(10)          null,
   DIRECCION            VARCHAR(30)          null,
   FECHA_NACIM          DATE                 null,
   FECHA_INGRESO        DATE                 null,
   SUELDO               FLOAT                null,
   constraint PK_EMPLEADOS primary key (ID_EMPLEADO)
);

ALTER TABLE EMPLEADOS ADD CONSTRAINT ID_TIPOEMPLEADO_FK FOREIGN KEY (ID_TIPOEMPLEADO)
REFERENCES TIPO_EMPLEADO (ID_TIPOEMPLEADO) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

-------------------------------------------------------------------------------
INSERT INTO  public.empleados(
id_empleado, id_tipoempleado, empleado_nomb, empleado_apell, cedidentidademple, direccion, fecha_nacim, fecha_ingreso, sueldo)
VALUES 
(1, 1010, 'juan', 'casanova', '1325342543', 'calle 12', '05/04/1982', '02/07/2016', 550.00),
(2, 1011, 'andres', 'marquez', '1926352436', 'calle 17', '08/04/1992', '03/03/2018', 650.00 ),
(3, 1010, 'maria', 'alonso', '1829374653', 'calle 26', '07/08/1989', '04/08/2019', 300.00),
(4, 1011, 'agustin', 'pin', '1372536360', 'calle 52', '06/02/1999', '08/04/2020', 700.00 ),
(5, 1012, 'melina', 'garcia', '1436576900', 'calle 24', '05/04/1999', '10/05/2021', 760.00),
(6, 1012, 'dolores', 'alvarez', '1372536360', 'calle 52', '06/02/1998', '18/07/2021', 980.00 );


/*==============================================================*/
/* Table: PRODUCTO_ADICIONAL                                    */
/*==============================================================*/
create table PRODUCTO_ADICIONAL (
   ID_PRODUCTO_ADICIONAL    INT4                 not null,
   DETALLE_PRODUCTO         VARCHAR(50)          null,
   COSTO_PRODUCTO           FLOAT                null,
   constraint PK_PRODUCTO_ADICIONAL primary key (ID_PRODUCTO_ADICIONAL)
);

----------------------------------------------------------------------
INSERT INTO public.PRODUCTO_ADICIONAL(
ID_PRODUCTO_ADICIONAL, DETALLE_PRODUCTO, COSTO_PRODUCTO)
VALUES 
(10, 'Gorras', 15.00),
(11, 'Camisas Personalizadas', 25.00),
(12, 'Productos de animacion', 10.00);
(13, 'Servicio de comida', 15.00),
(14, 'Hidratacion', 15.00),
(15, 'Premiacion', 20.00),
(17, 'Arbitraje de eventos', 5.00);


/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/

CREATE TABLE FACTURA (
	FACT_NUM        varchar(10)    NOT NULL,
	FACT_FECH       date               NULL,
	FACT_SUBTO      float              NULL,
	FACT_TOTAL      float              NULL,
	VALOR_PENDIENTE float              NULL,
	ID_EMPLEADO     INT4           NOT NULL,
	CONSTRAINT FACTURA_pk PRIMARY KEY (FACT_NUM)
);

ALTER TABLE FACTURA ADD CONSTRAINT ID_EMPLEADO_FK FOREIGN KEY (ID_EMPLEADO)
REFERENCES EMPLEADOS (ID_EMPLEADO) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

----------------------------------------------------------------------
INSERT INTO public.FACTURA(
FACT_NUM, FACT_FECH, FACT_SUBTO, FACT_TOTAL, VALOR_PENDIENTE, ID_EMPLEADO)
VALUES 
('1001-004','20/06/2022', 100.00, 100.00, 0.00, 2),
('1001-011','25/06/2021', 50.00, 30.00, 20.00, 1),
('1001-013','14/07/2022', 150.00, 125.00, 25.00, 1),
('1001-024','20/07/2022', 75.00, 75.00, 0.00, 4);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/

CREATE TABLE CLIENTE (
	CLI_CED          VARCHAR(10)        NOT NULL,
	CLI_NOMBRE       varchar(30),
	CLI_APELLIDO     varchar(30),
	CLI_NACIMIENTO   date,
	CLI_CELULAR      varchar(10),
	CONSTRAINT CLIENTE_pk PRIMARY KEY (CLI_CED)
);

----------------------------------------------------------------------

INSERT INTO CLIENTE (
CLI_CED, CLI_NOMBRE, CLI_APELLIDO, CLI_NACIMIENTO, CLI_CELULAR)
VALUES
(1350696397, 'ELVA STEFANY','MENDOZA CEDEÑO' , '20/11/1998',0934769263),
(1763638622, ' LUIS CARLOS', 'DELGADO MANTUANO', '13/08/2000', 0976564752),
(1983653456, ' CARMEN INES', 'LOPEZ LUCAS', '08/03/1997', 0976363418),
(1387646578, 'MARIA VICTORIA','VELEZ DELGADO' , '10/07/1998', 0934000023),
(1237566593, 'RENAN ALEJANDRO', 'LUCAS MERO', '15/04/1997', 0985323418);


/*==============================================================*/
/* Table: ESPACIOS O AREA                                       */
/*==============================================================*/
create table ESPACIOS (
   ID_ESPACIO           INT4                 not null,
   DISPONIBILIDAD       VARCHAR(2)           null,
   CAPACIDAD            INT4                 null,
   FECHA_RESERVA         DATE                 null,
   DETALLE_AREA         VARCHAR(50)          null,
   ID_EMPLEADO          INT4                 not null,
   constraint PK_ESPACIOS primary key (ID_ESPACIO)
);

ALTER TABLE ESPACIOS ADD CONSTRAINT ID_EMPLEADO_FK FOREIGN KEY (ID_EMPLEADO)
REFERENCES EMPLEADOS (ID_EMPLEADO) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO  public.espacios(
ID_ESPACIO, DISPONIBILIDAD, CAPACIDAD, FECHA_RESERVA, DETALLE_AREA, ID_EMPLEADO)
VALUES 
(1,'no','50','08/08/2020', 'Area climatizada', '4'),
(2,'no','50','10/12/2021', 'Canchas de volleyball', '4'),
(3,'si','50','07/09/2019', 'Canchas de Basket', '1'),
(4,'no','50','19/08/2022', 'Área de natación', '2'),
(5,'si','50','01/01/2018', 'Área de recreación', '3');


/*==============================================================*/
/* Table: RESERVACION                                           */
/*==============================================================*/
create table RESERVACION (
   ID_RESERVACION       INT4                 not null,
   ID_ESPACIO           INT4                 not null,
   CLI_CED              VARCHAR(10)          null,
   FECHA_RESERVA        DATE                 null,
   PRECIO_RESERVACION   FLOAT                null,
   constraint PK_RESERVACION primary key (ID_RESERVACION)
);

ALTER TABLE RESERVACION ADD CONSTRAINT ID_ESPACIO_FK FOREIGN KEY (ID_ESPACIO)
REFERENCES ESPACIOS (ID_ESPACIO) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE RESERVACION ADD CONSTRAINT CLI_CED_FK FOREIGN KEY (CLI_CED)
REFERENCES CLIENTE (CLI_CED) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO public.reservacion(
ID_RESERVACION, ID_ESPACIO, CLI_CED, FECHA_RESERVA, PRECIO_RESERVACION)
VALUES 
(6666, 1,'1350696397', '2020-03-01',100.00),
(6664, 2,'1763638622', '2021-08-07',110.00),
(6665, 4,'1763638622', '2020-04-05',90.00),
(6667, 5,'1983653456', '2019-05-23',75.00),
(6668, 2,'1983653456', '2021-08-21',90.00),
(6669, 1,'1387646578', '2021-09-15',115.00),
(6610, 3,'1387646578', '2020-12-15',70.00),
(6611, 3,'1237566593', '2021-05-15',95.00);


CREATE TABLE DETALLE_FACTURA (
	DETA_ID                 INT4          NOT NULL,
	DETA_CANT               INT4          NOT NULL,
    CLI_CED                 VARCHAR(10)       null,
    ID_PRODUCTO_ADICIONAL   INT4          not null,
    ID_RESERVACION          INT4          not null,
    FACT_NUM                varchar(10)   NOT NULL,    
	CONSTRAINT DETALLE_FACTURA_pk PRIMARY KEY (DETA_ID)
);

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT CLI_CED_FK FOREIGN KEY (CLI_CED)
REFERENCES CLIENTE (CLI_CED) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT ID_PRODUCTO_ADICIONAL_FK FOREIGN KEY (ID_PRODUCTO_ADICIONAL)
REFERENCES PRODUCTO_ADICIONAL (ID_PRODUCTO_ADICIONAL) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE DETALLE_FACTURA ADD CONSTRAINT ID_RESERVACION_FK FOREIGN KEY (ID_RESERVACION)
REFERENCES RESERVACION (ID_RESERVACION) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

INSERT INTO DETALLE_FACTURA (
DETA_ID, DETA_CANT, CLI_CED, ID_PRODUCTO_ADICIONAL, ID_RESERVACION, FACT_NUM)
VALUES 
(201, 1, 1350696397, 10, 6666, '1001-004'),
(202, 5, 1763638622, 13, 6664, '1001-011' ),
(203, 2, 1983653456, 15, 6667, '1001-011'),
(204, 3, 1983653456, 17, 6669, '1001-013'),
(205, 3, 1387646578, 11, 6611, '1001-013'),
(206, 1, 1763638622, 14, 6664, '1001-024');


