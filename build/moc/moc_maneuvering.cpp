/****************************************************************************
** Meta object code from reading C++ file 'maneuvering.h'
**
** Created: Wed Dec 4 14:48:57 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/maneuvering.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'maneuvering.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_NatureSlash[] = {

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

static const char qt_meta_stringdata_NatureSlash[] = {
    "NatureSlash\0"
};

void NatureSlash::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData NatureSlash::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject NatureSlash::staticMetaObject = {
    { &Slash::staticMetaObject, qt_meta_stringdata_NatureSlash,
      qt_meta_data_NatureSlash, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &NatureSlash::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *NatureSlash::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *NatureSlash::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_NatureSlash))
        return static_cast<void*>(const_cast< NatureSlash*>(this));
    return Slash::qt_metacast(_clname);
}

int NatureSlash::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Slash::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ThunderSlash[] = {

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
      26,   14,   13,   13, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_ThunderSlash[] = {
    "ThunderSlash\0\0suit,number\0"
    "ThunderSlash(Card::Suit,int)\0"
};

void ThunderSlash::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { ThunderSlash *_r = new ThunderSlash((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData ThunderSlash::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ThunderSlash::staticMetaObject = {
    { &NatureSlash::staticMetaObject, qt_meta_stringdata_ThunderSlash,
      qt_meta_data_ThunderSlash, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ThunderSlash::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ThunderSlash::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ThunderSlash::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ThunderSlash))
        return static_cast<void*>(const_cast< ThunderSlash*>(this));
    return NatureSlash::qt_metacast(_clname);
}

int ThunderSlash::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = NatureSlash::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_FireSlash[] = {

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
      23,   11,   10,   10, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_FireSlash[] = {
    "FireSlash\0\0suit,number\0FireSlash(Card::Suit,int)\0"
};

void FireSlash::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { FireSlash *_r = new FireSlash((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData FireSlash::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FireSlash::staticMetaObject = {
    { &NatureSlash::staticMetaObject, qt_meta_stringdata_FireSlash,
      qt_meta_data_FireSlash, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FireSlash::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FireSlash::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FireSlash::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FireSlash))
        return static_cast<void*>(const_cast< FireSlash*>(this));
    return NatureSlash::qt_metacast(_clname);
}

int FireSlash::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = NatureSlash::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Analeptic[] = {

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
      23,   11,   10,   10, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_Analeptic[] = {
    "Analeptic\0\0suit,number\0Analeptic(Card::Suit,int)\0"
};

void Analeptic::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Analeptic *_r = new Analeptic((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Analeptic::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Analeptic::staticMetaObject = {
    { &BasicCard::staticMetaObject, qt_meta_stringdata_Analeptic,
      qt_meta_data_Analeptic, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Analeptic::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Analeptic::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Analeptic::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Analeptic))
        return static_cast<void*>(const_cast< Analeptic*>(this));
    return BasicCard::qt_metacast(_clname);
}

int Analeptic::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = BasicCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Fan[] = {

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
      17,    5,    4,    4, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_Fan[] = {
    "Fan\0\0suit,number\0Fan(Card::Suit,int)\0"
};

void Fan::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Fan *_r = new Fan((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Fan::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Fan::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_Fan,
      qt_meta_data_Fan, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Fan::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Fan::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Fan::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Fan))
        return static_cast<void*>(const_cast< Fan*>(this));
    return Weapon::qt_metacast(_clname);
}

int Fan::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GudingBlade[] = {

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

static const char qt_meta_stringdata_GudingBlade[] = {
    "GudingBlade\0\0suit,number\0"
    "GudingBlade(Card::Suit,int)\0"
};

void GudingBlade::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { GudingBlade *_r = new GudingBlade((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData GudingBlade::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GudingBlade::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_GudingBlade,
      qt_meta_data_GudingBlade, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GudingBlade::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GudingBlade::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GudingBlade::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GudingBlade))
        return static_cast<void*>(const_cast< GudingBlade*>(this));
    return Weapon::qt_metacast(_clname);
}

int GudingBlade::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Vine[] = {

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
      18,    6,    5,    5, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_Vine[] = {
    "Vine\0\0suit,number\0Vine(Card::Suit,int)\0"
};

void Vine::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Vine *_r = new Vine((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Vine::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Vine::staticMetaObject = {
    { &Armor::staticMetaObject, qt_meta_stringdata_Vine,
      qt_meta_data_Vine, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Vine::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Vine::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Vine::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Vine))
        return static_cast<void*>(const_cast< Vine*>(this));
    return Armor::qt_metacast(_clname);
}

int Vine::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Armor::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SilverLion[] = {

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
      24,   12,   11,   11, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_SilverLion[] = {
    "SilverLion\0\0suit,number\0"
    "SilverLion(Card::Suit,int)\0"
};

void SilverLion::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { SilverLion *_r = new SilverLion((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData SilverLion::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SilverLion::staticMetaObject = {
    { &Armor::staticMetaObject, qt_meta_stringdata_SilverLion,
      qt_meta_data_SilverLion, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SilverLion::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SilverLion::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SilverLion::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SilverLion))
        return static_cast<void*>(const_cast< SilverLion*>(this));
    return Armor::qt_metacast(_clname);
}

int SilverLion::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Armor::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_IronChain[] = {

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
      23,   11,   10,   10, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_IronChain[] = {
    "IronChain\0\0suit,number\0IronChain(Card::Suit,int)\0"
};

void IronChain::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { IronChain *_r = new IronChain((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData IronChain::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject IronChain::staticMetaObject = {
    { &TrickCard::staticMetaObject, qt_meta_stringdata_IronChain,
      qt_meta_data_IronChain, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &IronChain::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *IronChain::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *IronChain::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_IronChain))
        return static_cast<void*>(const_cast< IronChain*>(this));
    return TrickCard::qt_metacast(_clname);
}

int IronChain::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TrickCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_FireAttack[] = {

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
      24,   12,   11,   11, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_FireAttack[] = {
    "FireAttack\0\0suit,number\0"
    "FireAttack(Card::Suit,int)\0"
};

void FireAttack::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { FireAttack *_r = new FireAttack((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData FireAttack::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FireAttack::staticMetaObject = {
    { &SingleTargetTrick::staticMetaObject, qt_meta_stringdata_FireAttack,
      qt_meta_data_FireAttack, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FireAttack::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FireAttack::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FireAttack::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FireAttack))
        return static_cast<void*>(const_cast< FireAttack*>(this));
    return SingleTargetTrick::qt_metacast(_clname);
}

int FireAttack::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SingleTargetTrick::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SupplyShortage[] = {

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
      28,   16,   15,   15, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_SupplyShortage[] = {
    "SupplyShortage\0\0suit,number\0"
    "SupplyShortage(Card::Suit,int)\0"
};

void SupplyShortage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { SupplyShortage *_r = new SupplyShortage((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData SupplyShortage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SupplyShortage::staticMetaObject = {
    { &DelayedTrick::staticMetaObject, qt_meta_stringdata_SupplyShortage,
      qt_meta_data_SupplyShortage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SupplyShortage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SupplyShortage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SupplyShortage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SupplyShortage))
        return static_cast<void*>(const_cast< SupplyShortage*>(this));
    return DelayedTrick::qt_metacast(_clname);
}

int SupplyShortage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = DelayedTrick::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ManeuveringPackage[] = {

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

static const char qt_meta_stringdata_ManeuveringPackage[] = {
    "ManeuveringPackage\0"
};

void ManeuveringPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ManeuveringPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ManeuveringPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_ManeuveringPackage,
      qt_meta_data_ManeuveringPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ManeuveringPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ManeuveringPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ManeuveringPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ManeuveringPackage))
        return static_cast<void*>(const_cast< ManeuveringPackage*>(this));
    return Package::qt_metacast(_clname);
}

int ManeuveringPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
