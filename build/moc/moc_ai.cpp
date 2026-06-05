/****************************************************************************
** Meta object code from reading C++ file 'ai.h'
**
** Created: Wed Dec 4 14:50:07 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/server/ai.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ai.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_AI[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       1,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
       3, 0x0,    3,   18,

 // enum data: key, value
      12, uint(AI::Friend),
      19, uint(AI::Enemy),
      25, uint(AI::Neutrality),

       0        // eod
};

static const char qt_meta_stringdata_AI[] = {
    "AI\0Relation\0Friend\0Enemy\0Neutrality\0"
};

void AI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData AI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject AI::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_AI,
      qt_meta_data_AI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &AI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *AI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *AI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_AI))
        return static_cast<void*>(const_cast< AI*>(this));
    return QObject::qt_metacast(_clname);
}

int AI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TrustAI[] = {

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

static const char qt_meta_stringdata_TrustAI[] = {
    "TrustAI\0"
};

void TrustAI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData TrustAI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TrustAI::staticMetaObject = {
    { &AI::staticMetaObject, qt_meta_stringdata_TrustAI,
      qt_meta_data_TrustAI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TrustAI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TrustAI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TrustAI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TrustAI))
        return static_cast<void*>(const_cast< TrustAI*>(this));
    return AI::qt_metacast(_clname);
}

int TrustAI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = AI::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LuaAI[] = {

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

static const char qt_meta_stringdata_LuaAI[] = {
    "LuaAI\0"
};

void LuaAI::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData LuaAI::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LuaAI::staticMetaObject = {
    { &TrustAI::staticMetaObject, qt_meta_stringdata_LuaAI,
      qt_meta_data_LuaAI, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LuaAI::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LuaAI::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LuaAI::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LuaAI))
        return static_cast<void*>(const_cast< LuaAI*>(this));
    return TrustAI::qt_metacast(_clname);
}

int LuaAI::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TrustAI::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
