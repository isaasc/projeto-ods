CREATE DATABASE IF NOT EXISTS micro-ods;
USE micro-ods;

CREATE TABLE ods (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

INSERT INTO ods (id, nome) VALUES
    (3, 'Objetivo 3: Saúde e Bem-Estar');

CREATE TABLE objetivo (
    id VARCHAR(5) PRIMARY KEY,
    id_ods INT,
    descricao_global TEXT,
    descricao_brasil TEXT NOT NULL,
    FOREIGN KEY (id_ods) REFERENCES ods(id)
);

INSERT INTO objetivo (id, id_ods, descricao_global, descricao_brasil) VALUES
    ('3.1', 3, 'Até 2030, reduzir a taxa de mortalidade materna global para menos de 70 mortes por 100.000 nascidos vivos.', 'Até 2030, reduzir a razão de mortalidade materna para no máximo 30 mortes por 100.000 nascidos vivos.');

CREATE TABLE indicador (
    id VARCHAR(10) PRIMARY KEY,
    id_objetivo VARCHAR(5),
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_objetivo) REFERENCES objetivos(id)
);

INSERT INTO indicador (id, id_objetivo, nome, descricao) VALUES
    ('3.3.1', '3.1', 'Razão de mortalidade materna', 'Taxa de mortalidade materna (Óbitos por 100.000 nascidos vivos)');

CREATE TABLE indicador_valor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_indicador VARCHAR(10),
    ano INT NOT NULL,
    localidade VARCHAR(100),
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_indicador) REFERENCES indicador(id),
    PRIMARY KEY (id_indicador, ano, localidade)
);

INSERT INTO indicador_valor (id_indicador, ano, localidade, valor)
VALUES
    ('3.1.2', 2015, 'Brasil', 98.2),
    ('3.1.2', 2016, 'Brasil', 98.6),
    ('3.1.2', 2017, 'Brasil', 98.7),
    ('3.1.2', 2018, 'Brasil', 98.8),
    ('3.1.2', 2019, 'Brasil', 98.4),
    ('3.1.2', 2020, 'Brasil', 98.4),
    
    ('3.1.2', 2015, 'Norte', 95.1),
    ('3.1.2', 2016, 'Norte', 95.2),
    ('3.1.2', 2017, 'Norte', 96),
    ('3.1.2', 2018, 'Norte', 96.9),
    ('3.1.2', 2019, 'Norte', 96.3),
    ('3.1.2', 2020, 'Norte', 96.7),
    
    ('3.1.2', 2015, 'Rondônia', 96.5),
    ('3.1.2', 2016, 'Rondônia', 91.8),
    ('3.1.2', 2017, 'Rondônia', 90.6),
    ('3.1.2', 2018, 'Rondônia', 96.9),
    ('3.1.2', 2019, 'Rondônia', 99.4),
    ('3.1.2', 2020, 'Rondônia', 99.3),
   
    ('3.1.2', 2015, 'Nordeste', 97.5),
    ('3.1.2', 2016, 'Nordeste', 98),
    ('3.1.2', 2017, 'Nordeste', 97.9),
    ('3.1.2', 2018, 'Nordeste', 98.1),
    ('3.1.2', 2019, 'Nordeste', 97.1),
    ('3.1.2', 2020, 'Nordeste', 97.1),
    
    ('3.1.2', 2015, 'Maranhão', 96.7),
    ('3.1.2', 2016, 'Maranhão', 96.9),
    ('3.1.2', 2017, 'Maranhão', 97),
    ('3.1.2', 2018, 'Maranhão', 98.1),
    ('3.1.2', 2019, 'Maranhão', 98),
    ('3.1.2', 2020, 'Maranhão', 92.1),
    
    ('3.1.2', 2015, 'Sudeste', 98.9),
    ('3.1.2', 2016, 'Sudeste', 99.4),
    ('3.1.2', 2017, 'Sudeste', 99.5),
    ('3.1.2', 2018, 'Sudeste', 99.5),
    ('3.1.2', 2019, 'Sudeste', 99.4),
    ('3.1.2', 2020, 'Sudeste', 99.4),
    
    ('3.1.2', 2015, 'Minas Gerais', 98.6),
    ('3.1.2', 2016, 'Minas Gerais', 99),
    ('3.1.2', 2017, 'Minas Gerais', 99.2),
    ('3.1.2', 2018, 'Minas Gerais', 99.1),
    ('3.1.2', 2019, 'Minas Gerais', 98.9),
    ('3.1.2', 2020, 'Minas Gerais', 98.8),
    
    ('3.1.2', 2015, 'Sul', 99.6),
    ('3.1.2', 2016, 'Sul', 99.6),
    ('3.1.2', 2017, 'Sul', 99.6),
    ('3.1.2', 2018, 'Sul', 99.5),
    ('3.1.2', 2019, 'Sul', 99.3),
    ('3.1.2', 2020, 'Sul', 99.5),
    
    ('3.1.2', 2015, 'Paraná', 99.3),
    ('3.1.2', 2016, 'Paraná', 99.5),
    ('3.1.2', 2017, 'Paraná', 99.4),
    ('3.1.2', 2018, 'Paraná', 99.5),
    ('3.1.2', 2019, 'Paraná', 99.6),
    ('3.1.2', 2020, 'Paraná', 99.7),
    
    ('3.1.2', 2015, 'Centro-Oeste', 98.1),
    ('3.1.2', 2016, 'Centro-Oeste', 98.8),
    ('3.1.2', 2017, 'Centro-Oeste', 99.2),
    ('3.1.2', 2018, 'Centro-Oeste', 99.2),
    ('3.1.2', 2019, 'Centro-Oeste', 99.1),
    ('3.1.2', 2020, 'Centro-Oeste', 99),
    
    ('3.1.2', 2015, 'Mato Grosso do Sul', 98.8),
    ('3.1.2', 2016, 'Mato Grosso do Sul', 99.6),
    ('3.1.2', 2017, 'Mato Grosso do Sul', 99.5),
    ('3.1.2', 2018, 'Mato Grosso do Sul', 99.5),
    ('3.1.2', 2019, 'Mato Grosso do Sul', 99.6),
    ('3.1.2', 2020, 'Mato Grosso do Sul', 99.5),
    
    ('3.1.2', 2015, 'Mato Grosso', 98.5),
    ('3.1.2', 2016, 'Mato Grosso', 98.4),
    ('3.1.2', 2017, 'Mato Grosso', 98.9),
    ('3.1.2', 2018, 'Mato Grosso', 98.3),
    ('3.1.2', 2019, 'Mato Grosso', 97.9),
    ('3.1.2', 2020, 'Mato Grosso', 98.1),
    
    ('3.1.2', 2015, 'Goiás', 97),
    ('3.1.2', 2016, 'Goiás', 99.2),
    ('3.1.2', 2017, 'Goiás', 99.3),
    ('3.1.2', 2018, 'Goiás', 99.4),
    ('3.1.2', 2019, 'Goiás', 99.4),
    ('3.1.2', 2020, 'Goiás', 99),

    ('3.1.2', 2015, 'Acre', 95.7),
    ('3.1.2', 2016, 'Acre', 98.2),
    ('3.1.2', 2017, 'Acre', 97.4),
    ('3.1.2', 2018, 'Acre', 98),
    ('3.1.2', 2019, 'Acre', 97.8),
    ('3.1.2', 2020, 'Acre', 97.7),
    
    ('3.1.2', 2015, 'Amazonas', 95.5),
    ('3.1.2', 2016, 'Amazonas', 95.5),
    ('3.1.2', 2017, 'Amazonas', 96.4),
    ('3.1.2', 2018, 'Amazonas', 96.6),
    ('3.1.2', 2019, 'Amazonas', 95.8),
    ('3.1.2', 2020, 'Amazonas', 95.7),
    
    ('3.1.2', 2015, 'Roraima', 92.4),
    ('3.1.2', 2016, 'Roraima', 92),
    ('3.1.2', 2017, 'Roraima', 93.3),
    ('3.1.2', 2018, 'Roraima', 91.1),
    ('3.1.2', 2019, 'Roraima', 91.3),
    ('3.1.2', 2020, 'Roraima', 90.6),
    
    ('3.1.2', 2015, 'Pará', 93.8),
    ('3.1.2', 2016, 'Pará', 94.7),
    ('3.1.2', 2017, 'Pará', 96.1),
    ('3.1.2', 2018, 'Pará', 96.7),
    ('3.1.2', 2019, 'Pará', 95.9),
    ('3.1.2', 2020, 'Pará', 97),
    
    ('3.1.2', 2015, 'Amapá', 97.8),
    ('3.1.2', 2016, 'Amapá', 98.2),
    ('3.1.2', 2017, 'Amapá', 98.3),
    ('3.1.2', 2018, 'Amapá', 98.4),
    ('3.1.2', 2019, 'Amapá', 94),
    ('3.1.2', 2020, 'Amapá', 97.5),
    
    ('3.1.2', 2015, 'Tocantins', 99),
    ('3.1.2', 2016, 'Tocantins', 98.9),
    ('3.1.2', 2017, 'Tocantins', 99.3),
    ('3.1.2', 2018, 'Tocantins', 99.4),
    ('3.1.2', 2019, 'Tocantins', 99.3),
    ('3.1.2', 2020, 'Tocantins', 98.2),
    
    ('3.1.2', 2015, 'Piauí', 98.5),
    ('3.1.2', 2016, 'Piauí', 98.7),
    ('3.1.2', 2017, 'Piauí', 98.6),
    ('3.1.2', 2018, 'Piauí', 99.1),
    ('3.1.2', 2019, 'Piauí', 99.2),
    ('3.1.2', 2020, 'Piauí', 99),
    
    ('3.1.2', 2015, 'Ceará', 96.2),
    ('3.1.2', 2016, 'Ceará', 98.6),
    ('3.1.2', 2017, 'Ceará', 99),
    ('3.1.2', 2018, 'Ceará', 98.2),
    ('3.1.2', 2019, 'Ceará', 96.5),
    ('3.1.2', 2020, 'Ceará', 96.4),
    
    ('3.1.2', 2015, 'Rio Grande do Norte', 96.4),
    ('3.1.2', 2016, 'Rio Grande do Norte', 94),
    ('3.1.2', 2017, 'Rio Grande do Norte', 99.3),
    ('3.1.2', 2018, 'Rio Grande do Norte', 98.8),
    ('3.1.2', 2019, 'Rio Grande do Norte', 99.6),
    ('3.1.2', 2020, 'Rio Grande do Norte', 99.6),
    
    ('3.1.2', 2015, 'Paraíba', 98.9),
    ('3.1.2', 2016, 'Paraíba', 99.2),
    ('3.1.2', 2017, 'Paraíba', 99.2),
    ('3.1.2', 2018, 'Paraíba', 99.4),
    ('3.1.2', 2019, 'Paraíba', 98.4),
    ('3.1.2', 2020, 'Paraíba', 98),
    
    ('3.1.2', 2015, 'Pernambuco', 98.3),
    ('3.1.2', 2016, 'Pernambuco', 98.8),
    ('3.1.2', 2017, 'Pernambuco', 98.5),
    ('3.1.2', 2018, 'Pernambuco', 98.9),
    ('3.1.2', 2019, 'Pernambuco', 99),
    ('3.1.2', 2020, 'Pernambuco', 99),
    
    ('3.1.2', 2015, 'Alagoas', 99),
    ('3.1.2', 2016, 'Alagoas', 99),
    ('3.1.2', 2017, 'Alagoas', 92),
    ('3.1.2', 2018, 'Alagoas', 95.4),
    ('3.1.2', 2019, 'Alagoas', 86.2),
    ('3.1.2', 2020, 'Alagoas', 99.1),
    
    ('3.1.2', 2015, 'Sergipe', 99.3),
    ('3.1.2', 2016, 'Sergipe', 99.3),
    ('3.1.2', 2017, 'Sergipe', 99.2),
    ('3.1.2', 2018, 'Sergipe', 99.4),
    ('3.1.2', 2019, 'Sergipe', 99.1),
    ('3.1.2', 2020, 'Sergipe', 99.1),
    
    ('3.1.2', 2015, 'Bahia', 97.3),
    ('3.1.2', 2016, 'Bahia', 97.8),
    ('3.1.2', 2017, 'Bahia', 97.7),
    ('3.1.2', 2018, 'Bahia', 97.3),
    ('3.1.2', 2019, 'Bahia', 96.7),
    ('3.1.2', 2020, 'Bahia', 97.1),
    
    ('3.1.2', 2015, 'Espírito Santo', 99.3),
    ('3.1.2', 2016, 'Espírito Santo', 99.8),
    ('3.1.2', 2017, 'Espírito Santo', 99.7),
    ('3.1.2', 2018, 'Espírito Santo', 99.7),
    ('3.1.2', 2019, 'Espírito Santo', 99.8),
    ('3.1.2', 2020, 'Espírito Santo', 99.7),
    
    ('3.1.2', 2015, 'Rio de Janeiro', 99.6),
    ('3.1.2', 2016, 'Rio de Janeiro', 99.6),
    ('3.1.2', 2017, 'Rio de Janeiro', 99.5),
    ('3.1.2', 2018, 'Rio de Janeiro', 99.5),
    ('3.1.2', 2019, 'Rio de Janeiro', 99.5),
    ('3.1.2', 2020, 'Rio de Janeiro', 99.5),
    
    ('3.1.2', 2015, 'São Paulo', 98.8),
    ('3.1.2', 2016, 'São Paulo', 99.5),
    ('3.1.2', 2017, 'São Paulo', 99.7),
    ('3.1.2', 2018, 'São Paulo', 99.7),
    ('3.1.2', 2019, 'São Paulo', 99.6),
    ('3.1.2', 2020, 'São Paulo', 99.5),
    
    ('3.1.2', 2015, 'Santa Catarina', 99.5),
    ('3.1.2', 2016, 'Santa Catarina', 99.6),
    ('3.1.2', 2017, 'Santa Catarina', 99.7),
    ('3.1.2', 2018, 'Santa Catarina', 99.1),
    ('3.1.2', 2019, 'Santa Catarina', 98),
    ('3.1.2', 2020, 'Santa Catarina', 98.9),
    
    ('3.1.2', 2015, 'Rio Grande do Sul', 99.8),
    ('3.1.2', 2016, 'Rio Grande do Sul', 99.8),
    ('3.1.2', 2017, 'Rio Grande do Sul', 99.8),
    ('3.1.2', 2018, 'Rio Grande do Sul', 99.8),
    ('3.1.2', 2019, 'Rio Grande do Sul', 99.8),
    ('3.1.2', 2020, 'Rio Grande do Sul', 99.8),
    
    ('3.1.2', 2015, 'Distrito Federal', 99.6),
    ('3.1.2', 2016, 'Distrito Federal', 98),
    ('3.1.2', 2017, 'Distrito Federal', 99.4),
    ('3.1.2', 2018, 'Distrito Federal', 99.5),
    ('3.1.2', 2019, 'Distrito Federal', 99.5),
    ('3.1.2', 2020, 'Distrito Federal', 99.5);
