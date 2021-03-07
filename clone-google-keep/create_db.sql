CREATE TABLE nota (
    id       TEXT    PRIMARY KEY,
    titulo     TEXT,
    descricao TEXT,
    cor TEXT,
    data TEXT
);

CREATE TABLE dev_academy (
    id    TEXT PRIMARY KEY,
    nome  TEXT,
    email TEXT
);

INSERT INTO nota(id, titulo, descricao, cor, data) VALUES ('1', 'titulo1', 'nota1', 'blue', '12011998');
INSERT INTO nota(id, titulo, descricao, cor, data) VALUES ('2', 'titulo2', 'nota2', 'red', '12011998');
INSERT INTO nota(id, titulo, descricao, cor, data) VALUES ('3', 'titulo3', 'nota3', 'pink', '12011998');
