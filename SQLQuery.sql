CREATE DATABASE PT_OP_B;

USE PT_OP_B;

CREATE TABLE Ciudad (
    idCiudad int PRIMARY KEY IDENTITY(1,1) NOT NULL,
    nombre varchar(50) NOT NULL,
	codigoPostal VARCHAR(30)
);


CREATE TABLE TipoViaje(
	idTipoViaje int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion VARCHAR(150)
);

CREATE TABLE MetodoPago(
	idMetodoPago int PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion VARCHAR(150)
);

CREATE TABLE Cliente(
	idCliente INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	nombres VARCHAR(100),
	edad INT,
	apellidos VARCHAR(100),
	email VARCHAR(50),
	telefono VARCHAR(50),
	idCiudad INT FOREIGN KEY REFERENCES Ciudad(idCiudad)
);

CREATE TABLE Viaje(
	idViaje INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	activo bit,
	descripcion varchar(200),
	valor decimal,
	fechaViaje Date,
	idTipoViaje INT FOREIGN KEY REFERENCES TipoViaje(idTipoViaje),
	idCiudadOrigen INT FOREIGN KEY REFERENCES Ciudad(idCiudad),
	idCiudadDestino INT FOREIGN KEY REFERENCES Ciudad(idCiudad)
);

CREATE TABLE Reserva(
	idReserva INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	fechaReserva Date,
	fechaLimite Date,
	monto decimal,
	idMetodoPago INT FOREIGN KEY REFERENCES MetodoPago(idMetodoPago),
	idViaje INT FOREIGN KEY REFERENCES Viaje(idViaje)
);

CREATE TABLE ReservaViaje(
	idReservaViaje INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	idCliente INT FOREIGN KEY REFERENCES Cliente(idCliente),
	idReserva INT FOREIGN KEY REFERENCES Reserva(idReserva)
);

CREATE TABLE Compra(
	idCompra INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	fechaCompra Date,
	idReserva INT FOREIGN KEY REFERENCES Reserva(idReserva)
);


INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Bogotá', '110311');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Medellín', '050001');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Cali', '760044');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Barranquilla', '080001');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Cartagena', '130001');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Santa Marta', '470001');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Bucaramanga', '680003');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Pereira', '660001');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Manizales', '170003');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Pasto', '520003');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Neiva', '410001');
INSERT INTO Ciudad (nombre, codigoPostal) VALUES ('Cúcuta', '540001');

INSERT INTO TipoViaje (nombre, descripcion) VALUES ('Turismo', 'Viajes de placer para conocer nuevos lugares');
INSERT INTO TipoViaje (nombre, descripcion) VALUES ('Negocios', 'Viajes con fines empresariales');
INSERT INTO TipoViaje (nombre, descripcion) VALUES ('Aventura', 'Viajes para realizar actividades extremas y emocionantes');
INSERT INTO TipoViaje (nombre, descripcion) VALUES ('Cultural', 'Viajes para conocer la cultura y la historia de diferentes lugares');
INSERT INTO TipoViaje (nombre, descripcion) VALUES ('Playa', 'Viajes para disfrutar de la playa y el sol');

INSERT INTO MetodoPago (nombre, descripcion) VALUES ('Tarjeta de crédito', 'Pago mediante tarjeta de crédito');
INSERT INTO MetodoPago (nombre, descripcion) VALUES ('Transferencia bancaria', 'Pago mediante transferencia bancaria');
INSERT INTO MetodoPago (nombre, descripcion) VALUES ('PayPal', 'Pago mediante PayPal');
INSERT INTO MetodoPago (nombre, descripcion) VALUES ('Efectivo', 'Pago en efectivo en el lugar');

INSERT INTO Cliente (nombres, apellidos, edad, email, telefono, idCiudad) VALUES ('María', 'Gómez', 49, 'mariagomez@example.com', '987654321', 2);
INSERT INTO Cliente (nombres, apellidos, edad, email, telefono, idCiudad) VALUES ('Pedro', 'García', 42, 'pedrogarcia@example.com', '123789456', 3);
INSERT INTO Cliente (nombres, edad, apellidos, email, telefono, idCiudad) VALUES
('Juan', 30, 'Pérez', 'juan.perez@email.com', '3211234567', 1),
('María', 25, 'García', 'maria.garcia@email.com', '3219876543', 2),
('Pedro', 40, 'López', 'pedro.lopez@email.com', '3107654321', 1),
('Laura', 28, 'Martínez', 'laura.martinez@email.com', '3101234567', 3);

INSERT INTO Viaje (activo, descripcion, valor, fechaViaje, idTipoViaje, idCiudadOrigen, idCiudadDestino) VALUES (1, 'Viaje a la playa', 2500000, '2023-06-15', 5, 1, 5);
INSERT INTO Viaje (activo, descripcion, valor, fechaViaje, idTipoViaje, idCiudadOrigen, idCiudadDestino) VALUES
(1, 'Viaje de aventura por el Amazonas', 2000000, '2023-06-10', 1, 1, 3),
(1, 'Viaje cultural por la costa caribe', 3500000, '2023-07-15', 2, 4, 1),
(0, 'Vacaciones relajantes en San Andrés', 5000000, '2023-09-01', 3, 1, 2);
INSERT INTO Viaje (activo, descripcion, valor, fechaViaje, idTipoViaje, idCiudadOrigen, idCiudadDestino) VALUES (1, 'Viaje a Santa Marta', 1000000, '2023-06-01', 1, 1, 1);
INSERT INTO Viaje (activo, descripcion, valor, fechaViaje, idTipoViaje, idCiudadOrigen, idCiudadDestino) VALUES (1, 'Viaje a Guatapé', 500000, '2023-07-15', 2, 2, 2);
INSERT INTO Viaje (activo, descripcion, valor, fechaViaje, idTipoViaje, idCiudadOrigen, idCiudadDestino) VALUES (1, 'Viaje a Cartagena', 800000, '2023-08-20', 1, 1, 3);

INSERT INTO Reserva (fechaReserva, fechaLimite, monto, idMetodoPago, idViaje) VALUES
('2023-05-02', '2023-05-15', 1000000, 1, 1),
('2023-05-04', '2023-05-30', 1200000, 4, 2),
('2023-05-04', '2023-06-30', 2000000, 2, 3);

INSERT INTO ReservaViaje (idCliente, idReserva) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 3),
(4, 3),
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Compra (fechaCompra, idReserva) VALUES
('2023-05-15', 1),
('2023-05-30', 2),
('2023-06-01', 3);


/*CONSULTAS*/


/*a. Número de personas que han consultado vuelos mayores a un valor de 5000.000 de pesos.*/
SELECT COUNT(DISTINCT idCliente) FROM ReservaViaje rv JOIN Reserva r ON rv.idReserva = r.idReserva JOIN Viaje v ON r.idViaje = v.idViaje WHERE v.valor > 5000000;

/*b. Personas que han tomado los vuelos y han hecho el pago en efectivo.*/
SELECT c.* 
FROM Cliente c 
JOIN ReservaViaje rv ON c.idCliente = rv.idCliente 
JOIN Reserva r ON rv.idReserva = r.idReserva 
JOIN MetodoPago mp ON r.idMetodoPago = mp.idMetodoPago 
WHERE mp.nombre = 'Efectivo';

/*c. Personas mayores a 40 años y que viven en la ciudad de Bogotá.*/
SELECT * FROM Cliente WHERE edad >= 40 AND idCiudad = (SELECT idCiudad FROM Ciudad WHERE nombre = 'Bogotá');

/*d. Listar los tipos de viajes turísticos y de negocios que se han hecho con pago con tarjeta de crédito.*/
SELECT DISTINCT TipoViaje.nombre
FROM TipoViaje
JOIN Viaje ON TipoViaje.idTipoViaje = Viaje.idTipoViaje
JOIN Reserva ON Viaje.idViaje = Reserva.idViaje
JOIN MetodoPago ON Reserva.idMetodoPago = MetodoPago.idMetodoPago
WHERE MetodoPago.nombre = 'Tarjeta de crédito';


/*e. Listar los viajes activos y cancelados.*/
SELECT * FROM Viaje WHERE activo = 1;
SELECT * FROM Viaje WHERE activo = 0;