#include "gameslist.h"
#include "game.h"
#include <QDebug>
#include "QStringList"
#include "QStringListModel"
#include "QString"

GamesList::GamesList(QObject *parent) : QAbstractListModel(parent)
{
    Game *game1 = new Game("WarThunder", "Gaijin", 10, "PC");
    Game *game2 = new Game("WorldOfTanks", "Wargaming", 11, "PC");
    Game *game3 = new Game("CounterStrike GO", "Valve", 10, "PC");

    beginInsertRows(QModelIndex(),games.size(),games.size());
    games.append(*game1);
    games.append(*game2);
    games.append(*game3);
    endInsertRows();

    this->platforms = Game::allPlatforms();
}

QAbstractListModel* GamesList::getModel()
{
    return this;
}

int GamesList::rowCount(const QModelIndex&) const
{
    return games.size();
}

QVariant GamesList::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= games.size())
        return QVariant();
    switch (role) {
        case name:
            return QVariant(games.at(index.row()).getName());
        case developer:
            return QVariant(games.at(index.row()).getDeveloper());
        case age:
            return QVariant(games.at(index.row()).getAge());
        case platform:
            return QVariant(games.at(index.row()).getPlatform());
        default:
            return QVariant();
    }
}

QHash<int, QByteArray> GamesList::roleNames() const
{
    QHash<int, QByteArray> roles;

    roles[name] = "GameName";
    roles[developer] = "GameDeveloper";
    roles[age] = "GameAge";
    roles[platform] = "GamePlatform";

    return roles;
}

void GamesList::add(const QString Name, const QString Developer, const int Age, const QString Platform)
{
    Game cat;
    cat.setName(Name);
    cat.setAge(Age);
    cat.setDeveloper(Developer);
    cat.setPlatform(Platform);

    beginInsertRows(QModelIndex(),games.size(),games.size());
    games.append(cat);
    endInsertRows();
}
void GamesList::edit(const QString Name, const QString Developer, const int Age, const QString Platform, const int index)
{
    if(index >= 0 && index < games.size())
    {
        auto& editable_cat = games[index];
        editable_cat.setName(Name);
        editable_cat.setDeveloper(Developer);
        editable_cat.setAge(Age);
        editable_cat.setPlatform(Platform);

        auto modelIndex = createIndex(index, 0);
        dataChanged(modelIndex, modelIndex);
        qDebug() << games[index].getName();
    }
    else qDebug() << "Выбран неверный индекс";
}
void GamesList::remove(const int index)
{
    if (index >= 0 && index < games.size())
    {
        beginRemoveRows(QModelIndex(), index, index);
        games.removeAt(index);
        endRemoveRows();
    }
    else qDebug() << "Неверный индекс удаления";
}
QString GamesList::find(QString txt)
{
    int amount = 0;
    for (int i = 0; i < games.length(); i++)
    {
        if(games[i].getPlatform() == txt)
        {
            amount++;
        }
    }
    QString tmp = QString::number(amount);
    return tmp;
}

QStringList GamesList::getPlatforms()
{
    return platforms;
}
