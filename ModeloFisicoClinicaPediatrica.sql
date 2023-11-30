/* DiagramaLogicoClinicaPediatrica: */

CREATE TABLE Paciente (
    ID_paciente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Data_de_Nascimento DATE,
    fk_Endereco_Endereco_PK INT,
    fk_Telefone_Telefone_PK INT,
    E_mail VARCHAR(255),
    fk_Consulta_ID_Consulta INT,
    fk_Consulta_ID_Paciente INT,
    fk_Consulta_ID_Medico INT
);

CREATE TABLE Medico (
    ID_Medico INT PRIMARY KEY,
    Nome VARCHAR(255),
    Especialidade VARCHAR(100),
    CPF CHAR(11),
    fk_Endereco_Endereco_PK INT,
    fk_Telefone_Telefone_PK INT,
    E_mail VARCHAR(255)
);

CREATE TABLE Consulta (
    ID_Consulta INT,
    Data DATE,
    Descricao TEXT,
    ID_Paciente INT,
    ID_Medico INT,
    PRIMARY KEY (ID_Consulta, ID_Paciente, ID_Medico)
);

CREATE TABLE Tratamento (
    ID_Tratamento INT,
    Descricao TEXT,
    ID_Paciente INT,
    Data Fim DATE,
    PRIMARY KEY (ID_Tratamento, ID_Paciente)
);

CREATE TABLE Responsavel (
    ID_Responsavel INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF CHAR(11),
    fk_Endereco_Endereco_PK INT,
    fk_Telefone_Telefone_PK INT,
    E_mail VARCHAR(255)
);

CREATE TABLE Etnia (
    ID_Etinia INT PRIMARY KEY,
    fk_Descricao_Descricao_PK INT
);

CREATE TABLE Endereco_Paciente (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    Casa,_Apartamento,_Trabalho ENUM,
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    CEP CHAR(8),
    Estado CHAR(2)
);

CREATE TABLE Telefone_Paciente (
    Telefone_PK INT NOT NULL PRIMARY KEY,
    Celular VARCHAR(15),
    Fixo VARCHAR(14)
);

CREATE TABLE Endereco_Medico (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    Casa,_Apartamento,_Trabalho ENUM,
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(100),
    Bairro varchar(100),
    Cidade VARCHAR(100),
    CEP CHAR(8),
    Estado CHAR(2)
);

CREATE TABLE Telefone_Medico (
    Telefone_PK INT NOT NULL PRIMARY KEY,
    Celular VARCHAR(15),
    Fixo VARCHAR(14)
);

CREATE TABLE Endereco_Responsavel (
    Endereco_PK INT NOT NULL PRIMARY KEY,
    Casa,_Apartamento,_Trabalho ENUN,
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(100),
    Bairro VARCHAR(20),
    Cidade VARCHAR(100),
    CEP CHAR(8),
    Estado CHAR(2)
);

CREATE TABLE Telefone_Responsavel (
    Telefone_PK INT NOT NULL PRIMARY KEY,
    Celular VARCHAR(15),
    Fixo VARCHAR(14)
);

CREATE TABLE Descricao (
    Descricao_PK INT NOT NULL PRIMARY KEY,
    Descricao TEXT
);

CREATE TABLE Paciente_Responsavel (
    fk_Paciente_ID_paciente INT,
    fk_Responsavel_ID_Responsavel INT,
    ID_paciente INT,
    ID_Responsavel INT,
    Tipo_String_ STRING
);

CREATE TABLE Tratamento_Paciente (
    fk_Tratamento_ID_Tratamento INT,
    fk_Tratamento_ID_Paciente INT,
    fk_Paciente_ID_paciente INT
);

CREATE TABLE Consulta_Medico (
    fk_Consulta_ID_Consulta INT,
    fk_Consulta_ID_Paciente INT,
    fk_Consulta_ID_Medico INT,
    fk_Medico_ID_Medico INT
);

CREATE TABLE Etnia_Paciente (
    fk_Etnia_ID_Etinia INT,
    fk_Paciente_ID_paciente INT
);
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco_Paciente (Endereco_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_3
    FOREIGN KEY (fk_Telefone_Telefone_PK)
    REFERENCES Telefone_Paciente (Telefone_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_4
    FOREIGN KEY (fk_Consulta_ID_Consulta, fk_Consulta_ID_Paciente, fk_Consulta_ID_Medico)
    REFERENCES Consulta (ID_Consulta, ID_Paciente, ID_Medico)
    ON DELETE RESTRICT;
 
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco_Medico (Endereco_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_3
    FOREIGN KEY (fk_Telefone_Telefone_PK)
    REFERENCES Telefone_Medico (Telefone_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Responsavel ADD CONSTRAINT FK_Responsavel_2
    FOREIGN KEY (fk_Endereco_Endereco_PK)
    REFERENCES Endereco_Responsavel (Endereco_PK)
    ON DELETE NO ACTION;
 
ALTER TABLE Responsavel ADD CONSTRAINT FK_Responsavel_3
    FOREIGN KEY (fk_Telefone_Telefone_PK)
    REFERENCES Telefone_Responsavel (Telefone_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Etnia ADD CONSTRAINT FK_Etnia_2
    FOREIGN KEY (fk_Descricao_Descricao_PK)
    REFERENCES Descricao (Descricao_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Paciente_Responsavel ADD CONSTRAINT FK_Paciente_Responsavel_1
    FOREIGN KEY (fk_Paciente_ID_paciente)
    REFERENCES Paciente (ID_paciente)
    ON DELETE RESTRICT;
 
ALTER TABLE Paciente_Responsavel ADD CONSTRAINT FK_Paciente_Responsavel_2
    FOREIGN KEY (fk_Responsavel_ID_Responsavel)
    REFERENCES Responsavel (ID_Responsavel)
    ON DELETE RESTRICT;
 
ALTER TABLE Tratamento_Paciente ADD CONSTRAINT FK_Tratamento_Paciente_1
    FOREIGN KEY (fk_Tratamento_ID_Tratamento, fk_Tratamento_ID_Paciente)
    REFERENCES Tratamento (ID_Tratamento, ID_Paciente)
    ON DELETE RESTRICT;
 
ALTER TABLE Tratamento_Paciente ADD CONSTRAINT FK_Tratamento_Paciente_2
    FOREIGN KEY (fk_Paciente_ID_paciente)
    REFERENCES Paciente (ID_paciente)
    ON DELETE SET NULL;
 
ALTER TABLE Consulta_Medico ADD CONSTRAINT FK_Consulta_Medico_1
    FOREIGN KEY (fk_Consulta_ID_Consulta, fk_Consulta_ID_Paciente, fk_Consulta_ID_Medico)
    REFERENCES Consulta (ID_Consulta, ID_Paciente, ID_Medico)
    ON DELETE RESTRICT;
 
ALTER TABLE Consulta_Medico ADD CONSTRAINT FK_Consulta_Medico_2
    FOREIGN KEY (fk_Medico_ID_Medico)
    REFERENCES Medico (ID_Medico)
    ON DELETE RESTRICT;
 
ALTER TABLE Etnia_Paciente ADD CONSTRAINT FK_Etnia_Paciente_1
    FOREIGN KEY (fk_Etnia_ID_Etinia)
    REFERENCES Etnia (ID_Etinia)
    ON DELETE SET NULL;
 
ALTER TABLE Etnia_Paciente ADD CONSTRAINT FK_Etnia_Paciente_2
    FOREIGN KEY (fk_Paciente_ID_paciente)
    REFERENCES Paciente (ID_paciente)
    ON DELETE SET NULL;