# MySQLDataBaseElectroStore
## Descripción
Este proyecto consiste en la creación de una base de datos relacional para una tienda de electrodomésticos. La base de datos incluye diversas entidades relacionadas con los productos, las marcas de los productos, los clientes, las tiendas, los empleados, los cargos de los empleados, las facturas, los ítems de las facturas y una tabla de inventario.

## Tecnologías Utilizadas
- **Base de datos**: MySQL
- **Entorno de desarrollo**: MySQL Workbench

## Estructura de la Base de Datos
La base de datos se compone de las siguientes entidades y relaciones:

- **Producto**: Información sobre los productos vendidos en la tienda.
- **Marca**: Información sobre las marcas de los productos.
- **Cliente**: Información sobre los clientes.
- **Tienda**: Información sobre las tiendas físicas.
- **Empleado**: Información sobre los empleados de la tienda.
- **Cargo de Empleado**: Información sobre los diferentes cargos de los empleados.
- **Factura**: Información sobre las facturas generadas por las ventas.
- **Ítems de la Factura**: Información sobre los ítems incluidos en cada factura.
- **Inventario**: Información sobre el inventario de productos en las tiendas.

## Esquema y Relaciones
El script proporcionado en este proyecto crea el esquema de la base de datos y define las siguientes relaciones entre las entidades:

- Llaves primarias y foráneas para mantener la integridad referencial.
- Relaciones de uno a muchos y muchos a muchos según sea necesario para el modelo de datos.

## Notas Adicionales
Este script **no incluye sentencias de manipulación de datos** (DML) como inserciones, actualizaciones o eliminaciones. Se enfoca exclusivamente en la creación de la estructura de la base de datos (DDL).

## Instrucciones de Uso
1. Abra MySQL Workbench.
2. Importe y ejecute el script SQL proporcionado para crear el esquema de la base de datos y sus relaciones.
3. Verifique que todas las tablas y relaciones se hayan creado correctamente.

##Licencia
Licencia MIT

Derechos de Autor (c) [2024] [Fernando Hernández]

Por la presente se concede permiso, sin cargo, a cualquier persona que obtenga una copia
de este software y archivos de documentación asociados (el "Software"), para tratar
en el Software sin restricciones, incluyendo sin limitación los derechos
para usar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar, y/o vender
copias del Software, y para permitir a las personas a quienes se les proporcione el Software
hacerlo, sujeto a las siguientes condiciones:

El aviso de copyright anterior y este aviso de permiso deberán ser incluidos en todas
las copias o porciones sustanciales del Software.

EL SOFTWARE SE PROPORCIONA "TAL CUAL", SIN GARANTÍA DE NINGÚN TIPO, EXPRESA O
IMPLÍCITA, INCLUYENDO PERO NO LIMITÁNDOSE A LAS GARANTÍAS DE COMERCIALIZACIÓN,
IDONEIDAD PARA UN PROPÓSITO PARTICULAR Y NO INFRACCIÓN. EN NINGÚN CASO LOS
AUTORES O TITULARES DEL COPYRIGHT SERÁN RESPONSABLES DE NINGUNA RECLAMACIÓN, DAÑO U OTRA
RESPONSABILIDAD, YA SEA EN UNA ACCIÓN DE CONTRATO, AGRAVIO O DE OTRO MODO, QUE SURJA DE,
FUERA O EN CONEXIÓN CON EL SOFTWARE O EL USO U OTROS TRATOS EN EL
SOFTWARE.

MIT License

Copyright (c) [2024] [Fernando Hernández]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
