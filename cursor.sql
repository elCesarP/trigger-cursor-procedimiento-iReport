
    -- Cursor que muestre en una columna el año, en otra columna el nombre del area
    -- en otra columna la cantidad de veces que esa area fue ocupada ese año, en otra 
    -- columna la cantidad de dinero que se recogio para ese tipo de evento en el 
    -- centro en ese año 
    

	do 
	$$
	DECLARE 
		datos RECORD;
		cur_datos  cursor for SELECT 
			espacios.detalle_area AS NOMBRE_AREA, 
			EXTRACT(YEAR FROM DATE (reservacion.fecha_reserva)) AS AÑO,
			count( EXTRACT(YEAR FROM DATE (reservacion.fecha_reserva))) as cantidad,
			SUM(reservacion.precio_reservacion) AS SUMA
		FROM  public.reservacion
			INNER JOIN public.espacios ON reservacion.id_espacio = espacios.id_espacio
		GROUP BY
			EXTRACT(YEAR FROM DATE (reservacion.fecha_reserva)),  espacios.detalle_area;
	BEGIN	
		OPEN cur_datos;
		FETCh cur_datos INTO datos;
		while (found) loop 
		RAISE NOTICE 
		'
		AÑO: % 
		NOMBRE DEL AREA: % 
		CANTIDAD OCUPADA: % 
                CANTIDAD DINERO RECOGIDO: %
		', datos.AÑO, datos.NOMBRE_AREA, datos.cantidad, datos.SUMA;
		FETCh cur_datos INTO datos;
	end loop;	
	end $$
	Language 'plpgsql';