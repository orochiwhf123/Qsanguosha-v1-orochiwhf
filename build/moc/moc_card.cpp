/****************************************************************************
** Meta object code from reading C++ file 'card.h'
**
** Created: Wed Dec 4 14:48:08 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/core/card.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'card.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Card[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
      13,   14, // properties
       2,   53, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
      13,    5, 0x0a095401,
      23,   18, 0x01085401,
      27,   18, 0x01085401,
      37,   33, 0x02095401,
      40,   33, 0x02095103,
      47,    5, 0x0a095401,
      61,    5, 0x0a095401,
      66,    5, 0x0a095001,
      78,   18, 0x01095001,
      91,   18, 0x01095401,
      96,   18, 0x01095401,
     101,   18, 0x01095001,
     116,  110, 0x00095009,

 // enums: name, flags, count, data
     122, 0x0,    5,   61,
     127, 0x0,    4,   71,

 // enum data: key, value
     136, uint(Card::Spade),
     142, uint(Card::Club),
     147, uint(Card::Heart),
     153, uint(Card::Diamond),
     161, uint(Card::NoSuit),
     168, uint(Card::Skill),
     174, uint(Card::Basic),
     180, uint(Card::Trick),
     186, uint(Card::Equip),

       0        // eod
};

static const char qt_meta_stringdata_Card[] = {
    "Card\0QString\0suit\0bool\0red\0black\0int\0"
    "id\0number\0number_string\0type\0pixmap_path\0"
    "target_fixed\0once\0mute\0equipped\0Color\0"
    "color\0Suit\0CardType\0Spade\0Club\0Heart\0"
    "Diamond\0NoSuit\0Skill\0Basic\0Trick\0Equip\0"
};

void Card::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData Card::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Card::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Card,
      qt_meta_data_Card, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Card::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Card::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Card::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Card))
        return static_cast<void*>(const_cast< Card*>(this));
    return QObject::qt_metacast(_clname);
}

int Card::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    
#ifndef QT_NO_PROPERTIES
     if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getSuitString(); break;
        case 1: *reinterpret_cast< bool*>(_v) = isRed(); break;
        case 2: *reinterpret_cast< bool*>(_v) = isBlack(); break;
        case 3: *reinterpret_cast< int*>(_v) = getId(); break;
        case 4: *reinterpret_cast< int*>(_v) = getNumber(); break;
        case 5: *reinterpret_cast< QString*>(_v) = getNumberString(); break;
        case 6: *reinterpret_cast< QString*>(_v) = getType(); break;
        case 7: *reinterpret_cast< QString*>(_v) = getPixmapPath(); break;
        case 8: *reinterpret_cast< bool*>(_v) = targetFixed(); break;
        case 9: *reinterpret_cast< bool*>(_v) = isOnce(); break;
        case 10: *reinterpret_cast< bool*>(_v) = isMute(); break;
        case 11: *reinterpret_cast< bool*>(_v) = isEquipped(); break;
        case 12: *reinterpret_cast< Color*>(_v) = getColor(); break;
        }
        _id -= 13;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 4: setNumber(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 13;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 13;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 13;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
static const uint qt_meta_data_SkillCard[] = {

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

static const char qt_meta_stringdata_SkillCard[] = {
    "SkillCard\0"
};

void SkillCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SkillCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SkillCard::staticMetaObject = {
    { &Card::staticMetaObject, qt_meta_stringdata_SkillCard,
      qt_meta_data_SkillCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SkillCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SkillCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SkillCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SkillCard))
        return static_cast<void*>(const_cast< SkillCard*>(this));
    return Card::qt_metacast(_clname);
}

int SkillCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Card::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DummyCard[] = {

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

static const char qt_meta_stringdata_DummyCard[] = {
    "DummyCard\0"
};

void DummyCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData DummyCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DummyCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_DummyCard,
      qt_meta_data_DummyCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DummyCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DummyCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DummyCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DummyCard))
        return static_cast<void*>(const_cast< DummyCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int DummyCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
