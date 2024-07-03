create database los_afortunados;
use los_afortunados;


-- Creación de la tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(50)
);

-- Creación de la tabla Cuentas
CREATE TABLE Cuentas (
    id_cuenta INT PRIMARY KEY,
    id_cliente INT,
    saldo DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Creación de la tabla Transacciones
CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY,
    id_cuenta INT,
    monto DECIMAL(10, 2),
    fecha DATE,
    FOREIGN KEY (id_cuenta) REFERENCES Cuentas(id_cuenta)
);

-- Tabla Clientes--
INSERT INTO Clientes (id_cliente, nombre, email) VALUES
(1, 'Juan Perez', 'juan@example.com'),
(2, 'Ana Gomez', 'ana@example.com'),
(3, 'Carlos Lopez', 'carlos@example.com'),
(4, 'María Rodríguez', 'maria@example.com'),
(5, 'Luis Fernández', 'luis@example.com'),
(6, 'Laura Sánchez', 'laura@example.com'),
(7, 'Pedro Martínez', 'pedro@example.com'),
(8, 'Sofía Hernández', 'sofia@example.com'),
(9, 'Miguel Torres', 'miguel@example.com'),
(10, 'Lucía Díaz', 'lucia@example.com'),
(11, 'Jorge Rojas', 'jorge@example.com'),
(12, 'Carmen Morales', 'carmen@example.com'),
(13, 'Pablo Castillo', 'pablo@example.com'),
(14, 'Elena Ortiz', 'elena@example.com'),
(15, 'Antonio Ruiz', 'antonio@example.com'),
(16, 'Raquel Jiménez', 'raquel@example.com'),
(17, 'David Cruz', 'david@example.com'),
(18, 'Isabel Ramos', 'isabel@example.com'),
(19, 'Francisco Aguilar', 'francisco@example.com'),
(20, 'Rosa Navarro', 'rosa@example.com');



-- Tabla Cuentas --
INSERT INTO Cuentas (id_cuenta, id_cliente, saldo) VALUES
(1, 1, 5000.00),
(2, 1, 1500.00),
(3, 2, 3000.00),
(4, 3, 4500.00),
(5, 4, 2500.00),
(6, 5, 4000.00),
(7, 6, 1000.00),
(8, 7, 3500.00),
(9, 8, 500.00),
(10, 9, 6000.00),
(11, 10, 5500.00),
(12, 11, 2000.00),
(13, 12, 300.00),
(14, 13, 4700.00),
(15, 14, 3300.00),
(16, 15, 4200.00),
(17, 16, 700.00),
(18, 17, 1800.00),
(19, 18, 2600.00),
(20, 19, 3700.00);


-- Tabla Transacciones --
INSERT INTO Transacciones (id_transaccion, id_cuenta, monto, fecha) VALUES
(1, 1, 1000.00, '2023-01-15'),
(2, 1, -500.00, '2023-02-20'),
(3, 2, 200.00, '2024-03-10'),
(4, 2, -300.00, '2024-04-05'),
(5, 3, 1500.00, '2023-05-12'),
(6, 3, -700.00, '2023-06-18'),
(7, 4, 800.00, '2024-07-25'),
(8, 4, -200.00, '2024-08-30'),
(9, 5, 500.00, '2023-09-15'),
(10, 5, -100.00, '2023-10-20'),
(11, 6, 300.00, '2024-11-05'),
(12, 6, -50.00, '2024-12-10'),
(13, 7, 700.00, '2023-01-15'),
(14, 7, -200.00, '2023-02-20'),
(15, 8, 600.00, '2024-03-10'),
(16, 8, -300.00, '2024-04-05'),
(17, 9, 900.00, '2023-05-12'),
(18, 9, -400.00, '2023-06-18'),
(19, 10, 1000.00, '2024-07-25'),
(20, 10, -500.00, '2024-08-30');

-- Ejerccico 1
-- Selecionar el id_cuenta y el sabado de todas las cuentas
SELECT id_cuenta, saldo FROM Cuentas;

-- Selecionar las cuentas que tienen un saldo mayor a 4000
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo > 4000;

-- Selecionar las cuentas con saldo menor a 2000.
SELECT id_cuenta, saldo FROM Cuentas WHERE saldo < 2000;

-- Mostrar los nombres de los clientes y la longitud de sus nombres.
SELECT nombre, LENGTH(nombre) AS longitud_nombre FROM Clientes;

-- Seleccionar las cuentas con saldo entre 1000 y 3000
SELECT id_cuenta,saldo FROM Cuentas WHERE saldo> 1000 AND saldo < 3000;


-- Obtener una lista de todos los clientes y sus cuentas, mostrando los valores NULL.
SELECT Clientes.id_cliente, Clientes.nombre, Cuentas.id_cuenta
FROM Clientes
LEFT JOIN Cuentas ON Clientes.id_cliente = Cuentas.id_cliente;

-- Concatenar el nombre del cliente y su email con un separador.
SELECT CONCAT(nombre, ' - ', email) AS nombre_email FROM Clientes;

-- Extraer los últimos 3 caracteres del email de cada cliente.
SELECT nombre, SUBSTRING(email, -3) AS ultimos_tres_caracteres FROM Clientes;

-- Convertir el nombre del cliente a minúsculas.
SELECT LOWER(nombre) AS nombre_minusculas FROM Clientes;

-- Convertir el nombre del cliente a mayúsculas.
SELECT UPPER(nombre) AS nombre_mayusculas FROM Clientes;

-- Seleccionar las transacciones ordenadas por monto de mayor a menor, mostrando solo las primeras 10.
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 10;

-- Calcular el saldo de cada cuenta después de aplicar un interés del 5%.
SELECT id_cuenta,saldo AS saldo_sin_interes, saldo * 1.05 AS saldo_con_interes FROM Cuentas;

-- Reemplazar el dominio del email de los clientes
SELECT REPLACE(email, '@example.com', '@newdomain.com') AS nuevo_email FROM Clientes;


-- Ejercicio 2
-- Uso de funciones de Cadena

-- Seleccionar el nombre de cada cliente
SELECT nombre FROM Clientes;

-- Añadir una columna que muestre el email del cliente en el formato Correo: [email].
SELECT nombre, CONCAT('Correo: ', email) AS email_formateado FROM Clientes;


-- Mostrar los emails de los clientes en minúsculas.
SELECT LOWER(email) AS email_minusculas FROM Clientes;

-- Mostrar el nombre del cliente en mayúsculas.
SELECT upper(email) AS email_minusculas FROM Clientes;



-- EJERCICIO 3: 
-- Agregación de Datos

-- Seleccionar el id_cuenta.
SELECT id_cuenta FROM Cuentas;

-- Calcular el total de las transacciones realizadas en cada cuenta.
SELECT id_cuenta, SUM(monto) AS total_transacciones FROM Transacciones GROUP BY id_cuenta;

-- Calcular el saldo total de todas las cuentas. 
SELECT SUM(saldo) AS saldo_total FROM Cuentas;

-- Calcular el monto total de todas las transacciones.
SELECT SUM(monto) AS monto_total_transacciones FROM Transacciones;

-- Calcular el monto promedio de las transacciones
SELECT AVG(monto) AS monto_promedio_transacciones FROM Transacciones;


-- EJERCICIO 4
-- FUNCIONES DE FECHA

-- Seleccionar el id_transaccion y la fecha de todas las transacciones.
SELECT id_transaccion, fecha FROM Transacciones;

-- Extraer el año de la fecha de cada transacción.
SELECT id_transaccion, YEAR(fecha) AS año FROM Transacciones;


-- Extraer el mes de la fecha de cada transacción.
SELECT id_transaccion, MONTH(fecha) AS mes FROM Transacciones;


-- Extraer el día de la semana de la fecha de cada transacción.
SELECT id_transaccion, DAYOFWEEK(fecha) AS dia_semana FROM Transacciones;

-- Filtrar las transacciones que se realizaron en el año 2024
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2024;

-- Filtrar las transacciones que se realizaron en el año 2023
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023;

-- Seleccionar las transacciones realizadas en el mes de junio de cualquier año
SELECT * FROM Transacciones WHERE MONTH(fecha) = 6;

-- Seleccionar las transacciones realizadas el 15 de cada mes.
SELECT * FROM Transacciones WHERE DAY(fecha) = 15;


-- EJERCICIO 5
-- AGRUPACION Y CONTAR RESULTADOS


-- OBJETIVO: Contar el numero de transacciones por cuenta
-- Seleccionar el id_cuenta
SELECT id_cuenta FROM Cuentas;


-- Contar el número de transacciones realizadas en cada cuenta.
SELECT id_cuenta, COUNT(*) AS num_transacciones FROM Transacciones GROUP BY id_cuenta;


-- Calcular el saldo promedio de todas las cuentas.
SELECT AVG(saldo) AS saldo_promedio FROM Cuentas;



-- EJERCICIO 6:
-- FILTRACION CON CONDICIONES


-- Seleccionar las transacciones con un monto negativo.
SELECT * FROM Transacciones WHERE monto < 0;

-- Seleccionar las transacciones con un monto positivo.
SELECT * FROM Transacciones WHERE monto > 0;



-- EJERCICIO 7:
-- ORDENAMIENTO


-- Seleccionar todas las cuentas ordenadas por saldo de mayor a menor.
SELECT * FROM Cuentas ORDER BY saldo DESC;

-- Seleccionar todos los clientes ordenados alfabéticamente por nombre.
SELECT * FROM Clientes ORDER BY nombre ASC;

-- Seleccionar las transacciones realizadas en 2023.
SELECT * FROM Transacciones WHERE YEAR(fecha) = 2023 ORDER BY fecha;

-- Seleccionar las cuentas ordenadas por saldo de menor a mayor, mostrando solo las primeras 5
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 5;



-- EJERCICIO 8:
-- CONTAR RESULTADOS

-- Contar el número total de clientes.
SELECT COUNT(*) AS total_clientes FROM Clientes;

-- Contar el número total de cuentas.
SELECT COUNT(*) AS total_cuentas FROM Cuentas;

-- Contar el número total de transacciones.
SELECT COUNT(*) AS total_transacciones FROM Transacciones;


-- Redondear el saldo de cada cuenta a dos decimales.
SELECT id_cuenta, ROUND(saldo, 2) AS saldo_redondeado FROM Cuentas;



-- EJERCICIO 9:
-- MAXIMOS Y MINIMOS

-- Encontrar la cuenta con el saldo más alto.
SELECT * FROM Cuentas ORDER BY saldo DESC LIMIT 1;

-- Encontrar la cuenta con el saldo más bajo.
SELECT * FROM Cuentas ORDER BY saldo ASC LIMIT 1;

-- Encontrar la transacción con el monto más alto.
SELECT * FROM Transacciones ORDER BY monto DESC LIMIT 1;

-- Encontrar la transacción con el monto más bajo.
SELECT * FROM Transacciones ORDER BY monto ASC LIMIT 1;
