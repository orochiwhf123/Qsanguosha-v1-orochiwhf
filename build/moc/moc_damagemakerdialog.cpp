/****************************************************************************
** Meta object code from reading C++ file 'damagemakerdialog.h'
**
** Created: Wed Dec 4 14:51:01 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/damagemakerdialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'damagemakerdialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_DamageMakerOperationsModel[] = {

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

static const char qt_meta_stringdata_DamageMakerOperationsModel[] = {
    "DamageMakerOperationsModel\0"
};

void DamageMakerOperationsModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData DamageMakerOperationsModel::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DamageMakerOperationsModel::staticMetaObject = {
    { &QAbstractListModel::staticMetaObject, qt_meta_stringdata_DamageMakerOperationsModel,
      qt_meta_data_DamageMakerOperationsModel, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DamageMakerOperationsModel::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DamageMakerOperationsModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DamageMakerOperationsModel::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DamageMakerOperationsModel))
        return static_cast<void*>(const_cast< DamageMakerOperationsModel*>(this));
    return QAbstractListModel::qt_metacast(_clname);
}

int DamageMakerOperationsModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractListModel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DamageMakerDialog[] = {

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
      19,   18,   18,   18, 0x0a,
      28,   18,   18,   18, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_DamageMakerDialog[] = {
    "DamageMakerDialog\0\0accept()\0disableSource()\0"
};

void DamageMakerDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        DamageMakerDialog *_t = static_cast<DamageMakerDialog *>(_o);
        switch (_id) {
        case 0: _t->accept(); break;
        case 1: _t->disableSource(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData DamageMakerDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DamageMakerDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_DamageMakerDialog,
      qt_meta_data_DamageMakerDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DamageMakerDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DamageMakerDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DamageMakerDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DamageMakerDialog))
        return static_cast<void*>(const_cast< DamageMakerDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int DamageMakerDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
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
