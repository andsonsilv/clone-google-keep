CREATE TABLE nota (
    id       TEXT    PRIMARY KEY,
    titulo     TEXT,
    descricao TEXT
);

CREATE TABLE dev_academy (
    id    TEXT PRIMARY KEY,
    nome  TEXT,
    senha TEXT
);

INSERT INTO nota(id, titulo, descricao) VALUES ('1', 'titulo1', 'nota1');
INSERT INTO nota(id, titulo, descricao) VALUES ('2', 'titulo2', 'nota2');
INSERT INTO nota(id, titulo, descricao) VALUES ('3', 'titulo3', 'nota3');
