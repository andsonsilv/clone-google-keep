#include "notalistmodel.h"
#include <QAbstractListModel>
#include <QCoreApplication>

NotaListModel::NotaListModel(QObject *parent)
{

}

int NotaListModel::rowCount(const QModelIndex &parent) const
{
    return m_notas.size();
}

QVariant NotaListModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid()) {
        return QVariant();
    }
    switch(role) {
    case Titulo:
        return m_notas.at(index.row()).titulo;
        break;
    case Descricao:
        return m_notas.at(index.row()).descricao;
        break;
    case Cor:
        return m_notas.at(index.row()).cor;
        break;
    case Data:
        return m_notas.at(index.row()).data;
        break;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> NotaListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Titulo] = "titulo";
    roles[Descricao] = "descricao";
    roles[Cor] = "cor";
    roles[Data] = "data";
    return roles;
}

void NotaListModel::addNota()
{
    beginResetModel();
    m_notas.clear();
    m_notas.append(Nota("NOTA B", "DESCRICAO Y", "CORX","DATA1"));

    endResetModel();
}

void NotaListModel::insertNota(QString titulo, QString descricao, QString cor, QString data)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_notas.append(Nota(titulo, descricao, cor, data));
    endInsertRows();
}

void NotaListModel::removeNota(int index)
{
    beginRemoveRows(QModelIndex(), index, index);
    m_notas.removeAt(index);
    endRemoveRows();
}

void registerListModelTypes() {
    qmlRegisterType<NotaListModel>("Models", 1, 0, "NotaListModel");
}
Q_COREAPP_STARTUP_FUNCTION(registerListModelTypes)
