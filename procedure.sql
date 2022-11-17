-- Procedimiento almacenado al cual se le ingrese el nombre de un personal de arbitraje
-- y que imprima la cantidd de dinero que el centro deportivo ha pagado
-- por los años de servicios brindados.


    create or replace function dinero_centro_deportivo(varchar)
	returns  int
	as $$
		declare 
		 personal alias for $1;
		 precio int;
	begin
		SELECT 
			((extract(year FROM age('2022-07-27'::DATE ,empleados.fecha_ingreso::DATE))*12)+
			(extract(month FROM age('2022-07-27'::DATE ,empleados.fecha_ingreso::DATE))))*
            empleados.sueldo into precio
			FROM public.empleados
			INNER JOIN public.tipo_empleado ON tipo_empleado.id_tipoempleado = empleados.id_tipoempleado
			WHERE 
			empleados.empleado_nomb = $1;
				return precio;
	end;
	$$
	Language plpgsql;

	SELECT dinero_centro_deportivo('juan')
	
	
	