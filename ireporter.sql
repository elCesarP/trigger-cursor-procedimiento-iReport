-- Cantidad de dinero recolectada en cada año 

SELECT 
  factura.fact_fech, 
  ((detalle_factura.deta_cant*  producto_adicional.costo_producto) +  reservacion.precio_reservacion) AS TOTAL
FROM public.detalle_factura
INNER JOIN public.factura ON detalle_factura.fact_num = factura.fact_num 
INNER JOIN public.producto_adicional ON producto_adicional.id_producto_adicional = detalle_factura.id_producto_adicional 
INNER JOIN public.reservacion ON reservacion.id_reservacion = detalle_factura.id_reservacion;
  

	SELECT 
	  factura.fact_total AS TOTAL_FACTURA, 
	  factura.fact_fech AS FECHA, 
	  detalle_factura.deta_cant AS CANTIDAD_PRODU, 
	  producto_adicional.costo_producto AS COSTO_PRODU, 
	  reservacion.precio_reservacion AS PRECIO_RESERVA, 
	  ((detalle_factura.deta_cant*  producto_adicional.costo_producto) + 
	  reservacion.precio_reservacion) AS TOTAL,
	  CONCAT(empleados.empleado_nomb ||' '|| empleados.empleado_apell)AS EMPLEADOS,
	  CONCAT(cliente.cli_nombre||' '|| cliente.cli_apellido) AS CLIENTE  
	FROM public.detalle_factura
	INNER JOIN public.factura ON  detalle_factura.fact_num = factura.fact_num 
	INNER JOIN public.empleados ON factura.id_empleado = empleados.id_empleado 
	INNER JOIN public.producto_adicional ON 
	producto_adicional.id_producto_adicional = detalle_factura.id_producto_adicional 
	INNER JOIN public.reservacion ON reservacion.id_reservacion = detalle_factura.id_reservacion
	INNER JOIN public.cliente ON cliente.cli_ced = detalle_factura.cli_ced;


