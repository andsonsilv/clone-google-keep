#ifndef NOTA_H
#define NOTA_H
#include <QString>

class Nota
{
public:
    Nota();
    Nota(const QString& titulo, const QString& descricao);
    QString titulo;
    QString descricao;
};

#endif // NOTA_H
