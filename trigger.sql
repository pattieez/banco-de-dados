CREATE TABLE USUARIO (
    IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30),
    SENHA VARCHAR(100)
);

CREATE TABLE BKP_USUARIO (
    IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
    IDUSUARIO INT,
    NOME VARCHAR(30),
    LOGIN VARCHAR(30)
);

DELIMITER $

-- fazer backup do usuario que foi deletado
CREATE TRIGGER BACKUP_USER
BEFORE DELETE ON USUARIO
FOR EACH ROW 
BEGIN
	INSERT INTO BKP_USUARIO VALUES(NULL, OLD.IDUSUARIO, OLD.NOME, OLD.LOGIN);
END
$

DELIMITER ;

INSERT INTO USUARIO VALUES(NULL, 'ANDRADE', 'ANDRADE2009', 'HEXA');

SELECT * FROM BKP_USUARIO;