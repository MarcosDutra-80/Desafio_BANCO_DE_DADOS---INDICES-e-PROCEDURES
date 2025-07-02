use company_constraints;
show tables;

desc employee;
desc departament;
desc works_on;
DESC dept_locations;

SELECT * FROM EMPLOYEE;
SELECT * FROM departament;
SELECT * FROM dept_locations;



-- Criando Procedimento para Aumento de Salario  
DELIMITER //

CREATE PROCEDURE gerenciar_funcionario (
    IN acao INT,
    IN emp_id CHAR(9),
    IN novo_salario DECIMAL(10,2),
    IN Fname VARCHAR (15),
    IN Minit CHAR (1),
    IN Lname VARCHAR (15),
    IN Ssn CHAR (9),
    IN Bdate DATE ,
    IN Address VARCHAR (30),
    IN Sex CHAR (1),
    IN Salary DECIMAL (10,2),
    IN Super_Ssn CHAR (9),
    IN Dno INT
    
)
BEGIN
    DECLARE sal_atual DECIMAL(10,2);
    DECLARE aumento DECIMAL(10,2);

    IF acao = 1 THEN
        -- Exemplo básico de INSERT
        INSERT INTO employee (Fname, Minit, Lname ,Ssn, Bdate, Address, sex, Salary, Super_ssn, Dno) 
			VALUES (Fname, Minit, Lname ,Ssn, Bdate, Address, sex, Salary, Super_ssn, Dno);
        SELECT 'Funcionário inserido com sucesso.' AS mensagem;

    ELSEIF acao = 2 THEN
        -- Atualizar salário com lógica do aumento
        SELECT Salary INTO sal_atual FROM employee WHERE Ssn = emp_id;

        SET aumento = CASE
            WHEN sal_atual >= 50000 THEN sal_atual * 0.05
            WHEN sal_atual >= 40000 THEN sal_atual * 0.10
            WHEN sal_atual <= 30000 THEN sal_atual * 0.15
            ELSE 0
        END;

        UPDATE employee SET Salary = Salary + aumento WHERE Ssn = emp_id;

        IF novo_salario >= 50000 THEN
            SELECT novo_salario AS Salario, 'O aumento de salario foi de 5%' AS mensagem;
        ELSEIF novo_salario >= 40000 THEN
            SELECT novo_salario AS Salario, 'O aumento de salario foi de 10%' AS mensagem;
        ELSEIF novo_salario <= 30000 THEN
            SELECT novo_salario AS Salario, 'O aumento de salario foi de 15%' AS mensagem;
        ELSE
            SELECT 'Não foi possível realizar o aumento' AS erro;
        END IF;

    ELSEIF acao = 3 THEN
        -- Remover funcionário
        DELETE FROM employee WHERE Ssn = emp_id;
        SELECT 'Funcionário removido com sucesso.' AS mensagem;

    ELSE
        SELECT 'Ação inválida. Use 1 para inserir, 2 para atualizar e 3 para deletar.' AS erro;
    END IF;
END //

DELIMITER ;

-- Exemplo  de uso da função inserindo um novo funcionario
CALL gerenciar_funcionario (1, NULL, NULL, 'Franklin', 'T', 'Wong', 333245558, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, 888665555, 5);
