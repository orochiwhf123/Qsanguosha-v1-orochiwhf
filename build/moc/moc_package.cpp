/****************************************************************************
** Meta object code from reading C++ file 'package.h'
**
** Created: Wed Dec 4 14:49:03 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/package/package.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'package.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Package[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       1,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
       8, 0x0,    4,   18,

 // enum data: key, value
      13, uint(Package::GeneralPack),
      25, uint(Package::CardPack),
      34, uint(Package::MixedPack),
      44, uint(Package::SpecialPack),

       0        // eod
};

static const char qt_meta_stringdata_Package[] = {
    "Package\0Type\0GeneralPack\0CardPack\0"
    "MixedPack\0SpecialPack\0"
};

void Package::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData Package::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Package::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Package,
      qt_meta_data_Package, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Package::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Package::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Package::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Package))
        return static_cast<void*>(const_cast< Package*>(this));
    return QObject::qt_metacast(_clname);
}

int Package::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
