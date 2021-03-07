#include "nota.h"

Nota::Nota()
{

}

Nota::Nota(const QString &titulo, const QString &descricao, const QString& cor, const QString& data)
{
    this->titulo = titulo;
    this->descricao = descricao;
    this->cor = cor;
    this->data = data;
}
