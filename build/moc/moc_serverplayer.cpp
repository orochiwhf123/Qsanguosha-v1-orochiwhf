/****************************************************************************
** Meta object code from reading C++ file 'serverplayer.h'
**
** Created: Wed Dec 4 14:50:22 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/server/serverplayer.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'serverplayer.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_ServerPlayer[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       1,   39, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x05,
      37,   29,   13,   13, 0x05,
      66,   58,   13,   13, 0x05,

 // slots: signature, parameters, type, tag, flags
      88,   58,   13,   13, 0x08,
     106,   58,   13,   13, 0x08,

 // properties: name, type, flags
     135,  127, 0x0a095001,

       0        // eod
};

static const char qt_meta_stringdata_ServerPlayer[] = {
    "ServerPlayer\0\0disconnected()\0request\0"
    "request_got(QString)\0message\0"
    "message_cast(QString)\0getMessage(char*)\0"
    "castMessage(QString)\0QString\0ip\0"
};

void ServerPlayer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ServerPlayer *_t = static_cast<ServerPlayer *>(_o);
        switch (_id) {
        case 0: _t->disconnected(); break;
        case 1: _t->request_got((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->message_cast((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->getMessage((*reinterpret_cast< char*(*)>(_a[1]))); break;
        case 4: _t->castMessage((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ServerPlayer::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ServerPlayer::staticMetaObject = {
    { &Player::staticMetaObject, qt_meta_stringdata_ServerPlayer,
      qt_meta_data_ServerPlayer, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ServerPlayer::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ServerPlayer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ServerPlayer::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ServerPlayer))
        return static_cast<void*>(const_cast< ServerPlayer*>(this));
    return Player::qt_metacast(_clname);
}

int ServerPlayer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Player::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = getIp(); break;
        }
        _id -= 1;
    } else if (_c == QMetaObject::WriteProperty) {
        _id -= 1;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ServerPlayer::disconnected()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void ServerPlayer::request_got(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void ServerPlayer::message_cast(const QString & _t1)const
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(const_cast< ServerPlayer *>(this), &staticMetaObject, 2, _a);
}
QT_END_MOC_NAMESPACE
