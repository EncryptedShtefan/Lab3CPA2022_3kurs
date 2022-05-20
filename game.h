#ifndef GAME_H
#define GAME_H
#include "QString"
#include <QStringList>

class Game
{
private:
    QString name;
    QString developer;
    int age;
    QString platform;

public:
    Game();
    Game(const QString Name, const QString Developer, const int Age, const QString Platform);

    QString getName() const;
    QString getDeveloper() const;
    int getAge() const;
    QString getPlatform() const;

    void setName(const QString Name);
    void setDeveloper(const QString Developer);
    void setAge(const int Age);
    void setPlatform(const QString Platform);

    static QStringList allPlatforms();
};

#endif // GAME_H
