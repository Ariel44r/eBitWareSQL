use Test;

CREATE TABLE Cajeros_Ariel_D (
	Cajero integer not null PRIMARY KEY,
	NomApels varchar(255) not null
);

CREATE TABLE Maquinas_Registradoras_Ariel_D (
	Maquina integer not null PRIMARY KEY,
	Piso integer not null
);

CREATE TABLE Productos_Ariel_D (
	Producto integer not null PRIMARY KEY,
	Nombre varchar(255) not null,
	Precio integer not null
);

CREATE TABLE Venta_Ariel_D (
	Cajero	INTEGER NOT NULL,
	Maquina	INTEGER NOT NULL,
	Producto	INTEGER NOT NULL,
	CONSTRAINT fk_Cajero_Ariel_D FOREIGN KEY (Cajero) REFERENCES Cajeros_Ariel_D (Cajero),
	CONSTRAINT fk_Maquina_Ariel_D FOREIGN KEY (Maquina) REFERENCES Maquinas_Registradoras_Ariel_D (Maquina),
	CONSTRAINT fk_Producto_Ariel_D FOREIGN KEY (Producto) REFERENCES Productos_Ariel_D (Producto),
);
