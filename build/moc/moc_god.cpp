/****************************************************************************
** Meta object code from reading C++ file 'god.h'
**
** Created: Wed Dec 4 14:48:51 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/god.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'god.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_GodPackage[] = {

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

static const char qt_meta_stringdata_GodPackage[] = {
    "GodPackage\0"
};

void GodPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData GodPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GodPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_GodPackage,
      qt_meta_data_GodPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GodPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GodPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GodPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GodPackage))
        return static_cast<void*>(const_cast< GodPackage*>(this));
    return Package::qt_metacast(_clname);
}

int GodPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GongxinCard[] = {

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

static const char qt_meta_stringdata_GongxinCard[] = {
    "GongxinCard\0\0GongxinCard()\0"
};

void GongxinCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { GongxinCard *_r = new GongxinCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData GongxinCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GongxinCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_GongxinCard,
      qt_meta_data_GongxinCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GongxinCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GongxinCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GongxinCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GongxinCard))
        return static_cast<void*>(const_cast< GongxinCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int GongxinCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YeyanCard[] = {

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

static const char qt_meta_stringdata_YeyanCard[] = {
    "YeyanCard\0"
};

void YeyanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData YeyanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YeyanCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_YeyanCard,
      qt_meta_data_YeyanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YeyanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YeyanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YeyanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YeyanCard))
        return static_cast<void*>(const_cast< YeyanCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int YeyanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GreatYeyanCard[] = {

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

static const char qt_meta_stringdata_GreatYeyanCard[] = {
    "GreatYeyanCard\0\0GreatYeyanCard()\0"
};

void GreatYeyanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { GreatYeyanCard *_r = new GreatYeyanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData GreatYeyanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GreatYeyanCard::staticMetaObject = {
    { &YeyanCard::staticMetaObject, qt_meta_stringdata_GreatYeyanCard,
      qt_meta_data_GreatYeyanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GreatYeyanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GreatYeyanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GreatYeyanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GreatYeyanCard))
        return static_cast<void*>(const_cast< GreatYeyanCard*>(this));
    return YeyanCard::qt_metacast(_clname);
}

int GreatYeyanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = YeyanCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MediumYeyanCard[] = {

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
      17,   16,   16,   16, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_MediumYeyanCard[] = {
    "MediumYeyanCard\0\0MediumYeyanCard()\0"
};

void MediumYeyanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { MediumYeyanCard *_r = new MediumYeyanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData MediumYeyanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MediumYeyanCard::staticMetaObject = {
    { &YeyanCard::staticMetaObject, qt_meta_stringdata_MediumYeyanCard,
      qt_meta_data_MediumYeyanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MediumYeyanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MediumYeyanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MediumYeyanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MediumYeyanCard))
        return static_cast<void*>(const_cast< MediumYeyanCard*>(this));
    return YeyanCard::qt_metacast(_clname);
}

int MediumYeyanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = YeyanCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SmallYeyanCard[] = {

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

static const char qt_meta_stringdata_SmallYeyanCard[] = {
    "SmallYeyanCard\0\0SmallYeyanCard()\0"
};

void SmallYeyanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { SmallYeyanCard *_r = new SmallYeyanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData SmallYeyanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SmallYeyanCard::staticMetaObject = {
    { &YeyanCard::staticMetaObject, qt_meta_stringdata_SmallYeyanCard,
      qt_meta_data_SmallYeyanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SmallYeyanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SmallYeyanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SmallYeyanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SmallYeyanCard))
        return static_cast<void*>(const_cast< SmallYeyanCard*>(this));
    return YeyanCard::qt_metacast(_clname);
}

int SmallYeyanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = YeyanCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ShenfenCard[] = {

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

static const char qt_meta_stringdata_ShenfenCard[] = {
    "ShenfenCard\0\0ShenfenCard()\0"
};

void ShenfenCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { ShenfenCard *_r = new ShenfenCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData ShenfenCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ShenfenCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_ShenfenCard,
      qt_meta_data_ShenfenCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ShenfenCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ShenfenCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ShenfenCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ShenfenCard))
        return static_cast<void*>(const_cast< ShenfenCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int ShenfenCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_WuqianCard[] = {

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

static const char qt_meta_stringdata_WuqianCard[] = {
    "WuqianCard\0\0WuqianCard()\0"
};

void WuqianCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { WuqianCard *_r = new WuqianCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData WuqianCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject WuqianCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_WuqianCard,
      qt_meta_data_WuqianCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &WuqianCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *WuqianCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *WuqianCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_WuqianCard))
        return static_cast<void*>(const_cast< WuqianCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int WuqianCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_WushenSlash[] = {

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

static const char qt_meta_stringdata_WushenSlash[] = {
    "WushenSlash\0\0suit,number\0"
    "WushenSlash(Card::Suit,int)\0"
};

void WushenSlash::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { WushenSlash *_r = new WushenSlash((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData WushenSlash::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject WushenSlash::staticMetaObject = {
    { &Slash::staticMetaObject, qt_meta_stringdata_WushenSlash,
      qt_meta_data_WushenSlash, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &WushenSlash::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *WushenSlash::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *WushenSlash::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_WushenSlash))
        return static_cast<void*>(const_cast< WushenSlash*>(this));
    return Slash::qt_metacast(_clname);
}

int WushenSlash::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Slash::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_KuangfengCard[] = {

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
      15,   14,   14,   14, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_KuangfengCard[] = {
    "KuangfengCard\0\0KuangfengCard()\0"
};

void KuangfengCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { KuangfengCard *_r = new KuangfengCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData KuangfengCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject KuangfengCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_KuangfengCard,
      qt_meta_data_KuangfengCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &KuangfengCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *KuangfengCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *KuangfengCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_KuangfengCard))
        return static_cast<void*>(const_cast< KuangfengCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int KuangfengCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DawuCard[] = {

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

static const char qt_meta_stringdata_DawuCard[] = {
    "DawuCard\0\0DawuCard()\0"
};

void DawuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { DawuCard *_r = new DawuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData DawuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DawuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_DawuCard,
      qt_meta_data_DawuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DawuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DawuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DawuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DawuCard))
        return static_cast<void*>(const_cast< DawuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int DawuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_JilveCard[] = {

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

static const char qt_meta_stringdata_JilveCard[] = {
    "JilveCard\0\0JilveCard()\0"
};

void JilveCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { JilveCard *_r = new JilveCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData JilveCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject JilveCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_JilveCard,
      qt_meta_data_JilveCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &JilveCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *JilveCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *JilveCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_JilveCard))
        return static_cast<void*>(const_cast< JilveCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int JilveCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
