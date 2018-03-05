use Test

/*Mostrar el número de ventas de cada producto, ordenado de más a menos ventas
2.-*/
select Producto, count(Producto) as nVentas from Venta_Ariel_D group by Producto order by nVentas desc

/*Obtener un informe completo de ventas, indicando el nombre del cajero que realizo la venta, nombre y
precios de los productos vendidos, y el piso en el que se encuentra la máquina registradora donde se
realizó la venta.
3.-*/
select Cajeros_Ariel_D.Cajero, Productos_Ariel_D.Nombre, Productos_Ariel_D.Precio, Maquinas_Registradoras_Ariel_D.Piso
from (((Venta_Ariel_D
inner join Cajeros_Ariel_D on Venta_Ariel_D.Cajero = Cajeros_Ariel_D.Cajero)
inner join Productos_Ariel_D on Venta_Ariel_D.Producto = Productos_Ariel_D.Producto)
inner join Maquinas_Registradoras_Ariel_D on Venta_Ariel_D.Maquina = Maquinas_Registradoras_Ariel_D.Maquina);


/*Obtener las ventas totales realizadas en cada piso
4.-*/
select distinct Maquinas_Registradoras_Ariel_D.Piso as Piso, count(Piso) as Ventas
from Venta_Ariel_D
inner join Maquinas_Registradoras_Ariel_D on Venta_Ariel_D.Maquina = Maquinas_Registradoras_Ariel_D.Maquina
group by Maquinas_Registradoras_Ariel_D.Piso order by Piso, Ventas desc

/*Obtener el código y nombre de cada cajero junto con el importe total de sus ventas.
5.-*/
select Cajeros_Ariel_D.NomApels, Cajeros_Ariel_D.Cajero, sum(Productos_Ariel_D.Precio)
from ((Venta_Ariel_D
inner join Cajeros_Ariel_D on Venta_Ariel_D.Cajero = Cajeros_Ariel_D.Cajero)
inner join Productos_Ariel_D on Venta_Ariel_D.Producto = Productos_Ariel_D.Producto)
group by Cajeros_Ariel_D.NomApels, Cajeros_Ariel_D.Cajero;

/*Obtener el código y nombre de aquellos cajeros que hayan realizado ventas en pisos cuyas ventas
totales sean inferiores a los 5000 pesos.
6.-*/
select Cajeros_Ariel_D.NomApels, Cajeros_Ariel_D.Cajero
from ((Venta_Ariel_D
inner join Cajeros_Ariel_D on Venta_Ariel_D.Cajero = Cajeros_Ariel_D.Cajero)
inner join Productos_Ariel_D on Venta_Ariel_D.Producto = Productos_Ariel_D.Producto)
group by Cajeros_Ariel_D.NomApels, Cajeros_Ariel_D.Cajero having sum(Productos_Ariel_D.Precio)<500;
