#ifndef MODEL_H
#define MODEL_H
#include <QObject>
#include "database.h"

class Model : public QObject
{
Q_OBJECT
public:
    explicit Model(QObject *parent = nullptr, Database *database = new Database());

    Q_PROPERTY(QString nome READ nome NOTIFY nomeChanged)
    Q_PROPERTY(QString email READ email NOTIFY emailChanged)
    Q_PROPERTY(QString id READ id)
    QString nome();
    QString email();
    QString id();


    Q_INVOKABLE void setNome(QString nome);
    Q_INVOKABLE void setEmail(QString email);


signals:
    void nomeChanged(QString nome);
    void emailChanged(QString email);
private:
    QString m_nome;
    QString m_email;
    QString m_id;
    Database *m_database;
};

#endif // MODEL_H
