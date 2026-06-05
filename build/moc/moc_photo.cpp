/****************************************************************************
** Meta object code from reading C++ file 'photo.h'
**
** Created: Wed Dec 4 14:50:39 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/ui/photo.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'photo.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Photo[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
       7,    6,    6,    6, 0x0a,
      22,    6,    6,    6, 0x0a,
      50,   42,    6,    6, 0x0a,
      72,    6,    6,    6, 0x0a,
      96,   86,    6,    6, 0x0a,
     116,    6,    6,    6, 0x0a,
     126,    6,    6,    6, 0x0a,
     140,    6,    6,    6, 0x0a,
     156,    6,    6,    6, 0x0a,
     172,    6,    6,    6, 0x0a,
     189,    6,    6,    6, 0x0a,
     213,    6,    6,    6, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_Photo[] = {
    "Photo\0\0updateAvatar()\0updateSmallAvatar()\0"
    "visible\0updateReadyItem(bool)\0"
    "updatePhase()\0pile_name\0updatePile(QString)\0"
    "refresh()\0hideEmotion()\0hideSkillName()\0"
    "setDrankState()\0setActionState()\0"
    "updateRoleComboboxPos()\0killPlayer()\0"
};

void Photo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Photo *_t = static_cast<Photo *>(_o);
        switch (_id) {
        case 0: _t->updateAvatar(); break;
        case 1: _t->updateSmallAvatar(); break;
        case 2: _t->updateReadyItem((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->updatePhase(); break;
        case 4: _t->updatePile((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->refresh(); break;
        case 6: _t->hideEmotion(); break;
        case 7: _t->hideSkillName(); break;
        case 8: _t->setDrankState(); break;
        case 9: _t->setActionState(); break;
        case 10: _t->updateRoleComboboxPos(); break;
        case 11: _t->killPlayer(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Photo::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Photo::staticMetaObject = {
    { &Pixmap::staticMetaObject, qt_meta_stringdata_Photo,
      qt_meta_data_Photo, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Photo::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Photo::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Photo::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Photo))
        return static_cast<void*>(const_cast< Photo*>(this));
    return Pixmap::qt_metacast(_clname);
}

int Photo::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Pixmap::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
