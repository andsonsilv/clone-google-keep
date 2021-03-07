#ifndef NOTALISTMODEL_H
#define NOTALISTMODEL_H
#include <QCoreApplication>
#include <QAbstractListModel>
#include <QQmlEngine>
#include "nota.h"

class NotaListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        Titulo = Qt::UserRole + 1,
        Descricao,
        Cor,
        Data

    };
    Q_ENUM(Roles)

    explicit NotaListModel(QObject *parent = nullptr);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    QHash<int, QByteArray> roleNames() const;
    Q_INVOKABLE void addNota();
    static void registerTypes();

public slots:
    void insertNota(QString titulo, QString descricao, QString cor, QString data);
    void removeNota(int index);

private:
    QList<Nota> m_notas;
};

#endif // NOTALISTMODEL_H
