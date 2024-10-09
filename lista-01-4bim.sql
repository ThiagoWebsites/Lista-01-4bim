-- 1. Exibir lista de alunos e seus cursos
-- Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.

CREATE OR REPLACE VIEW VW_1 AS
SELECT 
aluno.nome,
disciplina.nome as disciplina,
curso.nome as curso
from aluno
left join matricula
on aluno.id_aluno = matricula.id_aluno
left join disciplina
on matricula.id_disciplina = disciplina.id_disciplina
left join curso
on disciplina.id_curso = curso.id_curso;

SELECT * FROM VW_1;

-- 2. Exibir total de alunos por disciplina
-- Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.

CREATE OR REPLACE VIEW VW_2 AS
SELECT
disciplina.nome,
matricula.id_matricula
from matricula
inner join disciplina 
on disciplina.id_disciplina = matricula.id_disciplina;

SELECT * FROM VW_2;

--  3. Exibir alunos e status das suas matrículas
-- Crie uma view que mostre o nome dos alunos, suas disciplinas e o status da matrícula (Ativo, Concluído, Trancado).

CREATE OR REPLACE VIEW VW_3 AS

SELECT
aluno.nome,
disciplina.nome as disciplina,
matricula.status as status
from disciplina
inner join matricula
on disciplina.id_disciplina = matricula.id_disciplina
inner join aluno
on matricula.id_aluno = aluno.id_aluno;


SELECT * FROM VW_3;

-- 4. Exibir professores e suas turmas
-- Crie uma view que mostre o nome dos professores e as disciplinas que eles lecionam, com os horários das turmas.

CREATE OR REPLACE VIEW VW_4 AS
SELECT
disciplina.nome as disciplina,
professor.nome as professor,
turma.horario
from disciplina
inner join turma
on disciplina.id_disciplina = turma.id_disciplina
inner join professor
on turma.id_professor = professor.id_professor;

SELECT * FROM VW_4;


-- 5. Exibir alunos maiores de 20 anos
-- Crie uma view que exiba o nome e a data de nascimento dos alunos que têm mais de 20 anos.

CREATE OR REPLACE VIEW VW_5 AS
SELECT
aluno.nome,
aluno.data_nascimento
from aluno
where data_nascimento < '2006/10/09';

SELECT * FROM VW_5;


-- 6. Exibir disciplinas e carga horária total por curso
-- Crie uma view que exiba o nome dos cursos, a quantidade de disciplinas associadas e a carga horária total de cada curso.

CREATE OR REPLACE VIEW VW_6 AS
SELECT
curso.nome,
curso.carga_horaria,
COUNT(disciplina.nome)
from curso
inner join disciplina
on curso.id_curso = disciplina.id_curso;

SELECT * FROM VW_6;

-- 7. Exibir professores e suas especialidades
-- Crie uma view que exiba o nome dos professores e suas especialidades.

CREATE OR REPLACE VIEW VW_7 AS
SELECT
professor.nome,
professor.especialidade
from professor;

SELECT * FROM VW_7;


-- 8. Exibir alunos matriculados em mais de uma disciplina
-- Crie uma view que mostre os alunos que estão matriculados em mais de uma disciplina.

-- Não consegui

-- 9. Exibir alunos e o número de disciplinas que concluíram
-- Crie uma view que exiba o nome dos alunos e o número de disciplinas que eles concluíram.

SELECT
aluno.nome,
disciplina.id_disciplina
from disciplina
inner join matricula
on disciplina.id_disciplina = matricula.id_disciplina
inner join aluno
on matricula.id_aluno = aluno.id_aluno
where matricula.status = "concluído";


-- 10. Exibir todas as turmas de um semestre específico
-- Crie uma view que exiba todas as turmas que ocorrem em um determinado semestre (ex.: 2024.1).

SELECT
turma.id_turma,
turma.semestre
from turma
where turma.semestre = 2024.1;
