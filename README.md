# Kaischool
START TRANSACTION;
UPDATE CFormacion SET status=1;
SELECT*FROM CFormacion;
ROLLBACK;
SELECT*FROM CFormacion;

START TRANSACTION;
UPDATE CFormacion SET status=1;
SELECT*FROM CFormacion;
COMMIT;
ROLLBACK;
SELECT*FROM CFormacion;

SET AUTOCOMMIT=0;
UPDATE CFormacion SET status=0;
SELECT*FROM CFormacion;
COMMIT;
SELECT*FROM CFormacion;
UPDATE CFormacion SET status=0;

UPDATE CFormacion SET nom_for='Programador';
SELECT*FROM CFormacion;
ROLLBACK;
SELECT*FROM CFormacion;

SET AUTOCOMMIT=1;
START TRANSACTION;
DROP TABLE CFormacion;
SELECT*FROM CFormacion;

CREATE TABLE CFormacion(
id_for int NOT NULL,
nom_for varchar(20) NOT NULL,
PRIMARY KEY(id_for));
INSERT INTO CFormacion(id_for,nom_for)VALUES(1,'Ingeniero');
INSERT INTO CFormacion(id_for,nom_for)VALUES(2,'Licenciado');
INSERT INTO CFormacion(id_for,nom_for)VALUES(3,'Asistente');
SELECT*FROM CFormacion;
ALTER TABLE CFormacion ADD COLUMN status BOOLEAN;
SELECT*FROM CFormacion;

cd (ruta del bin) dir *mysqldump* 
