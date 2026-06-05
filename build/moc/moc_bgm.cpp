/****************************************************************************
** Meta object code from reading C++ file 'bgm.h'
**
** Created: Wed Dec 4 14:49:34 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/bgm.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'bgm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_BGMPackage[] = {

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

static const char qt_meta_stringdata_BGMPackage[] = {
    "BGMPackage\0"
};

void BGMPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData BGMPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject BGMPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_BGMPackage,
      qt_meta_data_BGMPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &BGMPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *BGMPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *BGMPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_BGMPackage))
        return static_cast<void*>(const_cast< BGMPackage*>(this));
    return Package::qt_metacast(_clname);
}

int BGMPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LihunCard[] = {

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

static const char qt_meta_stringdata_LihunCard[] = {
    "LihunCard\0\0LihunCard()\0"
};

void LihunCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { LihunCard *_r = new LihunCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData LihunCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LihunCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_LihunCard,
      qt_meta_data_LihunCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LihunCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LihunCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LihunCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LihunCard))
        return static_cast<void*>(const_cast< LihunCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int LihunCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DaheCard[] = {

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

static const char qt_meta_stringdata_DaheCard[] = {
    "DaheCard\0\0DaheCard()\0"
};

void DaheCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { DaheCard *_r = new DaheCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData DaheCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DaheCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_DaheCard,
      qt_meta_data_DaheCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DaheCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DaheCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DaheCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DaheCard))
        return static_cast<void*>(const_cast< DaheCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int DaheCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TanhuCard[] = {

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

static const char qt_meta_stringdata_TanhuCard[] = {
    "TanhuCard\0\0TanhuCard()\0"
};

void TanhuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { TanhuCard *_r = new TanhuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData TanhuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TanhuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_TanhuCard,
      qt_meta_data_TanhuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TanhuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TanhuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TanhuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TanhuCard))
        return static_cast<void*>(const_cast< TanhuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int TanhuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ShichouCard[] = {

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

static const char qt_meta_stringdata_ShichouCard[] = {
    "ShichouCard\0\0ShichouCard()\0"
};

void ShichouCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { ShichouCard *_r = new ShichouCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData ShichouCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ShichouCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_ShichouCard,
      qt_meta_data_ShichouCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ShichouCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ShichouCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ShichouCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ShichouCard))
        return static_cast<void*>(const_cast< ShichouCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int ShichouCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YanxiaoCard[] = {

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

static const char qt_meta_stringdata_YanxiaoCard[] = {
    "YanxiaoCard\0\0YanxiaoCard()\0"
};

void YanxiaoCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { YanxiaoCard *_r = new YanxiaoCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData YanxiaoCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YanxiaoCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_YanxiaoCard,
      qt_meta_data_YanxiaoCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YanxiaoCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YanxiaoCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YanxiaoCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YanxiaoCard))
        return static_cast<void*>(const_cast< YanxiaoCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int YanxiaoCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YinlingCard[] = {

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

static const char qt_meta_stringdata_YinlingCard[] = {
    "YinlingCard\0\0YinlingCard()\0"
};

void YinlingCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { YinlingCard *_r = new YinlingCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData YinlingCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YinlingCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_YinlingCard,
      qt_meta_data_YinlingCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YinlingCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YinlingCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YinlingCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YinlingCard))
        return static_cast<void*>(const_cast< YinlingCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int YinlingCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_PasterPackage[] = {

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

static const char qt_meta_stringdata_PasterPackage[] = {
    "PasterPackage\0"
};

void PasterPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData PasterPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject PasterPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_PasterPackage,
      qt_meta_data_PasterPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PasterPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PasterPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PasterPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PasterPackage))
        return static_cast<void*>(const_cast< PasterPackage*>(this));
    return Package::qt_metacast(_clname);
}

int PasterPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_FuluanCard[] = {

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

static const char qt_meta_stringdata_FuluanCard[] = {
    "FuluanCard\0\0FuluanCard()\0"
};

void FuluanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { FuluanCard *_r = new FuluanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData FuluanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FuluanCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_FuluanCard,
      qt_meta_data_FuluanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FuluanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FuluanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FuluanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FuluanCard))
        return static_cast<void*>(const_cast< FuluanCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int FuluanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_LangguCard[] = {

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

static const char qt_meta_stringdata_LangguCard[] = {
    "LangguCard\0\0LangguCard()\0"
};

void LangguCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { LangguCard *_r = new LangguCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData LangguCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LangguCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_LangguCard,
      qt_meta_data_LangguCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LangguCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LangguCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LangguCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LangguCard))
        return static_cast<void*>(const_cast< LangguCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int LangguCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_HuangenCard[] = {

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

static const char qt_meta_stringdata_HuangenCard[] = {
    "HuangenCard\0\0HuangenCard()\0"
};

void HuangenCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { HuangenCard *_r = new HuangenCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData HuangenCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject HuangenCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_HuangenCard,
      qt_meta_data_HuangenCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &HuangenCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *HuangenCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *HuangenCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_HuangenCard))
        return static_cast<void*>(const_cast< HuangenCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int HuangenCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_Yic0ngCard[] = {

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

static const char qt_meta_stringdata_Yic0ngCard[] = {
    "Yic0ngCard\0\0Yic0ngCard()\0"
};

void Yic0ngCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { Yic0ngCard *_r = new Yic0ngCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData Yic0ngCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Yic0ngCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_Yic0ngCard,
      qt_meta_data_Yic0ngCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Yic0ngCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Yic0ngCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Yic0ngCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Yic0ngCard))
        return static_cast<void*>(const_cast< Yic0ngCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int Yic0ngCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MingjianCard[] = {

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

static const char qt_meta_stringdata_MingjianCard[] = {
    "MingjianCard\0\0MingjianCard()\0"
};

void MingjianCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { MingjianCard *_r = new MingjianCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData MingjianCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MingjianCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_MingjianCard,
      qt_meta_data_MingjianCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MingjianCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MingjianCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MingjianCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MingjianCard))
        return static_cast<void*>(const_cast< MingjianCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int MingjianCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
