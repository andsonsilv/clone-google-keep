#include "notadatabasemodel.h"
#include <QCoreApplication>
#include <QModelIndex>
#include <QQmlEngine>
#include <QDebug>
#include <QSqlError>
#include <QSqlQuery>
#include <QUuid>

NotaDatabaseModel::NotaDatabaseModel(QObject *parent, Database *database) : QSqlTableModel(parent, database->database())
{
    setTable("nota");
    this->configureRoles();
    this->select();
    this->setEditStrategy(QSqlTableModel::OnRowChange);
}

void NotaDatabaseModel::configureRoles()
{
    registerRoleColumn(Id, "id");
    registerRoleColumn(Titulo, "titulo");
    registerRoleColumn(Descricao, "descricao");
    registerRoleColumn(Cor,"cor");
    registerRoleColumn(Data,"data");
}

QHash<int, QByteArray> NotaDatabaseModel::roleNames() const
{
    return m_roleColumns;
}

void NotaDatabaseModel::registerRoleColumn(int role, QByteArray columnName)
{
    m_roleColumns.insert(role, columnName);
}

QVariant NotaDatabaseModel::data(const QModelIndex &index, int role) const
{
    if(m_roleColumns.contains(role)) {
        int column = fieldIndex(m_roleColumns.value(role));
        QModelIndex itemListIndex = QSqlTableModel::index(index.row(), column);
        return QSqlTableModel::data(itemListIndex);
    }
    return QVariant();
}

void NotaDatabaseModel::newRow(QString titulo, QString descricao, QString cor, QString data)
{
    QString id = QUuid().createUuid().toString().replace("{", "").replace("}", "");
    QSqlQuery insertQuery(QSqlTableModel::database());
    insertQuery.prepare(
                "insert into nota(id, titulo, descricao, cor, data) "
                "VALUES (:id, :titulo, :descricao, :cor, :data) "
    );
    insertQuery.bindValue(":id", id);
    insertQuery.bindValue(":titulo", titulo);
    insertQuery.bindValue(":descricao", descricao);
    insertQuery.bindValue(":cor", cor);
    insertQuery.bindValue(":data", data);
    insertQuery.exec();
    select();
}

void NotaDatabaseModel::updateRow(QString id, QString titulo, QString descricao, QString cor, QString data)
{
    QSqlQuery updateQuery(QSqlTableModel::database());
    updateQuery.prepare(
                "update nota set titulo = :titulo, descricao = :descricao , cor = :cor, data = :data "
                "where id = :id"
    );
    updateQuery.bindValue(":id", id);
    updateQuery.bindValue(":titulo", titulo);
    updateQuery.bindValue(":descricao", descricao);
    updateQuery.bindValue(":cor", cor);
    updateQuery.bindValue(":data", data);
    updateQuery.exec();
    select();
}

void NotaDatabaseModel::deleteRow(QString id)
{
    QSqlQuery deleteQuery(QSqlTableModel::database());
    deleteQuery.prepare("delete from nota where id = :id");
    deleteQuery.bindValue(":id", id);
    deleteQuery.exec();
    select();
}

void registerTypes() {
    qmlRegisterType<NotaDatabaseModel>("Models", 1, 0, "NotaDatabaseModel");
}
Q_COREAPP_STARTUP_FUNCTION(registerTypes)
