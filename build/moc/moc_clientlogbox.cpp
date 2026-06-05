/****************************************************************************
** Meta object code from reading C++ file 'clientlogbox.h'
**
** Created: Wed Dec 4 14:50:31 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/ui/clientlogbox.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'clientlogbox.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ClientLogBox[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      22,   14,   13,   13, 0x0a,
      41,   13,   13,   13, 0x0a,
      64,   59,   13,   13, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_ClientLogBox[] = {
    "ClientLogBox\0\0log_str\0appendLog(QString)\0"
    "appendSeparator()\0text\0append(QString)\0"
};

void ClientLogBox::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ClientLogBox *_t = static_cast<ClientLogBox *>(_o);
        switch (_id) {
        case 0: _t->appendLog((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->appendSeparator(); break;
        case 2: _t->append((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ClientLogBox::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ClientLogBox::staticMetaObject = {
    { &QTextEdit::staticMetaObject, qt_meta_stringdata_ClientLogBox,
      qt_meta_data_ClientLogBox, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ClientLogBox::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ClientLogBox::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ClientLogBox::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ClientLogBox))
        return static_cast<void*>(const_cast< ClientLogBox*>(this));
    return QTextEdit::qt_metacast(_clname);
}

int ClientLogBox::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QTextEdit::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
