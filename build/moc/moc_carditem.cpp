/****************************************************************************
** Meta object code from reading C++ file 'carditem.h'
**
** Created: Wed Dec 4 14:50:27 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/ui/carditem.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'carditem.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CardItem[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x05,
      28,    9,    9,    9, 0x05,
      38,    9,    9,    9, 0x05,
      55,    9,    9,    9, 0x05,
      64,    9,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
      75,    9,    9,    9, 0x0a,
      85,    9,    9,    9, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_CardItem[] = {
    "CardItem\0\0toggle_discards()\0clicked()\0"
    "double_clicked()\0thrown()\0released()\0"
    "reduceZ()\0promoteZ()\0"
};

void CardItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CardItem *_t = static_cast<CardItem *>(_o);
        switch (_id) {
        case 0: _t->toggle_discards(); break;
        case 1: _t->clicked(); break;
        case 2: _t->double_clicked(); break;
        case 3: _t->thrown(); break;
        case 4: _t->released(); break;
        case 5: _t->reduceZ(); break;
        case 6: _t->promoteZ(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData CardItem::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CardItem::staticMetaObject = {
    { &Pixmap::staticMetaObject, qt_meta_stringdata_CardItem,
      qt_meta_data_CardItem, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CardItem::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CardItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CardItem::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CardItem))
        return static_cast<void*>(const_cast< CardItem*>(this));
    return Pixmap::qt_metacast(_clname);
}

int CardItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Pixmap::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}

// SIGNAL 0
void CardItem::toggle_discards()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void CardItem::clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void CardItem::double_clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 2, 0);
}

// SIGNAL 3
void CardItem::thrown()
{
    QMetaObject::activate(this, &staticMetaObject, 3, 0);
}

// SIGNAL 4
void CardItem::released()
{
    QMetaObject::activate(this, &staticMetaObject, 4, 0);
}
QT_END_MOC_NAMESPACE
