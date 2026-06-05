/****************************************************************************
** Meta object code from reading C++ file 'player.h'
**
** Created: Wed Dec 4 14:48:15 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/core/player.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'player.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Player[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
      24,   54, // properties
       3,  126, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: signature, parameters, type, tag, flags
       8,    7,    7,    7, 0x05,
      26,    7,    7,    7, 0x05,
      54,   45,    7,    7, 0x05,
      76,    7,    7,    7, 0x05,
      92,    7,    7,    7, 0x05,
     110,    7,    7,    7, 0x05,
     132,  126,    7,    7, 0x05,
     158,  152,    7,    7, 0x05,

 // properties: name, type, flags
     186,  178, 0x0a095003,
     201,  197, 0x02095103,
     204,  197, 0x02095003,
     210,  178, 0x0a095103,
     223,  218, 0x01085001,
     231,  178, 0x0a095103,
     236,  178, 0x0a095003,
     244,  178, 0x0a095003,
     253,  178, 0x0a095103,
     259,  197, 0x02095001,
     272,  197, 0x02095103,
     277,  178, 0x0a095003,
     283,  218, 0x01095003,
     290,  218, 0x01095103,
     296,  178, 0x0a095103,
     302,  218, 0x01095103,
     126,  218, 0x01095103,
     152,  218, 0x01095103,
     310,  197, 0x02095001,
     330,  314, 0x00095009,
     337,  218, 0x01095001,
     347,  218, 0x01095001,
     352,  218, 0x01095001,
     361,  218, 0x01095001,

 // enums: name, flags, count, data
     368, 0x0,    8,  138,
     374, 0x0,    6,  154,
     380, 0x0,    5,  166,

 // enum data: key, value
     385, uint(Player::RoundStart),
     396, uint(Player::Start),
     402, uint(Player::Judge),
     408, uint(Player::Draw),
     413, uint(Player::Play),
     418, uint(Player::Discard),
     426, uint(Player::Finish),
     433, uint(Player::NotActive),
     443, uint(Player::Special),
     451, uint(Player::Hand),
     456, uint(Player::Equip),
     462, uint(Player::Judging),
     470, uint(Player::DiscardedPile),
     484, uint(Player::DrawPile),
     493, uint(Player::Lord),
     498, uint(Player::Loyalist),
     507, uint(Player::Rebel),
     513, uint(Player::Renegade),
     522, uint(Player::Careerist),

       0        // eod
};

static const char qt_meta_stringdata_Player[] = {
    "Player\0\0general_changed()\0general2_changed()\0"
    "new_role\0role_changed(QString)\0"
    "state_changed()\0kingdom_changed()\0"
    "phase_changed()\0owner\0owner_changed(bool)\0"
    "ready\0ready_changed(bool)\0QString\0"
    "screenname\0int\0hp\0maxhp\0kingdom\0bool\0"
    "wounded\0role\0general\0general2\0state\0"
    "handcard_num\0seat\0phase\0faceup\0alive\0"
    "flags\0chained\0atk\0General::Gender\0"
    "gender\0kongcheng\0nude\0all_nude\0caocao\0"
    "Phase\0Place\0Role\0RoundStart\0Start\0"
    "Judge\0Draw\0Play\0Discard\0Finish\0NotActive\0"
    "Special\0Hand\0Equip\0Judging\0DiscardedPile\0"
    "DrawPile\0Lord\0Loyalist\0Rebel\0Renegade\0"
    "Careerist\0"
};

void Player::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Player *_t = static_cast<Player *>(_o);
        switch (_id) {
        case 0: _t->general_changed(); break;
        case 1: _t->general2_changed(); break;
        case 2: _t->role_changed((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->state_changed(); break;
        case 4: _t->kingdom_changed(); break;
        case 5: _t->phase_changed(); break;
        case 6: _t->owner_changed((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->ready_changed((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    }
}

#ifdef Q_NO_DATA_RELOCATION
static const QMetaObjectAccessor qt_meta_extradata_Player[] = {
        General::getStaticMetaObject,
#else
static const QMetaObject *qt_meta_extradata_Player[] = {
        &General::staticMetaObject,
#endif //Q_NO_DATA_RELOCATION
    0
};

const QMetaObjectExtraData Player::staticMetaObjectExtraData = {
    qt_meta_extradata_Player,  qt_static_metacall 
};

const QMetaObject Player::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Player,
      qt_meta_data_Player, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Player::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Player::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Player::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Player))
        return static_cast<void*>(const_cast< Player*>(this));
    return QObject::qt_metacast(_clname);
}

int Player::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = screenName(); break;
        case 1: *reinterpret_cast< int*>(_v) = getHp(); break;
        case 2: *reinterpret_cast< int*>(_v) = getMaxHp(); break;
        case 3: *reinterpret_cast< QString*>(_v) = getKingdom(); break;
        case 4: *reinterpret_cast< bool*>(_v) = isWounded(); break;
        case 5: *reinterpret_cast< QString*>(_v) = getRole(); break;
        case 6: *reinterpret_cast< QString*>(_v) = getGeneralName(); break;
        case 7: *reinterpret_cast< QString*>(_v) = getGeneral2Name(); break;
        case 8: *reinterpret_cast< QString*>(_v) = getState(); break;
        case 9: *reinterpret_cast< int*>(_v) = getHandcardNum(); break;
        case 10: *reinterpret_cast< int*>(_v) = getSeat(); break;
        case 11: *reinterpret_cast< QString*>(_v) = getPhaseString(); break;
        case 12: *reinterpret_cast< bool*>(_v) = faceUp(); break;
        case 13: *reinterpret_cast< bool*>(_v) = isAlive(); break;
        case 14: *reinterpret_cast< QString*>(_v) = getFlags(); break;
        case 15: *reinterpret_cast< bool*>(_v) = isChained(); break;
        case 16: *reinterpret_cast< bool*>(_v) = isOwner(); break;
        case 17: *reinterpret_cast< bool*>(_v) = isReady(); break;
        case 18: *reinterpret_cast< int*>(_v) = getAttackRange(); break;
        case 19: *reinterpret_cast< General::Gender*>(_v) = getGender(); break;
        case 20: *reinterpret_cast< bool*>(_v) = isKongcheng(); break;
        case 21: *reinterpret_cast< bool*>(_v) = isNude(); break;
        case 22: *reinterpret_cast< bool*>(_v) = isAllNude(); break;
        case 23: *reinterpret_cast< bool*>(_v) = isCaoCao(); break;
        }
        _id -= 24;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setScreenName(*reinterpret_cast< QString*>(_v)); break;
        case 1: setHp(*reinterpret_cast< int*>(_v)); break;
        case 2: setMaxHp(*reinterpret_cast< int*>(_v)); break;
        case 3: setKingdom(*reinterpret_cast< QString*>(_v)); break;
        case 5: setRole(*reinterpret_cast< QString*>(_v)); break;
        case 6: setGeneralName(*reinterpret_cast< QString*>(_v)); break;
        case 7: setGeneral2Name(*reinterpret_cast< QString*>(_v)); break;
        case 8: setState(*reinterpret_cast< QString*>(_v)); break;
        case 10: setSeat(*reinterpret_cast< int*>(_v)); break;
        case 11: setPhaseString(*reinterpret_cast< QString*>(_v)); break;
        case 12: setFaceUp(*reinterpret_cast< bool*>(_v)); break;
        case 13: setAlive(*reinterpret_cast< bool*>(_v)); break;
        case 14: setFlags(*reinterpret_cast< QString*>(_v)); break;
        case 15: setChained(*reinterpret_cast< bool*>(_v)); break;
        case 16: setOwner(*reinterpret_cast< bool*>(_v)); break;
        case 17: setReady(*reinterpret_cast< bool*>(_v)); break;
        }
        _id -= 24;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 24;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 24;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 24;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 24;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 24;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 24;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Player::general_changed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void Player::general2_changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void Player::role_changed(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void Player::state_changed()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void Player::kingdom_changed()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}

// SIGNAL 5
void Player::phase_changed()
{
    QMetaObject::activate(this, &staticMetaObject, 5, 0);
}

// SIGNAL 6
void Player::owner_changed(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}

// SIGNAL 7
void Player::ready_changed(bool _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}
QT_END_MOC_NAMESPACE
