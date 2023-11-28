export interface Objetivo {
    id: string;
    idOds: number;
    descricaoGlobal?: string;
    descricaoBrasil: string;
}
// CREATE TABLE objetivo (
//     id VARCHAR(5) PRIMARY KEY,
//     id_ods INT,
//     descricao_global TEXT,
//     descricao_brasil TEXT NOT NULL,
//     FOREIGN KEY (id_ods) REFERENCES ods(id)
// );