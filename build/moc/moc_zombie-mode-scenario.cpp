/****************************************************************************
** Meta object code from reading C++ file 'zombie-mode-scenario.h'
**
** Created: Wed Dec 4 14:50:05 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/scenario/zombie-mode-scenario.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'zombie-mode-scenario.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ZombieScenario[] = {

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

static const char qt_meta_stringdata_ZombieScenario[] = {
    "ZombieScenario\0"
};

void ZombieScenario::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ZombieScenario::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ZombieScenario::staticMetaObject = {
    { &Scenario::staticMetaObject, qt_meta_stringdata_ZombieScenario,
      qt_meta_data_ZombieScenario, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ZombieScenario::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ZombieScenario::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ZombieScenario::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ZombieScenario))
        return static_cast<void*>(const_cast< ZombieScenario*>(this));
    return Scenario::qt_metacast(_clname);
}

int ZombieScenario::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Scenario::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GanranEquip[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       1,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      25,   13,   12,   12, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_GanranEquip[] = {
    "GanranEquip\0\0suit,number\0"
    "GanranEquip(Card::Suit,int)\0"
};

void GanranEquip::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { GanranEquip *_r = new GanranEquip((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData GanranEquip::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GanranEquip::staticMetaObject = {
    { &IronChain::staticMetaObject, qt_meta_stringdata_GanranEquip,
      qt_meta_data_GanranEquip, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GanranEquip::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GanranEquip::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GanranEquip::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GanranEquip))
        return static_cast<void*>(const_cast< GanranEquip*>(this));
    return IronChain::qt_metacast(_clname);
}

int GanranEquip::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = IronChain::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_PeachingCard[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       1,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_PeachingCard[] = {
    "PeachingCard\0\0PeachingCard()\0"
};

void PeachingCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { PeachingCard *_r = new PeachingCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData PeachingCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject PeachingCard::staticMetaObject = {
    { &QingnangCard::staticMetaObject, qt_meta_stringdata_PeachingCard,
      qt_meta_data_PeachingCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PeachingCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PeachingCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PeachingCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PeachingCard))
        return static_cast<void*>(const_cast< PeachingCard*>(this));
    return QingnangCard::qt_metacast(_clname);
}

int PeachingCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QingnangCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
