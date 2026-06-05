/****************************************************************************
** Meta object code from reading C++ file 'general.h'
**
** Created: Wed Dec 4 14:48:11 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/core/general.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'general.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_General[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
      10,   54, // properties
       1,   84, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      17,    8,    9,    8, 0x0a,
      48,   39,    9,    8, 0x0a,
      71,    8,    9,    8, 0x0a,
      84,    8,    9,    8, 0x0a,
     102,    8,    9,    8, 0x0a,
     116,    8,    9,    8, 0x0a,
     129,    8,    8,    8, 0x0a,
     144,    8,    8,    8, 0x0a,

 // properties: name, type, flags
     158,    9, 0x0a095401,
     170,  166, 0x02095401,
     181,  176, 0x01085401,
     186,  176, 0x01085401,
     200,  193, 0x00095409,
     207,  176, 0x01095401,
     212,  176, 0x01095401,
     219,    9, 0x0a095401,
     228,    9, 0x0a095401,
     240,    9, 0x0a095401,

 // enums: name, flags, count, data
     193, 0x0,    3,   88,

 // enum data: key, value
     243, uint(General::Male),
     248, uint(General::Female),
     255, uint(General::Neuter),

       0        // eod
};

static const char qt_meta_stringdata_General[] = {
    "General\0\0QString\0getSkillDescription()\0"
    "category\0getPixmapPath(QString)\0"
    "getPackage()\0getGenderString()\0"
    "getLastWord()\0getWinWord()\0playLastWord()\0"
    "playWinWord()\0kingdom\0int\0maxhp\0bool\0"
    "male\0female\0Gender\0gender\0lord\0hidden\0"
    "designer\0illustrator\0cv\0Male\0Female\0"
    "Neuter\0"
};

void General::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        General *_t = static_cast<General *>(_o);
        switch (_id) {
        case 0: { QString _r = _t->getSkillDescription();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: { QString _r = _t->getPixmapPath((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 2: { QString _r = _t->getPackage();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 3: { QString _r = _t->getGenderString();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 4: { QString _r = _t->getLastWord();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 5: { QString _r = _t->getWinWord();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 6: _t->playLastWord(); break;
        case 7: _t->playWinWord(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData General::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject General::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_General,
      qt_meta_data_General, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &General::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *General::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *General::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_General))
        return static_cast<void*>(const_cast< General*>(this));
    return QObject::qt_metacast(_clname);
}

int General::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getKingdom(); break;
        case 1: *reinterpret_cast< int*>(_v) = getMaxHp(); break;
        case 2: *reinterpret_cast< bool*>(_v) = isMale(); break;
        case 3: *reinterpret_cast< bool*>(_v) = isFemale(); break;
        case 4: *reinterpret_cast< Gender*>(_v) = getGender(); break;
        case 5: *reinterpret_cast< bool*>(_v) = isLord(); break;
        case 6: *reinterpret_cast< bool*>(_v) = isHidden(); break;
        case 7: *reinterpret_cast< QString*>(_v) = getDesigner(); break;
        case 8: *reinterpret_cast< QString*>(_v) = getIllustrator(); break;
        case 9: *reinterpret_cast< QString*>(_v) = getCV(); break;
        }
        _id -= 10;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 10;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 10;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 10;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
