/****************************************************************************
** Meta object code from reading C++ file 'generaloverview.h'
**
** Created: Wed Dec 4 14:48:35 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/generaloverview.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'generaloverview.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_GeneralOverview[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      22,   17,   16,   16, 0x08,
      43,   16,   16,   16, 0x08,
      61,   54,   16,   16, 0x08,
     102,   96,   16,   16, 0x08,
     127,   96,   16,   16, 0x08,
     168,  161,   16,   16, 0x08,
     211,  207,   16,   16, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_GeneralOverview[] = {
    "GeneralOverview\0\0name\0showGeneral(QString)\0"
    "doSearch()\0action\0onPackageActionTriggered(QAction*)\0"
    "index\0onMaxHpIndexChanged(int)\0"
    "onGeneralViewClicked(QModelIndex)\0"
    "button\0onRadioButtonClicked(QAbstractButton*)\0"
    "url\0onEffectLabelClicked(QUrl)\0"
};

void GeneralOverview::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        GeneralOverview *_t = static_cast<GeneralOverview *>(_o);
        switch (_id) {
        case 0: _t->showGeneral((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->doSearch(); break;
        case 2: _t->onPackageActionTriggered((*reinterpret_cast< QAction*(*)>(_a[1]))); break;
        case 3: _t->onMaxHpIndexChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->onGeneralViewClicked((*reinterpret_cast< const QModelIndex(*)>(_a[1]))); break;
        case 5: _t->onRadioButtonClicked((*reinterpret_cast< QAbstractButton*(*)>(_a[1]))); break;
        case 6: _t->onEffectLabelClicked((*reinterpret_cast< const QUrl(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData GeneralOverview::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GeneralOverview::staticMetaObject = {
    { &QWidget::staticMetaObject, qt_meta_stringdata_GeneralOverview,
      qt_meta_data_GeneralOverview, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GeneralOverview::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GeneralOverview::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GeneralOverview::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GeneralOverview))
        return static_cast<void*>(const_cast< GeneralOverview*>(this));
    return QWidget::qt_metacast(_clname);
}

int GeneralOverview::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
