#include "model.h"
#include <QDebug>
#include <QSqlQuery>

Model::Model(QObject *parent, Database *database) : m_database(database)
{

}

QString Model::nome()
{
    if(m_nome == "" || m_nome.isNull()) {
        QSqlQuery query(m_database->database());
        query.prepare("SELECT * FROM dev_academy");
        if(query.exec() && query.first()) {
            m_nome = query.value("nome").toString();
        }
    }
    return m_nome;
}

QString Model::email()
{
    if(m_email == "" || m_email.isNull()) {
        QSqlQuery query(m_database->database());
        query.prepare("SELECT * FROM dev_academy");
        if(query.exec() && query.first()) {
            m_email = query.value("email").toString();
        }
    }
    return m_email;
}

QString Model::id()
{
    if(m_id == "" || m_id.isNull()) {
        QSqlQuery query(m_database->database());
        query.prepare("SELECT * FROM dev_academy");
        if(query.exec() && query.first()) {
            m_id = query.value("id").toString();
        }
    }
    return m_id;
}



void Model::setNome(QString nome)
{
    QString id = "dev_academy";
    if(m_nome != nome) {
        QSqlQuery query(m_database->database());
        query.prepare("INSERT OR REPLACE INTO dev_academy (id, nome, email) VALUES (:id, :nome, :email)");
        query.bindValue(":id", id);
        query.bindValue(":nome", nome);
        query.bindValue(":email", m_email);

        if (query.exec()) {
            m_nome = nome;
            emit nomeChanged(m_nome);
        }
    }
}

void Model::setEmail(QString email)
{
    QString id = "dev_academy";
    if(m_email != email) {
        QSqlQuery query(m_database->database());
        query.prepare("INSERT OR REPLACE INTO dev_academy (id, nome, email) VALUES (:id, :nome, :email)");
        query.bindValue(":id", id);
        query.bindValue(":nome",m_nome);
        query.bindValue(":email", email);

        if (query.exec()) {
            m_email = email;
            emit emailChanged(m_email);
        }
    }
}
