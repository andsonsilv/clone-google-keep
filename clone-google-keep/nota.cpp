#include "nota.h"

Nota::Nota()
{

}

Nota::Nota(const QString &titulo, const QString &descricao)
{
    this->titulo = titulo;
    this->descricao = descricao;
}
