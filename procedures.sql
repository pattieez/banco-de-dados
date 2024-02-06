-- stored procedures
DELIMITER $

CREATE PROCEDURE NOME_EMPRESA()
BEGIN 
	SELECT 'EMPRESA DOS DADOS' AS EMPRESA;
END
$

DELIMITER ;
CALL NOME_EMPRESA();

-- procedures com parametros 
DELIMITER $

CREATE PROCEDURE CONTA(NUMERO1 INT, NUMERO2 INT)
BEGIN
	SELECT NUMERO1 + NUMERO2 AS CONTA;
END 
$

CALL CONTA(100, 50)$

DELIMITER ;

CREATE TABLE CURSOS(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(30) NOT NULL,
    HORAS INT (3) NOT NULL,
    VALOR FLOAT(10,2) NOT NULL
);
INSERT INTO CURSOS VALUES(NULL, 'JAVA', 20, 500.00);
INSERT INTO CURSOS VALUES(NULL, 'FUNDAMENTOS DE BANCO DE DADOS', 40, 700.00);

DELIMITER $

CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30), P_HORAS INT, P_VALOR FLOAT(10,2))
BEGIN
	INSERT INTO CURSOS VALUES(NULL, P_NOME, P_HORAS, P_VALOR);
END
$

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER', 35, 3000.00);
CALL CAD_CURSO('POWER BI', 20, 1000.00);
CALL CAD_CURSO('DATA SCIENCE', 50, 2000.00);

DELIMITER $
CREATE PROCEDURE LE_CURSO(P_IDCURSO INT)
BEGIN
	SELECT NOME, HORAS, VALOR FROM CURSOS
    WHERE IDCURSO = P_IDCURSO;
END
$

DELIMITER ;

CALL LE_CURSO(2);