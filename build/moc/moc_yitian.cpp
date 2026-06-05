/****************************************************************************
** Meta object code from reading C++ file 'yitian.h'
**
** Created: Wed Dec 4 14:49:23 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/yitian.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'yitian.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_YitianPackage[] = {

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

static const char qt_meta_stringdata_YitianPackage[] = {
    "YitianPackage\0"
};

void YitianPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData YitianPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YitianPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_YitianPackage,
      qt_meta_data_YitianPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YitianPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YitianPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YitianPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YitianPackage))
        return static_cast<void*>(const_cast< YitianPackage*>(this));
    return Package::qt_metacast(_clname);
}

int YitianPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Chengx1angCard[] = {

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

static const char qt_meta_stringdata_Chengx1angCard[] = {
    "Chengx1angCard\0\0Chengx1angCard()\0"
};

void Chengx1angCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Chengx1angCard *_r = new Chengx1angCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Chengx1angCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Chengx1angCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_Chengx1angCard,
      qt_meta_data_Chengx1angCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Chengx1angCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Chengx1angCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Chengx1angCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Chengx1angCard))
        return static_cast<void*>(const_cast< Chengx1angCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int Chengx1angCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_JuejiCard[] = {

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

static const char qt_meta_stringdata_JuejiCard[] = {
    "JuejiCard\0\0JuejiCard()\0"
};

void JuejiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { JuejiCard *_r = new JuejiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData JuejiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject JuejiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_JuejiCard,
      qt_meta_data_JuejiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &JuejiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *JuejiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *JuejiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_JuejiCard))
        return static_cast<void*>(const_cast< JuejiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int JuejiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YitianSword[] = {

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

static const char qt_meta_stringdata_YitianSword[] = {
    "YitianSword\0\0suit,number\0"
    "YitianSword(Card::Suit,int)\0suit\0"
    "YitianSword(Card::Suit)\0YitianSword()\0"
};

void YitianSword::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { YitianSword *_r = new YitianSword((*reinterpret_cast< Card::Suit(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 1: { YitianSword *_r = new YitianSword((*reinterpret_cast< Card::Suit(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        case 2: { YitianSword *_r = new YitianSword();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData YitianSword::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YitianSword::staticMetaObject = {
    { &Weapon::staticMetaObject, qt_meta_stringdata_YitianSword,
      qt_meta_data_YitianSword, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YitianSword::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YitianSword::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YitianSword::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YitianSword))
        return static_cast<void*>(const_cast< YitianSword*>(this));
    return Weapon::qt_metacast(_clname);
}

int YitianSword::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Weapon::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LianliCard[] = {

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

static const char qt_meta_stringdata_LianliCard[] = {
    "LianliCard\0\0LianliCard()\0"
};

void LianliCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { LianliCard *_r = new LianliCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData LianliCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LianliCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_LianliCard,
      qt_meta_data_LianliCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LianliCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LianliCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LianliCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LianliCard))
        return static_cast<void*>(const_cast< LianliCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int LianliCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LianliSlashCard[] = {

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

static const char qt_meta_stringdata_LianliSlashCard[] = {
    "LianliSlashCard\0\0LianliSlashCard()\0"
};

void LianliSlashCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { LianliSlashCard *_r = new LianliSlashCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData LianliSlashCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LianliSlashCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_LianliSlashCard,
      qt_meta_data_LianliSlashCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LianliSlashCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LianliSlashCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LianliSlashCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LianliSlashCard))
        return static_cast<void*>(const_cast< LianliSlashCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int LianliSlashCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GuihanCard[] = {

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

static const char qt_meta_stringdata_GuihanCard[] = {
    "GuihanCard\0\0GuihanCard()\0"
};

void GuihanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { GuihanCard *_r = new GuihanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData GuihanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GuihanCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_GuihanCard,
      qt_meta_data_GuihanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GuihanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GuihanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GuihanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GuihanCard))
        return static_cast<void*>(const_cast< GuihanCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int GuihanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LexueCard[] = {

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

static const char qt_meta_stringdata_LexueCard[] = {
    "LexueCard\0\0LexueCard()\0"
};

void LexueCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { LexueCard *_r = new LexueCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData LexueCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LexueCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_LexueCard,
      qt_meta_data_LexueCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LexueCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LexueCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LexueCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LexueCard))
        return static_cast<void*>(const_cast< LexueCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int LexueCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_XunzhiCard[] = {

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

static const char qt_meta_stringdata_XunzhiCard[] = {
    "XunzhiCard\0\0XunzhiCard()\0"
};

void XunzhiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { XunzhiCard *_r = new XunzhiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData XunzhiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject XunzhiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_XunzhiCard,
      qt_meta_data_XunzhiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &XunzhiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *XunzhiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *XunzhiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_XunzhiCard))
        return static_cast<void*>(const_cast< XunzhiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int XunzhiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YisheCard[] = {

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

static const char qt_meta_stringdata_YisheCard[] = {
    "YisheCard\0\0YisheCard()\0"
};

void YisheCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { YisheCard *_r = new YisheCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData YisheCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YisheCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_YisheCard,
      qt_meta_data_YisheCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YisheCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YisheCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YisheCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YisheCard))
        return static_cast<void*>(const_cast< YisheCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int YisheCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YisheAskCard[] = {

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

static const char qt_meta_stringdata_YisheAskCard[] = {
    "YisheAskCard\0\0YisheAskCard()\0"
};

void YisheAskCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { YisheAskCard *_r = new YisheAskCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData YisheAskCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YisheAskCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_YisheAskCard,
      qt_meta_data_YisheAskCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YisheAskCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YisheAskCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YisheAskCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YisheAskCard))
        return static_cast<void*>(const_cast< YisheAskCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int YisheAskCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TaichenCard[] = {

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

static const char qt_meta_stringdata_TaichenCard[] = {
    "TaichenCard\0\0TaichenCard()\0"
};

void TaichenCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { TaichenCard *_r = new TaichenCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData TaichenCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TaichenCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_TaichenCard,
      qt_meta_data_TaichenCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TaichenCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TaichenCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TaichenCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TaichenCard))
        return static_cast<void*>(const_cast< TaichenCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int TaichenCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YitianCardPackage[] = {

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

static const char qt_meta_stringdata_YitianCardPackage[] = {
    "YitianCardPackage\0"
};

void YitianCardPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData YitianCardPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YitianCardPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_YitianCardPackage,
      qt_meta_data_YitianCardPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YitianCardPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YitianCardPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YitianCardPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YitianCardPackage))
        return static_cast<void*>(const_cast< YitianCardPackage*>(this));
    return Package::qt_metacast(_clname);
}

int YitianCardPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
