CREATE DATABASE inegi_mario;

USE inegi_mario;

CREATE TABLE entidades(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE asentamientos(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_asentamiento VARCHAR(80) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE centros_comerciales(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_centro VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE vialidades(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_vialidad VARCHAR(25) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE municipios(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY(id)
);
CREATE TABLE unidad_economica(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_unidad VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
);


CREATE TABLE direcciones(
    id INT NOT NULL AUTO_INCREMENT,
    tipo_vialidad INT NOT NULL DEFAULT 0,
    nombre_vialidad VARCHAR(150) NOT NULL DEFAULT 'not_in_file',
    tipo_vialidad_entre_1 INT DEFAULT 0,
    nombre_vialidad_entre_1 VARCHAR(150) DEFAULT 'not_in_file',
    tipo_vialidad_entre_2 INT DEFAULT 0,
    nombre_vialidad_entre_2 VARCHAR(150) DEFAULT 'not_in_file',
    tipo_vialidad_entre_3 INT DEFAULT 0,
    nombre_vialidad_entre_3 VARCHAR(150) DEFAULT 'not_in_file',
    numero_exterior INT NOT NULL DEFAULT 0,
    letra_exterior VARCHAR(35) DEFAULT 'not_in_file',
    edificio VARCHAR(140) DEFAULT 'not_in_file',
    edificio_piso VARCHAR(30) DEFAULT 'not_in_file',
    numero_interior VARCHAR(30) DEFAULT 0,
    letra_interior VARCHAR(100) DEFAULT 'not_in_file',
    tipo_asentamiento INT DEFAULT 0,
    nombre_asentamiento VARCHAR(100) DEFAULT 'not_in_file',
    tipo_centro_comercial INT DEFAULT 0,
    nombre_centro_comercial VARCHAR(200) DEFAULT 'not_in_file',
    numero_de_local VARCHAR(25) DEFAULT 'not_in_file',
    codigo_postal INT DEFAULT 0,
    entidad INT DEFAULT 0,
    municipio INT DEFAULT 0,
    localidad VARCHAR(90) DEFAULT 'not_in_file',
    numero_manzana INT DEFAULT 0,

    PRIMARY KEY(id),
    FOREIGN KEY (tipo_vialidad) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_vialidad_entre_1) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_vialidad_entre_2) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_vialidad_entre_3) REFERENCES vialidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_asentamiento) REFERENCES asentamientos(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (tipo_centro_comercial) REFERENCES centros_comerciales(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (entidad) REFERENCES entidades(id) ON DELETE CASCADE ON UPDATE CASCADE, 
    FOREIGN KEY (municipio) REFERENCES municipios(id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE establecimientos(
    id BIGINT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre_establecimiento VARCHAR(170) NOT NULL,
    razon_social  VARCHAR(185) NOT NULL,
    nombre_actual VARCHAR(150) DEFAULT '',
    personas_ocupadas VARCHAR(25),
    direccion INT NOT NULL,
    telefono BIGINT,
    correo_electronico VARCHAR(99),
    pagina_web VARCHAR(99),
    tipo_unidad_economica INT,
    latitud FLOAT(10),
    longitud FLOAT(10),
    fecha_alta VARCHAR(20),

    PRIMARY KEY(id),
    FOREIGN KEY (direccion) REFERENCES direcciones(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (tipo_unidad_economica) REFERENCES unidad_economica(id) ON DELETE CASCADE ON UPDATE CASCADE
    
);

LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/entidades.csv' replace INTO TABLE entidades FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/asentamientos.csv' replace INTO TABLE asentamientos FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/centros_comerciales.csv' replace INTO TABLE centros_comerciales FIELDS TERMINATED BY '+' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/vialidades.csv' replace INTO TABLE vialidades FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/municipios.csv' replace INTO TABLE municipios FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/unidad_economica.csv' replace INTO TABLE unidad_economica FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/direccionesCompleta.csv' replace INTO TABLE direcciones FIELDS TERMINATED BY '@' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/home/mario/Documents/ITE2025-1/Backend-1/Notas/ParaImportarCSVs/establecimientosCompleta.csv' replace INTO TABLE establecimientos FIELDS TERMINATED BY '*' LINES TERMINATED BY '\n' IGNORE 1 LINES;
