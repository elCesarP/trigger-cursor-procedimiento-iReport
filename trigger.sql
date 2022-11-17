----------------------------------------------------------------------------------------
---------------------------------------TRIGGER------------------------------------------
----------------------------------------------------------------------------------------

--Trigger que impida reservar un area a un cliente ue no haya cancelado
--parte de la cuota del reservar del espacio

------------------FUNCION---------------------------------------------------------------  

CREATE OR REPLACE FUNCTION control_reserva() 
	RETURNS TRIGGER 
	AS
	$control_reserva$
	    declare
	    numfact varchar(10);
        pagospen int;
	 BEGIN   
        SELECT FACT_NUM into numfact from DETALLE_FACTURA where (CLI_CED = new.CLI_CED);
        SELECT count(FACT_NUM) into pagospen from FACTURA where (VALOR_PENDIENTE > 0) AND (FACT_NUM=numfact);
			if(pagospen > 0)then
				raise exception 'La persona que desea reservar, cuenta con pagos pendientes';
			end if;	
		RETURN new;
	 END; 
	$control_reserva$
	LANGUAGE plpgsql
    
    
    
------------------TRIGGER--------------------------------------------------------------   

	CREATE TRIGGER controlarreservacion before insert
	on reservacion for each row 
	execute procedure control_reserva() ;

------------------INSERCION-------------------------------------------------------------  
 
INSERT INTO public.reservacion(
ID_RESERVACION, ID_ESPACIO, CLI_CED, FECHA_RESERVA, PRECIO_RESERVACION)
VALUES 
(6618, 4,'1983653456', '2020-03-02',100.00)

