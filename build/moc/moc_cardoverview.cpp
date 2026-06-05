/****************************************************************************
** Meta object code from reading C++ file 'cardoverview.h'
**
** Created: Wed Dec 4 14:48:24 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/cardoverview.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cardoverview.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CardOverview[] = {

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
      14,   13,   13,   13, 0x08,
      44,   13,   13,   13, 0x08,
      77,   72,   13,   13, 0x08,
     129,   13,   13,   13, 0x08,
     167,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_CardOverview[] = {
    "CardOverview\0\0on_femalePlayButton_clicked()\0"
    "on_malePlayButton_clicked()\0item\0"
    "on_tableWidget_itemDoubleClicked(QTableWidgetItem*)\0"
    "on_tableWidget_itemSelectionChanged()\0"
    "askCard()\0"
};

void CardOverview::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CardOverview *_t = static_cast<CardOverview *>(_o);
        switch (_id) {
        case 0: _t->on_femalePlayButton_clicked(); break;
        case 1: _t->on_malePlayButton_clicked(); break;
        case 2: _t->on_tableWidget_itemDoubleClicked((*reinterpret_cast< QTableWidgetItem*(*)>(_a[1]))); break;
        case 3: _t->on_tableWidget_itemSelectionChanged(); break;
        case 4: _t->askCard(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CardOverview::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CardOverview::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_CardOverview,
      qt_meta_data_CardOverview, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CardOverview::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CardOverview::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CardOverview::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CardOverview))
        return static_cast<void*>(const_cast< CardOverview*>(this));
    return QDialog::qt_metacast(_clname);
}

int CardOverview::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
