#ifndef NOSTALGIA_H
#define NOSTALGIA_H

#include "package.h"
#include "card.h"

class NostalgiaPackage: public Package{
    Q_OBJECT

public:
    NostalgiaPackage();
};

class NostalGeneralPackage: public Package{
    Q_OBJECT

public:
    NostalGeneralPackage();
};

class NosJujianCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE NosJujianCard();

    virtual void onEffect(const CardEffectStruct &effect) const;
};

class NosXuanhuoCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE NosXuanhuoCard();

    virtual void onEffect(const CardEffectStruct &effect) const;
};

class V5QuanjiCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE V5QuanjiCard();

    virtual void use(Room *room, ServerPlayer *source, const QList<ServerPlayer *> &targets) const;
};

class V5YexinCard: public SkillCard{
    Q_OBJECT

public:
    Q_INVOKABLE V5YexinCard();

    virtual void use(Room *room, ServerPlayer *source, const QList<ServerPlayer *> &targets) const;
};

#endif // NOSTALGIA_H
