#include "game.h"

Game::Game()
{

}
Game::Game(const QString Name, const QString Developer, const int Age, const QString Platform)
{
    name = Name;
    developer = Developer;
    age = Age;
    platform = Platform;
}

QString Game::getName() const
{
    return name;
}
QString Game::getDeveloper() const
{
    return developer;
}
int Game::getAge() const
{
    return age;
}
QString Game::getPlatform() const
{
    return platform;
}

void Game::setName(const QString Name)
{
    name = Name;
}
void Game::setDeveloper(const QString Developer)
{
    developer = Developer;
}
void Game::setAge(const int Age)
{
    age = Age;
}
void Game::setPlatform(const QString Platform)
{
    platform = Platform;
}

QStringList Game::allPlatforms()
{
    QStringList list;
    list.append("Pc");
    list.append("Ps4");
    list.append("Xbox");

    return list;
}
