use company_constraints;
show tables;

desc employee;
desc departament;
desc works_on;
DESC dept_locations;

SELECT * FROM EMPLOYEE;
SELECT * FROM departament;
SELECT * FROM dept_locations;

-- CRIAÇÃO DOS INDICES PARA FACILITAR A BUSCAR DO SGBS
ALTER TABLE employee ADD INDEX index_numero_departamento(Dno);
ALTER TABLE departament ADD INDEX index_Dnumber(Dnumber);


 SELECT * FROM departament;
 
 -- QUERIE RESPONDENDO A PERGUNTA => (Qual o departamento com maior número de pessoas? )
 SELECT Dno , COUNT(*)  AS quantidade_de_empregados FROM employee
	GROUP BY dno
	ORDER BY quantidade_de_empregados DESC LIMIT 1;
	
-- QUERIE RESPONDENDO A PERGUNTA =>  (Quais são os departamentos por cidade? )
SELECT DISTINCT Dnumber , Dlocation FROM dept_locations;

-- QUERIE RESPONDENDO A PERGUNTA => (Relação de empregrados por departamento)
SELECT CONCAT(Fname ,' ', Minit ,' ',Lname) AS nome_completo , d.Dname
	FROM employee e JOIN departament d ON e.Dno = d.Dnumber
    ORDER BY d.Dname;



