CREATE DATABASE reservas_db;

USE reservas_db;

CREATE TABLE restaurantes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    responsable VARCHAR(45) NOT NULL,
    abierto BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE mesas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    numero_de_mesa INT UNSIGNED NOT NULL,
    numero_de_comensales INT UNSIGNED NOT NULL,
    restaurante_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id),
    PRIMARY KEY (id)
);

CREATE TABLE clientes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE favoritos (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    restaurante_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (restaurante_id) REFERENCES restaurantes(id),
    PRIMARY KEY (id)
);

CREATE TABLE reservas (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    mesa_id INT UNSIGNED NOT NULL,
    fecha_reserva DATETIME,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (mesa_id) REFERENCES mesas(id),
    PRIMARY KEY (id)
);


/*INSERCIÓN DE DATOS DE EJEMPLO RESTAURANTES*/

INSERT INTO restaurantes (nombre, direccion, telefono, responsable, abierto)
VALUES
('La Croquetería', 'Calle de Son Goku Nº2', '555123456', 'Alberto González', TRUE),
('El Pollo Asado', 'Calle Mayor Nº56', '555875345', 'María López', TRUE),
('La Casa de las Empanadas', 'Calle del Río Contaminado SN', '555789341', 'Facundo Martín', FALSE),
('La Gran Muralla', 'Calle Palique Nº99', '555456789', 'Pepa Flores', TRUE),
('Carne a GOGO', 'Plaza de mi Pueblo SN', '555231987', 'Susana Pérez', TRUE),
('Quebab de Oporto', 'Avenida de Oporto Nº5', '555098654', 'Raúl de la Peña', TRUE),
('El Mexicano', 'Calle de la Morería', '555155456', 'Irene Navarro', FALSE),
('Las Brasas', 'Puerta del Sol', '555098152', 'Alberto Carrasco', TRUE),
('Cantina Mariachi', 'Calle la Luz Nº85', '555127756', 'Juana Serrano', TRUE),
('La Panza llena', 'Calle de la Rivera Nº34', '555169456', 'Marta Casas', TRUE);

/*INSERCIÓN DE DATOS DE EJEMPLO MESAS*/

INSERT INTO mesas (numero_de_mesa, numero_de_comensales, restaurante_id)
VALUES
(1, 4, 1),
(2, 6, 1),
(1, 3, 2),
(2, 2, 2),
(1, 7, 3),
(2, 10, 3),
(1, 3, 4),
(2, 5, 4),
(1, 8, 5),
(2, 7, 5),
(1, 4, 6),
(2, 6, 6),
(1, 5, 7),
(2, 2, 7),
(1, 2, 8),
(2, 9, 8),
(1, 10, 9),
(2, 2, 9),
(1, 12, 10),
(2, 6, 10);

/*INSERCIÓN DE DATOS DE EJEMPLO CLIENTES*/

INSERT INTO clientes (nombre, telefono, email)
VALUES 
('Juan Pérez', '1234567890', 'juanperez@example.com'),
('Ana Sánchez', '2345678901', 'anasanchez@example.com'),
('Carlos Gómez', '3456789012', 'carlosgomez@example.com'),
('María Rodríguez', '4567890123', 'mariarodriguez@example.com'),
('Pedro Martínez', '5678901234', 'pedromartinez@example.com'),
('Isabel García', '6789012345', 'isabelgarcia@example.com'),
('Javier López', '7890123456', 'javierlopez@example.com'),
('Carmen Torres', '8901234567', 'carmentorres@example.com'),
('Francisco Navarro', '9012345678', 'francisconavarro@example.com'),
('Teresa Guzmán', '0123456789', 'teresaguzman@example.com');

/*INSERCIÓN DE DATOS DE EJEMPLO FAVORITOS*/

INSERT INTO favoritos (cliente_id, restaurante_id)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 4),
(4, 1),
(4, 5),
(5, 2),
(5, 6),
(6, 3),
(6, 7),
(7, 4),
(7, 8),
(8, 5),
(8, 9),
(9, 6),
(9, 10),
(10, 7),
(10, 8);


/*INSERCIÓN DE DATOS DE EJEMPLO RESERVAS*/

INSERT INTO reservas (cliente_id, mesa_id, fecha_reserva)
VALUES 
(1, 1, '2024-04-15 12:30:00'),
(1, 2, '2024-05-16 19:45:00'),
(2, 3, '2024-06-17 13:15:00'),
(2, 4, '2024-07-18 20:00:00'),
(3, 5, '2024-08-19 14:00:00'),
(3, 6, '2024-09-20 21:15:00'),
(4, 7, '2024-10-21 15:45:00'),
(4, 8, '2024-11-22 22:30:00'),
(5, 9, '2024-12-23 16:30:00'),
(5, 10, '2025-01-24 23:45:00'),
(6, 11, '2025-02-25 17:15:00'),
(6, 12, '2025-03-26 18:00:00'),
(7, 13, '2025-04-27 18:45:00'),
(7, 14, '2025-05-28 19:30:00'),
(8, 15, '2025-06-29 20:15:00'),
(8, 16, '2025-07-30 21:00:00'),
(9, 17, '2025-08-31 21:45:00'),
(9, 18, '2025-09-01 22:30:00'),
(10, 19, '2025-10-02 23:15:00'),
(10, 20, '2025-11-03 12:00:00');

/*OBETENER TODAS LAS RESERVAS DE UN RESTAURANTE PARA UN DÍA CONCRETO CON DATOS DE CLIENTE Y MESA RESERVADA*/

SELECT R.fecha_reserva, C.nombre AS nombre_cliente, C.telefono, C.email, M.numero_de_mesa, M.numero_de_comensales
FROM reservas R
JOIN clientes C ON R.cliente_id = C.id
JOIN mesas M ON R.mesa_id = M.id
JOIN restaurantes Re ON M.restaurante_id = Re.id
WHERE Re.nombre = 'La Croquetería' AND DATE(R.fecha_reserva) = '2024-04-15';


/*OBETENER TODOS LOS NOMBRES DE LOS RESTAURANTES*/
/*POR ID DE CLIENTE*/

SELECT R.nombre
FROM restaurantes R
JOIN favoritos F ON R.id = F.restaurante_id
WHERE F.cliente_id = '2' AND R.abierto = TRUE;

/*POR NOMBRE DE CLIENTE*/

SELECT R.nombre
FROM restaurantes R
JOIN favoritos F ON R.id = F.restaurante_id
JOIN clientes C ON F.cliente_id = C.id
WHERE C.nombre = 'Teresa Guzmán' AND R.abierto = TRUE;


/*MODIFICAR HORA DE UNA RESERVA*/

UPDATE reservas
SET fecha_reserva = '2027-01-01 00:00:00'
WHERE id = 1;

/*ELIMINAR TODOS LOS FAVORITOS NO ABIERTOS DE UN CLIENTE*/

DELETE FROM favoritos
WHERE cliente_id = (SELECT id FROM clientes WHERE nombre = 'Javier López')
AND restaurante_id IN (SELECT id FROM restaurantes WHERE abierto = FALSE);

/*RESTAURANTES CON MÁS DE 3 RESERVAS DE 4 O MÁS COMENSALES PARA UN DÍA ESPECÍFICO*/
/*teniendo en cuenta solo el DATE de la fecha de reserva y no la hora*/

SELECT res.nombre AS 'Nombre del Restaurante', COUNT(*) AS 'Número de Reservas'
FROM restaurantes res
JOIN mesas m ON res.id = m.restaurante_id
JOIN reservas r ON m.id = r.mesa_id
WHERE m.numero_de_comensales >= 4 AND DATE(r.fecha_reserva) = '2024-04-15'
GROUP BY res.nombre
HAVING COUNT(*) > 3;

/*AFORO MÁXINO PARA UN RESTAURANTE EN CONCRETO*/

SELECT r.nombre AS 'Quebab de Oporto', SUM(m.numero_de_comensales) AS 'Aforo Máximo'
FROM restaurantes r
JOIN mesas m ON r.id = m.restaurante_id
WHERE r.nombre = 'Quebab de Oporto'
GROUP BY r.nombre;

/*MESAS QUE PUEDAN ACOMODAR A DOS COMENSALES Y QUE ESTEN DISPONIBLES EN UN RESTAURANTE EN CONCRETO*/

SELECT m.id AS 'Mesa ID', m.numero_de_mesa AS 'Número de Mesa'
FROM mesas m
JOIN restaurantes r ON m.restaurante_id = r.id
LEFT JOIN reservas res ON m.id = res.mesa_id AND res.fecha_reserva = '2024-05-05 12:00:00'
WHERE r.nombre = 'La Casa de las Empanadas' AND m.numero_de_comensales >= 2 AND res.id IS NULL;

/*NOMBRE DEL CLIENTE QUE HA REALIZADO MÁS RESERVAS EN UN RESTAURANTE ESPECÍFICO DENTRO DE UN RANGO DE FECHAS DADO*/

SELECT c.nombre AS 'Nombre del Cliente', COUNT(*) AS 'Número de Reservas'
FROM clientes c
JOIN reservas r ON c.id = r.cliente_id
JOIN mesas m ON r.mesa_id = m.id
JOIN restaurantes res ON m.restaurante_id = res.id
WHERE res.nombre = 'Las Brasas' AND r.fecha_reserva BETWEEN '2025-06-29 20:15:00' AND '2025-10-29 20:15:00'
GROUP BY c.nombre
ORDER BY COUNT(*) DESC
LIMIT 1;

