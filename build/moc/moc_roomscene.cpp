/****************************************************************************
** Meta object code from reading C++ file 'roomscene.h'
**
** Created: Wed Dec 4 14:50:47 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/ui/roomscene.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'roomscene.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ScriptExecutor[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      16,   15,   15,   15, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ScriptExecutor[] = {
    "ScriptExecutor\0\0doScript()\0"
};

void ScriptExecutor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ScriptExecutor *_t = static_cast<ScriptExecutor *>(_o);
        switch (_id) {
        case 0: _t->doScript(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ScriptExecutor::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ScriptExecutor::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_ScriptExecutor,
      qt_meta_data_ScriptExecutor, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ScriptExecutor::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ScriptExecutor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ScriptExecutor::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ScriptExecutor))
        return static_cast<void*>(const_cast< ScriptExecutor*>(this));
    return QDialog::qt_metacast(_clname);
}

int ScriptExecutor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}
static const uint qt_meta_data_DeathNoteDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_DeathNoteDialog[] = {
    "DeathNoteDialog\0"
};

void DeathNoteDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData DeathNoteDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DeathNoteDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_DeathNoteDialog,
      qt_meta_data_DeathNoteDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DeathNoteDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DeathNoteDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DeathNoteDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DeathNoteDialog))
        return static_cast<void*>(const_cast< DeathNoteDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int DeathNoteDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ReplayerControlBar[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      20,   19,   19,   19, 0x0a,
      34,   29,   19,   19, 0x0a,
      53,   47,   19,   19, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ReplayerControlBar[] = {
    "ReplayerControlBar\0\0toggle()\0secs\0"
    "setTime(int)\0speed\0setSpeed(qreal)\0"
};

void ReplayerControlBar::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ReplayerControlBar *_t = static_cast<ReplayerControlBar *>(_o);
        switch (_id) {
        case 0: _t->toggle(); break;
        case 1: _t->setTime((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->setSpeed((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ReplayerControlBar::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ReplayerControlBar::staticMetaObject = {
    { &QGraphicsProxyWidget::staticMetaObject, qt_meta_stringdata_ReplayerControlBar,
      qt_meta_data_ReplayerControlBar, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ReplayerControlBar::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ReplayerControlBar::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ReplayerControlBar::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ReplayerControlBar))
        return static_cast<void*>(const_cast< ReplayerControlBar*>(this));
    return QGraphicsProxyWidget::qt_metacast(_clname);
}

int ReplayerControlBar::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsProxyWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}
static const uint qt_meta_data_RoomScene[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      77,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      11,   10,   10,   10, 0x05,
      21,   10,   10,   10, 0x05,

 // slots: signature, parameters, type, tag, flags
      46,   39,   10,   10, 0x0a,
      83,   71,   10,   10, 0x0a,
     111,  105,   10,   10, 0x0a,
     150,  141,   10,   10, 0x0a,
     189,  180,   10,   10, 0x0a,
     222,  216,   10,   10, 0x0a,
     263,   10,   10,   10, 0x0a,
     285,  280,   10,   10, 0x0a,
     312,   10,   10,   10, 0x0a,
     337,  330,   10,   10, 0x0a,
     370,  366,   10,   10, 0x0a,
     390,  366,   10,   10, 0x0a,
     412,   10,   10,   10, 0x0a,
     436,   10,   10,   10, 0x0a,
     443,   10,   10,   10, 0x0a,
     455,   10,   10,   10, 0x0a,
     474,   10,   10,   10, 0x0a,
     487,   10,   10,   10, 0x0a,
     501,   10,   10,   10, 0x0a,
     516,   10,   10,   10, 0x0a,
     527,   10,   10,   10, 0x08,
     566,  548,   10,   10, 0x08,
     617,  608,   10,   10, 0x08,
     645,   10,   10,   10, 0x08,
     669,   10,   10,   10, 0x08,
     699,  689,   10,   10, 0x08,
     725,   10,   10,   10, 0x08,
     741,   10,   10,   10, 0x08,
     754,   10,   10,   10, 0x08,
     771,   10,   10,   10, 0x08,
     789,   10,   10,   10, 0x08,
     801,   10,   10,   10, 0x08,
     813,   10,   10,   10, 0x08,
     851,  827,   10,   10, 0x08,
     909,  899,   10,   10, 0x08,
     934,  366,   10,   10, 0x08,
     975,  953,   10,   10, 0x08,
    1020, 1008,   10,   10, 0x28,
    1063, 1048,   10,   10, 0x08,
    1110, 1100,   10,   10, 0x08,
    1143,   10,   10,   10, 0x08,
    1167, 1161,   10,   10, 0x08,
    1208, 1190,   10,   10, 0x08,
    1249,   10,   10,   10, 0x08,
    1273, 1267,   10,   10, 0x08,
    1298,   10,   10,   10, 0x08,
    1313,   10,   10,   10, 0x08,
    1325,   10,   10,   10, 0x08,
    1362, 1342,   10,   10, 0x08,
    1384,   10,   10,   10, 0x08,
    1399,   10,   10,   10, 0x08,
    1414,   10,   10,   10, 0x08,
    1429,   10,   10,   10, 0x08,
    1437,   10,   10,   10, 0x08,
    1451,   10,   10,   10, 0x08,
    1464,   10,   10,   10, 0x08,
    1481, 1477,   10,   10, 0x08,
    1505, 1477,   10,   10, 0x08,
    1533, 1528,   10,   10, 0x08,
    1577, 1567,   10,   10, 0x08,
    1623, 1609,   10,   10, 0x08,
    1686, 1665,   10,   10, 0x08,
    1723, 1712,   10,   10, 0x08,
    1766, 1744,   10,   10, 0x08,
    1793,   10,   10,   10, 0x08,
    1813, 1807,   10,   10, 0x08,
    1848, 1839,   10,   10, 0x08,
    1888, 1877,   10,   10, 0x08,
    1916,   10,   10,   10, 0x08,
    1940,   10,   10,   10, 0x08,
    1956,   10,   10,   10, 0x08,
    1971,   10,   10,   10, 0x08,
    1987,   10,   10,   10, 0x08,
    2011, 2003,   10,   10, 0x08,
    2047, 2034,   10,   10, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_RoomScene[] = {
    "RoomScene\0\0restart()\0return_to_start()\0"
    "player\0addPlayer(ClientPlayer*)\0"
    "player_name\0removePlayer(QString)\0"
    "cards\0drawCards(QList<const Card*>)\0"
    "player,n\0drawNCards(ClientPlayer*,int)\0"
    "generals\0chooseGeneral(QStringList)\0"
    "seats\0arrangeSeats(QList<const ClientPlayer*>)\0"
    "toggleDiscards()\0card\0enableTargets(const Card*)\0"
    "useSelectedCard()\0status\0"
    "updateStatus(Client::Status)\0who\0"
    "killPlayer(QString)\0revivePlayer(QString)\0"
    "showServerInformation()\0kick()\0"
    "surrender()\0saveReplayRecord()\0"
    "makeDamage()\0makeKilling()\0makeReviving()\0"
    "doScript()\0updateSkillButtons()\0"
    "player,skill_name\0"
    "acquireSkill(const ClientPlayer*,QString)\0"
    "new_role\0updateRoleComboBox(QString)\0"
    "updateSelectedTargets()\0updateTrustButton()\0"
    "pile_name\0updatePileButton(QString)\0"
    "doSkillButton()\0doOkButton()\0"
    "doCancelButton()\0doDiscardButton()\0"
    "doTimeout()\0startInXs()\0hideAvatars()\0"
    "who,delta,nature,losthp\0"
    "changeHp(QString,int,DamageStruct::Nature,bool)\0"
    "who,delta\0changeMaxHp(QString,int)\0"
    "moveFocus(QString)\0who,emotion,permanent\0"
    "setEmotion(QString,QString,bool)\0"
    "who,emotion\0setEmotion(QString,QString)\0"
    "who,skill_name\0showSkillInvocation(QString,QString)\0"
    "name,args\0doAnimation(QString,QStringList)\0"
    "adjustDashboard()\0owner\0showOwnerButtons(bool)\0"
    "who,result,reason\0"
    "showJudgeResult(QString,QString,QString)\0"
    "showPlayerCards()\0roles\0"
    "updateStateItem(QString)\0adjustPrompt()\0"
    "clearPile()\0removeLightBox()\0"
    "player_name,card_id\0showCard(QString,int)\0"
    "viewDistance()\0viewDiscards()\0"
    "hideDiscards()\0speak()\0onGameStart()\0"
    "onGameOver()\0onStandoff()\0txt\0"
    "appendChatEdit(QString)\0appendChatBox(QString)\0"
    "move\0moveCard(CardMoveStructForClient)\0"
    "n,from,to\0moveNCards(int,QString,QString)\0"
    "taker,card_id\0takeAmazingGrace(const ClientPlayer*,int)\0"
    "skill_name,from_left\0attachSkill(QString,bool)\0"
    "skill_name\0detachSkill(QString)\0"
    "card_ids,enable_heart\0doGongxin(QList<int>,bool)\0"
    "startAssign()\0names\0fillGenerals(QStringList)\0"
    "who,name\0takeGeneral(QString,QString)\0"
    "index,name\0recoverGeneral(int,QString)\0"
    "startGeneralSelection()\0selectGeneral()\0"
    "startArrange()\0toggleArrange()\0"
    "finishArrange()\0general\0changeGeneral(QString)\0"
    "self,general\0revealGeneral(bool,QString)\0"
};

void RoomScene::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        RoomScene *_t = static_cast<RoomScene *>(_o);
        switch (_id) {
        case 0: _t->restart(); break;
        case 1: _t->return_to_start(); break;
        case 2: _t->addPlayer((*reinterpret_cast< ClientPlayer*(*)>(_a[1]))); break;
        case 3: _t->removePlayer((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->drawCards((*reinterpret_cast< const QList<const Card*>(*)>(_a[1]))); break;
        case 5: _t->drawNCards((*reinterpret_cast< ClientPlayer*(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 6: _t->chooseGeneral((*reinterpret_cast< const QStringList(*)>(_a[1]))); break;
        case 7: _t->arrangeSeats((*reinterpret_cast< const QList<const ClientPlayer*>(*)>(_a[1]))); break;
        case 8: _t->toggleDiscards(); break;
        case 9: _t->enableTargets((*reinterpret_cast< const Card*(*)>(_a[1]))); break;
        case 10: _t->useSelectedCard(); break;
        case 11: _t->updateStatus((*reinterpret_cast< Client::Status(*)>(_a[1]))); break;
        case 12: _t->killPlayer((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 13: _t->revivePlayer((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 14: _t->showServerInformation(); break;
        case 15: _t->kick(); break;
        case 16: _t->surrender(); break;
        case 17: _t->saveReplayRecord(); break;
        case 18: _t->makeDamage(); break;
        case 19: _t->makeKilling(); break;
        case 20: _t->makeReviving(); break;
        case 21: _t->doScript(); break;
        case 22: _t->updateSkillButtons(); break;
        case 23: _t->acquireSkill((*reinterpret_cast< const ClientPlayer*(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 24: _t->updateRoleComboBox((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 25: _t->updateSelectedTargets(); break;
        case 26: _t->updateTrustButton(); break;
        case 27: _t->updatePileButton((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 28: _t->doSkillButton(); break;
        case 29: _t->doOkButton(); break;
        case 30: _t->doCancelButton(); break;
        case 31: _t->doDiscardButton(); break;
        case 32: _t->doTimeout(); break;
        case 33: _t->startInXs(); break;
        case 34: _t->hideAvatars(); break;
        case 35: _t->changeHp((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< DamageStruct::Nature(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4]))); break;
        case 36: _t->changeMaxHp((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 37: _t->moveFocus((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 38: _t->setEmotion((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3]))); break;
        case 39: _t->setEmotion((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 40: _t->showSkillInvocation((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 41: _t->doAnimation((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QStringList(*)>(_a[2]))); break;
        case 42: _t->adjustDashboard(); break;
        case 43: _t->showOwnerButtons((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 44: _t->showJudgeResult((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 45: _t->showPlayerCards(); break;
        case 46: _t->updateStateItem((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 47: _t->adjustPrompt(); break;
        case 48: _t->clearPile(); break;
        case 49: _t->removeLightBox(); break;
        case 50: _t->showCard((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 51: _t->viewDistance(); break;
        case 52: _t->viewDiscards(); break;
        case 53: _t->hideDiscards(); break;
        case 54: _t->speak(); break;
        case 55: _t->onGameStart(); break;
        case 56: _t->onGameOver(); break;
        case 57: _t->onStandoff(); break;
        case 58: _t->appendChatEdit((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 59: _t->appendChatBox((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 60: _t->moveCard((*reinterpret_cast< const CardMoveStructForClient(*)>(_a[1]))); break;
        case 61: _t->moveNCards((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 62: _t->takeAmazingGrace((*reinterpret_cast< const ClientPlayer*(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 63: _t->attachSkill((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 64: _t->detachSkill((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 65: _t->doGongxin((*reinterpret_cast< const QList<int>(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 66: _t->startAssign(); break;
        case 67: _t->fillGenerals((*reinterpret_cast< const QStringList(*)>(_a[1]))); break;
        case 68: _t->takeGeneral((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 69: _t->recoverGeneral((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 70: _t->startGeneralSelection(); break;
        case 71: _t->selectGeneral(); break;
        case 72: _t->startArrange(); break;
        case 73: _t->toggleArrange(); break;
        case 74: _t->finishArrange(); break;
        case 75: _t->changeGeneral((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 76: _t->revealGeneral((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData RoomScene::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject RoomScene::staticMetaObject = {
    { &QGraphicsScene::staticMetaObject, qt_meta_stringdata_RoomScene,
      qt_meta_data_RoomScene, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RoomScene::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RoomScene::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RoomScene::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RoomScene))
        return static_cast<void*>(const_cast< RoomScene*>(this));
    return QGraphicsScene::qt_metacast(_clname);
}

int RoomScene::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsScene::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 77)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 77;
    }
    return _id;
}

// SIGNAL 0
void RoomScene::restart()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void RoomScene::return_to_start()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
QT_END_MOC_NAMESPACE
