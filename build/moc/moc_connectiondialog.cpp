/****************************************************************************
** Meta object code from reading C++ file 'connectiondialog.h'
**
** Created: Wed Dec 4 14:48:29 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/connectiondialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'connectiondialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ConnectionDialog[] = {

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
      18,   17,   17,   17, 0x08,
      47,   17,   17,   17, 0x08,
      84,   79,   17,   17, 0x08,
     134,   17,   17,   17, 0x08,
     166,   17,   17,   17, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ConnectionDialog[] = {
    "ConnectionDialog\0\0on_detectLANButton_clicked()\0"
    "on_clearHistoryButton_clicked()\0item\0"
    "on_avatarList_itemDoubleClicked(QListWidgetItem*)\0"
    "on_changeAvatarButton_clicked()\0"
    "on_connectButton_clicked()\0"
};

void ConnectionDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ConnectionDialog *_t = static_cast<ConnectionDialog *>(_o);
        switch (_id) {
        case 0: _t->on_detectLANButton_clicked(); break;
        case 1: _t->on_clearHistoryButton_clicked(); break;
        case 2: _t->on_avatarList_itemDoubleClicked((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 3: _t->on_changeAvatarButton_clicked(); break;
        case 4: _t->on_connectButton_clicked(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ConnectionDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ConnectionDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_ConnectionDialog,
      qt_meta_data_ConnectionDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ConnectionDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ConnectionDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ConnectionDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ConnectionDialog))
        return static_cast<void*>(const_cast< ConnectionDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int ConnectionDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
static const uint qt_meta_data_UdpDetectorDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      27,   19,   18,   18, 0x05,

 // slots: signature, parameters, type, tag, flags
      51,   18,   18,   18, 0x08,
      68,   18,   18,   18, 0x08,
      89,   84,   18,   18, 0x08,
     141,  121,   18,   18, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_UdpDetectorDialog[] = {
    "UdpDetectorDialog\0\0address\0"
    "address_chosen(QString)\0startDetection()\0"
    "stopDetection()\0item\0"
    "chooseAddress(QListWidgetItem*)\0"
    "server_name,address\0"
    "addServerAddress(QString,QString)\0"
};

void UdpDetectorDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        UdpDetectorDialog *_t = static_cast<UdpDetectorDialog *>(_o);
        switch (_id) {
        case 0: _t->address_chosen((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->startDetection(); break;
        case 2: _t->stopDetection(); break;
        case 3: _t->chooseAddress((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 4: _t->addServerAddress((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData UdpDetectorDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject UdpDetectorDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_UdpDetectorDialog,
      qt_meta_data_UdpDetectorDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &UdpDetectorDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *UdpDetectorDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *UdpDetectorDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_UdpDetectorDialog))
        return static_cast<void*>(const_cast< UdpDetectorDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int UdpDetectorDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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

// SIGNAL 0
void UdpDetectorDialog::address_chosen(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
