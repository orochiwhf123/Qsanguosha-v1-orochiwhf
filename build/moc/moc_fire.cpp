/****************************************************************************
** Meta object code from reading C++ file 'fire.h'
**
** Created: Wed Dec 4 14:48:49 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/fire.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'fire.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_FirePackage[] = {

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

static const char qt_meta_stringdata_FirePackage[] = {
    "FirePackage\0"
};

void FirePackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData FirePackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FirePackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_FirePackage,
      qt_meta_data_FirePackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FirePackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FirePackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FirePackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FirePackage))
        return static_cast<void*>(const_cast< FirePackage*>(this));
    return Package::qt_metacast(_clname);
}

int FirePackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_QuhuCard[] = {

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
      10,    9,    9,    9, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_QuhuCard[] = {
    "QuhuCard\0\0QuhuCard()\0"
};

void QuhuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { QuhuCard *_r = new QuhuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData QuhuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject QuhuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_QuhuCard,
      qt_meta_data_QuhuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QuhuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QuhuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QuhuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QuhuCard))
        return static_cast<void*>(const_cast< QuhuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int QuhuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_JiemingCard[] = {

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

static const char qt_meta_stringdata_JiemingCard[] = {
    "JiemingCard\0\0JiemingCard()\0"
};

void JiemingCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { JiemingCard *_r = new JiemingCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData JiemingCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject JiemingCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_JiemingCard,
      qt_meta_data_JiemingCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &JiemingCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *JiemingCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *JiemingCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_JiemingCard))
        return static_cast<void*>(const_cast< JiemingCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int JiemingCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_QiangxiCard[] = {

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

static const char qt_meta_stringdata_QiangxiCard[] = {
    "QiangxiCard\0\0QiangxiCard()\0"
};

void QiangxiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { QiangxiCard *_r = new QiangxiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData QiangxiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject QiangxiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_QiangxiCard,
      qt_meta_data_QiangxiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QiangxiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QiangxiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QiangxiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QiangxiCard))
        return static_cast<void*>(const_cast< QiangxiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int QiangxiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TianyiCard[] = {

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
      12,   11,   11,   11, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_TianyiCard[] = {
    "TianyiCard\0\0TianyiCard()\0"
};

void TianyiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { TianyiCard *_r = new TianyiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData TianyiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TianyiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_TianyiCard,
      qt_meta_data_TianyiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TianyiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TianyiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TianyiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TianyiCard))
        return static_cast<void*>(const_cast< TianyiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int TianyiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
