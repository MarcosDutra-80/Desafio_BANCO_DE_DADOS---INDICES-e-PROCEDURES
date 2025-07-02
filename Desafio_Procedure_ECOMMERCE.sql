SHOW databases;
USE ecommerce;

show tables ;
Desc clients;
Select * FROM clients;

-- Criando Procedimento para inserção de novo cliente no Banco de Dados
Delimiter //
CREATE PROCEDURE novo_cliente(
    IN Fname VARCHAR(10) , 
    IN Minit CHAR (3), 
    IN Lname VARCHAR (20), 
    IN CPF CHAR (11) , 
    IN Address VARCHAR (255)
    )
BEGIN
	INSERT INTO clients (Fname, Minit, Lname, CPF, ADDRESS)   
		VALUES (Fname, Minit, Lname, CPF, ADDRESS);
	SELECT * FROM clients;

END //
Delimiter //

CALL novo_cliente ('MARCOS' , 'HT' , 'Dutra', '15575079873' , 'RUA AUGUSTINHO SILVA 50 , LAGOINHA, BELO HORIZONTE')