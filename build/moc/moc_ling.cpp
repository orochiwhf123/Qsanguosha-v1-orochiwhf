/****************************************************************************
** Meta object code from reading C++ file 'ling.h'
**
** Created: Wed Dec 4 14:49:36 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/ling.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ling.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_LingPackage[] = {

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

static const char qt_meta_stringdata_LingPackage[] = {
    "LingPackage\0"
};

void LingPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData LingPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LingPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_LingPackage,
      qt_meta_data_LingPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LingPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LingPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LingPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LingPackage))
        return static_cast<void*>(const_cast< LingPackage*>(this));
    return Package::qt_metacast(_clname);
}

int LingPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LuoyiCard[] = {

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

static const char qt_meta_stringdata_LuoyiCard[] = {
    "LuoyiCard\0\0LuoyiCard()\0"
};

void LuoyiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { LuoyiCard *_r = new LuoyiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData LuoyiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LuoyiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_LuoyiCard,
      qt_meta_data_LuoyiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LuoyiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LuoyiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LuoyiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LuoyiCard))
        return static_cast<void*>(const_cast< LuoyiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int LuoyiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_NeoFanjianCard[] = {

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
      16,   15,   15,   15, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_NeoFanjianCard[] = {
    "NeoFanjianCard\0\0NeoFanjianCard()\0"
};

void NeoFanjianCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { NeoFanjianCard *_r = new NeoFanjianCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData NeoFanjianCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject NeoFanjianCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_NeoFanjianCard,
      qt_meta_data_NeoFanjianCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &NeoFanjianCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *NeoFanjianCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *NeoFanjianCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_NeoFanjianCard))
        return static_cast<void*>(const_cast< NeoFanjianCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int NeoFanjianCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
