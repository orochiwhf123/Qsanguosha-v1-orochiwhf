/****************************************************************************
** Meta object code from reading C++ file 'fancheng-scenario.h'
**
** Created: Wed Dec 4 14:49:56 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/scenario/fancheng-scenario.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'fancheng-scenario.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_FanchengScenario[] = {

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

static const char qt_meta_stringdata_FanchengScenario[] = {
    "FanchengScenario\0"
};

void FanchengScenario::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData FanchengScenario::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FanchengScenario::staticMetaObject = {
    { &Scenario::staticMetaObject, qt_meta_stringdata_FanchengScenario,
      qt_meta_data_FanchengScenario, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FanchengScenario::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FanchengScenario::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FanchengScenario::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FanchengScenario))
        return static_cast<void*>(const_cast< FanchengScenario*>(this));
    return Scenario::qt_metacast(_clname);
}

int FanchengScenario::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Scenario::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DujiangCard[] = {

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
      13,   12,   12,   12, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_DujiangCard[] = {
    "DujiangCard\0\0DujiangCard()\0"
};

void DujiangCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { DujiangCard *_r = new DujiangCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData DujiangCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DujiangCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_DujiangCard,
      qt_meta_data_DujiangCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DujiangCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DujiangCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DujiangCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DujiangCard))
        return static_cast<void*>(const_cast< DujiangCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int DujiangCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_FloodCard[] = {

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
      11,   10,   10,   10, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_FloodCard[] = {
    "FloodCard\0\0FloodCard()\0"
};

void FloodCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { FloodCard *_r = new FloodCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData FloodCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FloodCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_FloodCard,
      qt_meta_data_FloodCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FloodCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FloodCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FloodCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FloodCard))
        return static_cast<void*>(const_cast< FloodCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int FloodCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TaichenFightCard[] = {

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
      18,   17,   17,   17, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_TaichenFightCard[] = {
    "TaichenFightCard\0\0TaichenFightCard()\0"
};

void TaichenFightCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { TaichenFightCard *_r = new TaichenFightCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData TaichenFightCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TaichenFightCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_TaichenFightCard,
      qt_meta_data_TaichenFightCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TaichenFightCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TaichenFightCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TaichenFightCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TaichenFightCard))
        return static_cast<void*>(const_cast< TaichenFightCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int TaichenFightCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ZhiyuanCard[] = {

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
      13,   12,   12,   12, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_ZhiyuanCard[] = {
    "ZhiyuanCard\0\0ZhiyuanCard()\0"
};

void ZhiyuanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { ZhiyuanCard *_r = new ZhiyuanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData ZhiyuanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ZhiyuanCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_ZhiyuanCard,
      qt_meta_data_ZhiyuanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ZhiyuanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ZhiyuanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ZhiyuanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ZhiyuanCard))
        return static_cast<void*>(const_cast< ZhiyuanCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int ZhiyuanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
