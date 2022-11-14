create database Monge;
use Monge;

-- table clients Padre
create table clients(
	Cod_Cliente int not null auto_increment,
    DNI int not null,
    Nombre varchar(20) not null,
    Direccion text not null,
    primary key(Cod_Cliente)
);
insert into clients(DNI, Nombre, Direccion) values(211572, 'Ezequiel', 'BataholaSur 1c Arriba 1/2 al Sur'),
(211573, 'Melvin', 'San Judas 2c Arriba 1/2 al Sur'),
(211574, 'Carlos', 'Altagracia 1c Arriba 1/2 al Sur'),
(211575, 'Jade', 'Altagracia 1c Arriba 1/2 al Sur'),
(211576, 'Marcos', 'BataholaSur 1c Arriba 1/2 al Sur'),
(211577, 'Paloma', 'San Judas 1c Arriba 1/2 al Sur');
select * from clients;

-- Factura hijo
create table Factura(
	No_Factura int not null auto_increment,
    Fecha date not null,
    CodCliente int not null, 
    Total_Factura decimal not null,
    foreign key(CodCliente) references clients(Cod_Cliente),
    primary key(No_Factura)
);
insert into Factura(Fecha, CodCliente, Total_Factura) values('2020-11-1', 1, 600),
('2020-11-10', 2, 450),
('2020-11-8', 3, 650),
('2020-11-6', 4, 200),
('2020-11-4', 5, 350),
('2020-11-3', 6, 1200);
select * from Factura;

-- table Proveedores Padre
create table proveedores(
	Codigo_Proveedor int not null,
    Proveedor varchar(20) not null,
    Telefono int not null,
    Direccion text not null,
    primary key(Codigo_Proveedor)
);
insert into proveedores(Codigo_Proveedor, Proveedor, Telefono, Direccion) values(0001, 'CocaCola', 123456789, 'San Judas 2c Arriba 1/2 al Sur'),
(0002, 'CocaCola', 123456789, 'San Judas 3c Arriba 1/2 al Sur'),
(0003, 'Amazong', 123456789, 'San Judas 4c Arriba 1/2 al Sur'),
(0004, 'Ebax', 123456789, 'San Judas 5c Arriba 1/2 al Sur'),
(0005, 'Sitel', 123456789, 'San Judas 6c Arriba 1/2 al Sur'),
(0006, 'MacDonalds', 123456789, 'San Judas 7c Arriba 1/2 al Sur');
select * from proveedores;

-- table Product hijo
create table Producto(
	Codigo_Producto int not null auto_increment,
    Descripcion text not null,
    Proveedor_id int not null,
    foreign key(Proveedor_id) references proveedores(Codigo_Proveedor),
    Precio_Costo int not null,
    Precio_Venta int not null,
    primary key(Codigo_Producto)
);
insert into Producto(Descripcion, Proveedor_id, Precio_Costo, Precio_Venta) values('Silla gamer', 2, 400, 600),
('Silla gamer', 4, 400, 600),
('Pc Gamer', 5, 400, 600),
('Iphone 13', 1, 400, 600),
('Led', 3, 400, 600),
('Teclados', 6, 400, 600);
select * from Producto;

-- Detalles de Facturas
create table DetalleFactura(
	id int not null auto_increment,
    NoFactura int not null,
    foreign key(NoFactura) references Factura(No_Factura),
    NoProducto int not null,
    foreign key(NoProducto) references Producto(Codigo_Producto),
    CantidadPedida int not null,
    primary key(id)
);
insert into DetalleFactura(NoFactura, NoProducto, CantidadPedida) values(1, 1, 9),
(2, 6, 5),
(3, 3, 8),
(4, 2, 3),
(5, 5, 4),
(6, 4, 16);
select * from DetalleFactura;