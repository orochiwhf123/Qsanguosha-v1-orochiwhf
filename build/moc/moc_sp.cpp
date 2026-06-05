/****************************************************************************
** Meta object code from reading C++ file 'sp.h'
**
** Created: Tue Dec 10 16:27:04 2019
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/sp.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'sp.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_SPPackage[] = {

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

static const char qt_meta_stringdata_SPPackage[] = {
    "SPPackage\0"
};

void SPPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SPPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SPPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_SPPackage,
      qt_meta_data_SPPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SPPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SPPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SPPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SPPackage))
        return static_cast<void*>(const_cast< SPPackage*>(this));
    return Package::qt_metacast(_clname);
}

int SPPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_WeidiCard[] = {

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

static const char qt_meta_stringdata_WeidiCard[] = {
    "WeidiCard\0\0WeidiCard()\0"
};

void WeidiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { WeidiCard *_r = new WeidiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData WeidiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject WeidiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_WeidiCard,
      qt_meta_data_WeidiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &WeidiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *WeidiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *WeidiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_WeidiCard))
        return static_cast<void*>(const_cast< WeidiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int WeidiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_YuanhuCard[] = {

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

static const char qt_meta_stringdata_YuanhuCard[] = {
    "YuanhuCard\0\0YuanhuCard()\0"
};

void YuanhuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { YuanhuCard *_r = new YuanhuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData YuanhuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject YuanhuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_YuanhuCard,
      qt_meta_data_YuanhuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &YuanhuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *YuanhuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *YuanhuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_YuanhuCard))
        return static_cast<void*>(const_cast< YuanhuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int YuanhuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_XuejiCard[] = {

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

static const char qt_meta_stringdata_XuejiCard[] = {
    "XuejiCard\0\0XuejiCard()\0"
};

void XuejiCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { XuejiCard *_r = new XuejiCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData XuejiCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject XuejiCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_XuejiCard,
      qt_meta_data_XuejiCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &XuejiCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *XuejiCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *XuejiCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_XuejiCard))
        return static_cast<void*>(const_cast< XuejiCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int XuejiCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_BifaCard[] = {

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

static const char qt_meta_stringdata_BifaCard[] = {
    "BifaCard\0\0BifaCard()\0"
};

void BifaCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { BifaCard *_r = new BifaCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData BifaCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject BifaCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_BifaCard,
      qt_meta_data_BifaCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &BifaCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *BifaCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *BifaCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_BifaCard))
        return static_cast<void*>(const_cast< BifaCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int BifaCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SongciCard[] = {

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

static const char qt_meta_stringdata_SongciCard[] = {
    "SongciCard\0\0SongciCard()\0"
};

void SongciCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { SongciCard *_r = new SongciCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData SongciCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SongciCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_SongciCard,
      qt_meta_data_SongciCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SongciCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SongciCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SongciCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SongciCard))
        return static_cast<void*>(const_cast< SongciCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int SongciCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MizhaoCard[] = {

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

static const char qt_meta_stringdata_MizhaoCard[] = {
    "MizhaoCard\0\0MizhaoCard()\0"
};

void MizhaoCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { MizhaoCard *_r = new MizhaoCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData MizhaoCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MizhaoCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_MizhaoCard,
      qt_meta_data_MizhaoCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MizhaoCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MizhaoCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MizhaoCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MizhaoCard))
        return static_cast<void*>(const_cast< MizhaoCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int MizhaoCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DuwuCard[] = {

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

static const char qt_meta_stringdata_DuwuCard[] = {
    "DuwuCard\0\0DuwuCard()\0"
};

void DuwuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { DuwuCard *_r = new DuwuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData DuwuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DuwuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_DuwuCard,
      qt_meta_data_DuwuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DuwuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DuwuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DuwuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DuwuCard))
        return static_cast<void*>(const_cast< DuwuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int DuwuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MouzhuCard[] = {

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

static const char qt_meta_stringdata_MouzhuCard[] = {
    "MouzhuCard\0\0MouzhuCard()\0"
};

void MouzhuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { MouzhuCard *_r = new MouzhuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData MouzhuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MouzhuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_MouzhuCard,
      qt_meta_data_MouzhuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MouzhuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MouzhuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MouzhuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MouzhuCard))
        return static_cast<void*>(const_cast< MouzhuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int MouzhuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ZhoufuCard[] = {

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

static const char qt_meta_stringdata_ZhoufuCard[] = {
    "ZhoufuCard\0\0ZhoufuCard()\0"
};

void ZhoufuCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { ZhoufuCard *_r = new ZhoufuCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData ZhoufuCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ZhoufuCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_ZhoufuCard,
      qt_meta_data_ZhoufuCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ZhoufuCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ZhoufuCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ZhoufuCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ZhoufuCard))
        return static_cast<void*>(const_cast< ZhoufuCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int ZhoufuCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_XintanCard[] = {

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

static const char qt_meta_stringdata_XintanCard[] = {
    "XintanCard\0\0XintanCard()\0"
};

void XintanCard::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::CreateInstance) {
        switch (_id) {
        case 0: { XintanCard *_r = new XintanCard();
            if (_a[0]) *reinterpret_cast<QObject**>(_a[0]) = _r; } break;
        }
    }
    Q_UNUSED(_o);
}

const QMetaObjectExtraData XintanCard::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject XintanCard::staticMetaObject = {
    { &SkillCard::staticMetaObject, qt_meta_stringdata_XintanCard,
      qt_meta_data_XintanCard, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &XintanCard::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *XintanCard::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *XintanCard::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_XintanCard))
        return static_cast<void*>(const_cast< XintanCard*>(this));
    return SkillCard::qt_metacast(_clname);
}

int XintanCard::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = SkillCard::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SPCardPackage[] = {

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

static const char qt_meta_stringdata_SPCardPackage[] = {
    "SPCardPackage\0"
};

void SPCardPackage::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SPCardPackage::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SPCardPackage::staticMetaObject = {
    { &Package::staticMetaObject, qt_meta_stringdata_SPCardPackage,
      qt_meta_data_SPCardPackage, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SPCardPackage::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SPCardPackage::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SPCardPackage::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SPCardPackage))
        return static_cast<void*>(const_cast< SPCardPackage*>(this));
    return Package::qt_metacast(_clname);
}

int SPCardPackage::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Package::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
