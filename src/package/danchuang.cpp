#include "skill.h"
#include "carditem.h"
#include "engine.h"
#include "danchuang.h"
#include "standard.h"
#include "client.h"

class Xianiao: public TriggerSkill{
public:
    Xianiao():TriggerSkill("xianiao"){
        events << Damage;
        frequency = Compulsory;
    }

    virtual int getPriority() const{
        return -1;
    }

    virtual bool triggerable(const ServerPlayer *target) const{
        return target != NULL;
    }

    virtual bool trigger(TriggerEvent, Room* room, ServerPlayer *, QVariant &data) const{
        DamageStruct damage = data.value<DamageStruct>();
        if(!damage.from)
            return false;
        QList<ServerPlayer *> xhjs = room->findPlayersBySkillName(objectName());
        foreach(ServerPlayer *xhj, xhjs){
            if(xhj == damage.from)
                continue;
            if(damage.from->inMyAttackRange(xhj)){
                room->playSkillEffect(objectName());
                LogMessage log;
                log.from = xhj;
                log.arg = objectName();
                log.type = "#TriggerSkill";
                room->sendLog(log);
                xhj->throwAllHandCards();
                xhj->drawCards(damage.from->getHp());
            }
        }
        return false;
    }
};

class Tangqiang: public TriggerSkill{
public:
    Tangqiang():TriggerSkill("tangqiang"){
        events << Death;
        frequency = Compulsory;
    }

    virtual bool triggerable(const ServerPlayer *target) const{
        return target->hasSkill(objectName());
    }

    virtual bool trigger(TriggerEvent, Room* room, ServerPlayer *player, QVariant &data) const{
        DamageStar damage = data.value<DamageStar>();
        ServerPlayer *killer = damage ? damage->from : NULL;
        if(killer){
            LogMessage log;
            log.type = "#TriggerSkill";
            log.from = player;
            log.arg = objectName();
            room->sendLog(log);
            room->loseMaxHp(killer);
            room->acquireSkill(killer, objectName());
            killer->playSkillEffect(objectName());
        }
        return false;
    }
};

DanchuangPackage::DanchuangPackage()
    :Package("danchuang")
{
    General *xiahoujie = new General(this, "xiahoujie", "wei", 3);
    xiahoujie->addSkill(new Xianiao);
    xiahoujie->addSkill(new Tangqiang);
}

ADD_PACKAGE(Danchuang)
