# DataBaseElectroStore

## Descripción
La rama DML cuenta con dos proyectos que se centran en la manipulación de los datos de una base de datos en SQL Server. No cuenta con script de creación del esquema ya que ese fue creado por la cátedra de la universidad. Sin embargo, la estructura es la misma que el esquema creado en la rama de DDL de este repositorio.

## Estructura y explicación de lo contenido en la rama DML

**Proyecto 2**: contiene los queries para la población de la base de datos y un par de consultas.

- Sentencia 1: elimina los datos de la base de datos primero y luego se carga toda la información de la base de datos.
- Sentencia 2: consulta de todas las facturas con sus respectivos detalles.
- Sentencia 3: consulta de total de ventas por tienda.
- Sentencia 4: consulta para clientes con más de dos compras que muestra el total pagado y la cantidad de compras.
- Sentencia 5: comando de actualización de fechas de entrega para atrasar las entregas 3 días en donde la fecha de entrega y la fecha de emisión es menor a 4 días.

**Proyecto 3**: contiene la creación de procedimientos almacenados y funciones en la base de datos.

- Sentencia 1: procedimiento almacenado para insertar o realizar ventas basado en el inventario de la tienda y un conjunto de validaciones.
- Sentencia 2: función para obtener el monto total de compras por cliente en un periodo específico.
- Sentencia 3: procedimiento almacenado para actualizar productos en la base de datos.
- Sentencia 4: función que calcula el monto total del inventario de las tiendas al receibir un código de producto por parámetros.

## Tecnologías utilizadas
La creación de estos scripts se hizo con Microsoft SQL Server Management Studio.

## Notas Adicionales
Estos scripts **no incluye sentencias de definición de datos** (DDL). Se enfocan exclusivamente en DML.

## Instrucciones de Uso
1. Abra SSMS.
2. Importe y ejecute el script SQL proporcionado.
3. Asegúrese de crear un esquema que en SSMS que se adapte a la lógica de estos scripts.
4. Verifique que los procedimientos se guarden en la base de datos correcta haciendo uso del comando USE con el nombre del esquema que haya creado.

## Licencia
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
