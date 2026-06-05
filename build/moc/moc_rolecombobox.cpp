/****************************************************************************
** Meta object code from reading C++ file 'rolecombobox.h'
**
** Created: Wed Dec 4 14:50:45 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/ui/rolecombobox.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'rolecombobox.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_RoleComboboxItem[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      18,   17,   17,   17, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_RoleComboboxItem[] = {
    "RoleComboboxItem\0\0clicked()\0"
};

void RoleComboboxItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        RoleComboboxItem *_t = static_cast<RoleComboboxItem *>(_o);
        switch (_id) {
        case 0: _t->clicked(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData RoleComboboxItem::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject RoleComboboxItem::staticMetaObject = {
    { &Pixmap::staticMetaObject, qt_meta_stringdata_RoleComboboxItem,
      qt_meta_data_RoleComboboxItem, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RoleComboboxItem::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RoleComboboxItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RoleComboboxItem::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RoleComboboxItem))
        return static_cast<void*>(const_cast< RoleComboboxItem*>(this));
    return Pixmap::qt_metacast(_clname);
}

int RoleComboboxItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Pixmap::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void RoleComboboxItem::clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
static const uint qt_meta_data_RoleCombobox[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      19,   14,   13,   13, 0x0a,
      32,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_RoleCombobox[] = {
    "RoleCombobox\0\0role\0fix(QString)\0"
    "onItemClicked()\0"
};

void RoleCombobox::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        RoleCombobox *_t = static_cast<RoleCombobox *>(_o);
        switch (_id) {
        case 0: _t->fix((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->onItemClicked(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData RoleCombobox::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject RoleCombobox::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_RoleCombobox,
      qt_meta_data_RoleCombobox, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &RoleCombobox::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *RoleCombobox::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *RoleCombobox::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_RoleCombobox))
        return static_cast<void*>(const_cast< RoleCombobox*>(this));
    return QObject::qt_metacast(_clname);
}

int RoleCombobox::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
