/****************************************************************************
** Meta object code from reading C++ file 'halldialog.h'
**
** Created: Wed Dec 4 14:48:37 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/halldialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'halldialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_HallDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      12,   11,   11,   11, 0x08,
      21,   11,   11,   11, 0x08,
      32,   11,   11,   11, 0x08,
      39,   11,   11,   11, 0x08,
      64,   52,   11,   11, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_HallDialog[] = {
    "HallDialog\0\0pageUp()\0pageDown()\0join()\0"
    "createRoom()\0only_nonful\0toggleDisplay(bool)\0"
};

void HallDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        HallDialog *_t = static_cast<HallDialog *>(_o);
        switch (_id) {
        case 0: _t->pageUp(); break;
        case 1: _t->pageDown(); break;
        case 2: _t->join(); break;
        case 3: _t->createRoom(); break;
        case 4: _t->toggleDisplay((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData HallDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject HallDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_HallDialog,
      qt_meta_data_HallDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &HallDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *HallDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *HallDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_HallDialog))
        return static_cast<void*>(const_cast< HallDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int HallDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
