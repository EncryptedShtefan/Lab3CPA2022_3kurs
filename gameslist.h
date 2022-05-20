#ifndef GAMESLIST_H
#define GAMESLIST_H

#include "game.h"
#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QModelIndex>
#include <QItemSelectionModel>
#include <QStringListModel>

class GamesList : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(QAbstractListModel* gameModel READ getModel CONSTANT)
    //Q_PROPERTY(QStringList comboList READ comboList WRITE setComboList CONSTANT)

private:
    QAbstractListModel* getModel();
    QList<Game> games;
    QStringList platforms;
public:
    GamesList(QObject* parent = nullptr);

    QString findAmount(QString txt);
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void add(const QString Name, const QString Developer, const int Age, const QString Platform);
    Q_INVOKABLE void edit(const QString Name, const QString Developer, const int Age, const QString Platform, const int index);
    Q_INVOKABLE void remove(const int index);
    Q_INVOKABLE QString find(const QString txt);
    Q_INVOKABLE QStringList getPlatforms();

    enum ResentRoles
    {
        name = Qt::DisplayRole,
        developer = Qt::UserRole + 1,
        age = Qt::UserRole + 2,
        platform = Qt::UserRole + 3
    };
};


#endif // GAMESLIST_H
