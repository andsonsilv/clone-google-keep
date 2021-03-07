#ifndef NOTA_H
#define NOTA_H
#include <QString>

class Nota
{
public:
    Nota();
    Nota(const QString& titulo, const QString& descricao, const QString& cor, const QString& data);
    QString titulo;
    QString descricao;
    QString cor;
    QString data;

};

#endif // NOTA_H
