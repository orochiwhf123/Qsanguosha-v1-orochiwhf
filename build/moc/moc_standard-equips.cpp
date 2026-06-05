/****************************************************************************
** Meta object code from reading C++ file 'standard-equips.h'
**
** Created: Wed Dec 4 14:49:07 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/standard-equips.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'standard-equips.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Crossbow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       2,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      22,   10,    9,    9, 0x0e,
      52,   47,    9,    9, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_Crossbow[] = {
    "Crossbow\0\0suit,number\0Crossbow(Card::Suit,int)\0"
    "suit\0Crossbow(Card::Suit)\0"
};

void Crossbow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Crossbow *_r = new Crossbow((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { Crossbow *_r = new Crossbow((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Crossbow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Crossbow::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_Crossbow,
      qt_meta_data_Crossbow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Crossbow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Crossbow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Crossbow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Crossbow))
        return static_cast<void*>(const_cast< Crossbow*>(this));
    return Weapon::qt_metacast(_clname);
}

int Crossbow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DoubleSword[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      25,   13,   12,   12, 0x0e,
      58,   53,   12,   12, 0x2e,
      82,   12,   12,   12, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_DoubleSword[] = {
    "DoubleSword\0\0suit,number\0"
    "DoubleSword(Card::Suit,int)\0suit\0"
    "DoubleSword(Card::Suit)\0DoubleSword()\0"
};

void DoubleSword::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { DoubleSword *_r = new DoubleSword((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { DoubleSword *_r = new DoubleSword((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { DoubleSword *_r = new DoubleSword();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData DoubleSword::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DoubleSword::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_DoubleSword,
      qt_meta_data_DoubleSword, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DoubleSword::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DoubleSword::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DoubleSword::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DoubleSword))
        return static_cast<void*>(const_cast< DoubleSword*>(this));
    return Weapon::qt_metacast(_clname);
}

int DoubleSword::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_QinggangSword[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      27,   15,   14,   14, 0x0e,
      62,   57,   14,   14, 0x2e,
      88,   14,   14,   14, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_QinggangSword[] = {
    "QinggangSword\0\0suit,number\0"
    "QinggangSword(Card::Suit,int)\0suit\0"
    "QinggangSword(Card::Suit)\0QinggangSword()\0"
};

void QinggangSword::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { QinggangSword *_r = new QinggangSword((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { QinggangSword *_r = new QinggangSword((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { QinggangSword *_r = new QinggangSword();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData QinggangSword::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject QinggangSword::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_QinggangSword,
      qt_meta_data_QinggangSword, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &QinggangSword::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *QinggangSword::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *QinggangSword::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_QinggangSword))
        return static_cast<void*>(const_cast< QinggangSword*>(this));
    return Weapon::qt_metacast(_clname);
}

int QinggangSword::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Blade[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      19,    7,    6,    6, 0x0e,
      46,   41,    6,    6, 0x2e,
      64,    6,    6,    6, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_Blade[] = {
    "Blade\0\0suit,number\0Blade(Card::Suit,int)\0"
    "suit\0Blade(Card::Suit)\0Blade()\0"
};

void Blade::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Blade *_r = new Blade((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { Blade *_r = new Blade((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { Blade *_r = new Blade();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Blade::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Blade::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_Blade,
      qt_meta_data_Blade, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Blade::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Blade::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Blade::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Blade))
        return static_cast<void*>(const_cast< Blade*>(this));
    return Weapon::qt_metacast(_clname);
}

int Blade::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Spear[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      19,    7,    6,    6, 0x0e,
      46,   41,    6,    6, 0x2e,
      64,    6,    6,    6, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_Spear[] = {
    "Spear\0\0suit,number\0Spear(Card::Suit,int)\0"
    "suit\0Spear(Card::Suit)\0Spear()\0"
};

void Spear::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Spear *_r = new Spear((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { Spear *_r = new Spear((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { Spear *_r = new Spear();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Spear::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Spear::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_Spear,
      qt_meta_data_Spear, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Spear::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Spear::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Spear::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Spear))
        return static_cast<void*>(const_cast< Spear*>(this));
    return Weapon::qt_metacast(_clname);
}

int Spear::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Axe[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      17,    5,    4,    4, 0x0e,
      42,   37,    4,    4, 0x2e,
      58,    4,    4,    4, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_Axe[] = {
    "Axe\0\0suit,number\0Axe(Card::Suit,int)\0"
    "suit\0Axe(Card::Suit)\0Axe()\0"
};

void Axe::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Axe *_r = new Axe((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { Axe *_r = new Axe((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { Axe *_r = new Axe();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Axe::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Axe::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_Axe,
      qt_meta_data_Axe, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Axe::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Axe::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Axe::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Axe))
        return static_cast<void*>(const_cast< Axe*>(this));
    return Weapon::qt_metacast(_clname);
}

int Axe::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Halberd[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      21,    9,    8,    8, 0x0e,
      50,   45,    8,    8, 0x2e,
      70,    8,    8,    8, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_Halberd[] = {
    "Halberd\0\0suit,number\0Halberd(Card::Suit,int)\0"
    "suit\0Halberd(Card::Suit)\0Halberd()\0"
};

void Halberd::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Halberd *_r = new Halberd((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { Halberd *_r = new Halberd((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { Halberd *_r = new Halberd();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Halberd::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Halberd::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_Halberd,
      qt_meta_data_Halberd, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Halberd::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Halberd::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Halberd::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Halberd))
        return static_cast<void*>(const_cast< Halberd*>(this));
    return Weapon::qt_metacast(_clname);
}

int Halberd::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_KylinBow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       3,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      22,   10,    9,    9, 0x0e,
      52,   47,    9,    9, 0x2e,
      73,    9,    9,    9, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_KylinBow[] = {
    "KylinBow\0\0suit,number\0KylinBow(Card::Suit,int)\0"
    "suit\0KylinBow(Card::Suit)\0KylinBow()\0"
};

void KylinBow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { KylinBow *_r = new KylinBow((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { KylinBow *_r = new KylinBow((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { KylinBow *_r = new KylinBow();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData KylinBow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject KylinBow::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_KylinBow,
      qt_meta_data_KylinBow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &KylinBow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *KylinBow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *KylinBow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_KylinBow))
        return static_cast<void*>(const_cast< KylinBow*>(this));
    return Weapon::qt_metacast(_clname);
}

int KylinBow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_EightDiagram[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       2,   14, // constructors
       0,       // flags
       0,       // signalCount

 // constructors: signature, parameters, type, tag, flags
      26,   14,   13,   13, 0x0e,
      60,   55,   13,   13, 0x2e,

       0        // eod
};

static const char qt_meta_stringdata_EightDiagram[] = {
    "EightDiagram\0\0suit,number\0"
    "EightDiagram(Card::Suit,int)\0suit\0"
    "EightDiagram(Card::Suit)\0"
};

void EightDiagram::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { EightDiagram *_r = new EightDiagram((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { EightDiagram *_r = new EightDiagram((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData EightDiagram::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject EightDiagram::staticMetaObject = {
    { &Armor::staticMetaObject, qt_meta_stringdata_EightDiagram,
      qt_meta_data_EightDiagram, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &EightDiagram::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *EightDiagram::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *EightDiagram::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_EightDiagram))
        return static_cast<void*>(const_cast< EightDiagram*>(this));
    return Armor::qt_metacast(_clname);
}

int EightDiagram::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Armor::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_IceSword[] = {

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
      22,   10,    9,    9, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_IceSword[] = {
    "IceSword\0\0suit,number\0IceSword(Card::Suit,int)\0"
};

void IceSword::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { IceSword *_r = new IceSword((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData IceSword::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject IceSword::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_IceSword,
      qt_meta_data_IceSword, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &IceSword::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *IceSword::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *IceSword::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_IceSword))
        return static_cast<void*>(const_cast< IceSword*>(this));
    return Weapon::qt_metacast(_clname);
}

int IceSword::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_RenwangShield[] = {

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
      27,   15,   14,   14, 0x0e,

       0        // eod
};

static const char qt_meta_stringdata_RenwangShield[] = {
    "RenwangShield\0\0suit,number\0"
    "RenwangShield(Card::Suit,int)\0"
};

void RenwangShield::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { RenwangShield *_r = new RenwangShield((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData RenwangShield::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject RenwangShield::staticMetaObject = {
    { &Armor::staticMetaObject, qt_meta_stringdata_RenwangShield,
      qt_meta_data_RenwangShield, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RenwangShield::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RenwangShield::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RenwangShield::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RenwangShield))
        return static_cast<void*>(const_cast< RenwangShield*>(this));
    return Armor::qt_metacast(_clname);
}

int RenwangShield::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Armor::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_StandardCardPackage[] = {

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

static const char qt_meta_stringdata_StandardCardPackage[] = {
    "StandardCardPackage\0"
};

void StandardCardPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData StandardCardPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject StandardCardPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_StandardCardPackage,
      qt_meta_data_StandardCardPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &StandardCardPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *StandardCardPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *StandardCardPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_StandardCardPackage))
        return static_cast<void*>(const_cast< StandardCardPackage*>(this));
    return Package::qt_metacast(_clname);
}

int StandardCardPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_StandardExCardPackage[] = {

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

static const char qt_meta_stringdata_StandardExCardPackage[] = {
    "StandardExCardPackage\0"
};

void StandardExCardPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData StandardExCardPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject StandardExCardPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_StandardExCardPackage,
      qt_meta_data_StandardExCardPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &StandardExCardPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *StandardExCardPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *StandardExCardPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_StandardExCardPackage))
        return static_cast<void*>(const_cast< StandardExCardPackage*>(this));
    return Package::qt_metacast(_clname);
}

int StandardExCardPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
