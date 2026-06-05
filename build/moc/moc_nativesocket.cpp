/****************************************************************************
** Meta object code from reading C++ file 'nativesocket.h'
**
** Created: Wed Dec 4 14:50:55 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/util/nativesocket.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'nativesocket.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_NativeServerSocket[] = {

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
      20,   19,   19,   19, 0x08,
      43,   19,   19,   19, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_NativeServerSocket[] = {
    "NativeServerSocket\0\0processNewConnection()\0"
    "processNewDatagram()\0"
};

void NativeServerSocket::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        NativeServerSocket *_t = static_cast<NativeServerSocket *>(_o);
        switch (_id) {
        case 0: _t->processNewConnection(); break;
        case 1: _t->processNewDatagram(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData NativeServerSocket::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject NativeServerSocket::staticMetaObject = {
    { &ServerSocket::staticMetaObject, qt_meta_stringdata_NativeServerSocket,
      qt_meta_data_NativeServerSocket, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &NativeServerSocket::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *NativeServerSocket::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *NativeServerSocket::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_NativeServerSocket))
        return static_cast<void*>(const_cast< NativeServerSocket*>(this));
    return ServerSocket::qt_metacast(_clname);
}

int NativeServerSocket::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = ServerSocket::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
static const uint qt_meta_data_NativeClientSocket[] = {

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
      20,   19,   19,   19, 0x08,
      46,   33,   19,   19, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_NativeClientSocket[] = {
    "NativeClientSocket\0\0getMessage()\0"
    "socket_error\0raiseError(QAbstractSocket::SocketError)\0"
};

void NativeClientSocket::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        NativeClientSocket *_t = static_cast<NativeClientSocket *>(_o);
        switch (_id) {
        case 0: _t->getMessage(); break;
        case 1: _t->raiseError((*reinterpret_cast< QAbstractSocket::SocketError(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData NativeClientSocket::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject NativeClientSocket::staticMetaObject = {
    { &ClientSocket::staticMetaObject, qt_meta_stringdata_NativeClientSocket,
      qt_meta_data_NativeClientSocket, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &NativeClientSocket::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *NativeClientSocket::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *NativeClientSocket::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_NativeClientSocket))
        return static_cast<void*>(const_cast< NativeClientSocket*>(this));
    return ClientSocket::qt_metacast(_clname);
}

int NativeClientSocket::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = ClientSocket::qt_metacall(_c, _id, _a);
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
