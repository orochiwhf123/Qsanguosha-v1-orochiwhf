/****************************************************************************
** Meta object code from reading C++ file 'server.h'
**
** Created: Wed Dec 4 14:50:20 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/server/server.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'server.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Select3v3GeneralDialog[] = {

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
      24,   23,   23,   23, 0x08,
      42,   23,   23,   23, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_Select3v3GeneralDialog[] = {
    "Select3v3GeneralDialog\0\0save3v3Generals()\0"
    "toggleCheck()\0"
};

void Select3v3GeneralDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Select3v3GeneralDialog *_t = static_cast<Select3v3GeneralDialog *>(_o);
        switch (_id) {
        case 0: _t->save3v3Generals(); break;
        case 1: _t->toggleCheck(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData Select3v3GeneralDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Select3v3GeneralDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_Select3v3GeneralDialog,
      qt_meta_data_Select3v3GeneralDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Select3v3GeneralDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Select3v3GeneralDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Select3v3GeneralDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Select3v3GeneralDialog))
        return static_cast<void*>(const_cast< Select3v3GeneralDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int Select3v3GeneralDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
static const uint qt_meta_data_BanlistDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      20,   15,   14,   14, 0x08,
      40,   15,   14,   14, 0x08,
      76,   63,   14,   14, 0x08,
     101,   14,   14,   14, 0x08,
     118,   14,   14,   14, 0x08,
     132,   14,   14,   14, 0x08,
     149,   14,   14,   14, 0x08,
     156,   14,   14,   14, 0x08,
     171,  166,   14,   14, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_BanlistDialog[] = {
    "BanlistDialog\0\0name\0addGeneral(QString)\0"
    "add2ndGeneral(QString)\0first,second\0"
    "addPair(QString,QString)\0doAdd2ndButton()\0"
    "doAddButton()\0doRemoveButton()\0save()\0"
    "saveAll()\0item\0switchTo(int)\0"
};

void BanlistDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        BanlistDialog *_t = static_cast<BanlistDialog *>(_o);
        switch (_id) {
        case 0: _t->addGeneral((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->add2ndGeneral((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->addPair((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 3: _t->doAdd2ndButton(); break;
        case 4: _t->doAddButton(); break;
        case 5: _t->doRemoveButton(); break;
        case 6: _t->save(); break;
        case 7: _t->saveAll(); break;
        case 8: _t->switchTo((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData BanlistDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject BanlistDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_BanlistDialog,
      qt_meta_data_BanlistDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &BanlistDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *BanlistDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *BanlistDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_BanlistDialog))
        return static_cast<void*>(const_cast< BanlistDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int BanlistDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    return _id;
}
static const uint qt_meta_data_ServerDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      14,   13,   13,   13, 0x08,
      34,   13,   13,   13, 0x08,
      55,   13,   13,   13, 0x08,
      76,   13,   13,   13, 0x08,
     106,  100,   13,   13, 0x08,
     140,   13,   13,   13, 0x08,
     160,   13,   13,   13, 0x08,
     184,  177,   13,   13, 0x08,
     233,  225,   13,   13, 0x08,
     266,  259,   13,   13, 0x08,
     280,   13,   13,   13, 0x08,
     297,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ServerDialog[] = {
    "ServerDialog\0\0onOkButtonClicked()\0"
    "onSerButtonClicked()\0onPCCButtonClicked()\0"
    "onDetectButtonClicked()\0reply\0"
    "onNetworkReplyGot(QNetworkReply*)\0"
    "select3v3Generals()\0edit1v1Banlist()\0"
    "button\0updateButtonEnablility(QAbstractButton*)\0"
    "toggled\0updateCheckBoxState(bool)\0"
    "enable\0doCheat(bool)\0doCustomAssign()\0"
    "setMiniCheckBox()\0"
};

void ServerDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ServerDialog *_t = static_cast<ServerDialog *>(_o);
        switch (_id) {
        case 0: _t->onOkButtonClicked(); break;
        case 1: _t->onSerButtonClicked(); break;
        case 2: _t->onPCCButtonClicked(); break;
        case 3: _t->onDetectButtonClicked(); break;
        case 4: _t->onNetworkReplyGot((*reinterpret_cast< QNetworkReply*(*)>(_a[1]))); break;
        case 5: _t->select3v3Generals(); break;
        case 6: _t->edit1v1Banlist(); break;
        case 7: _t->updateButtonEnablility((*reinterpret_cast< QAbstractButton*(*)>(_a[1]))); break;
        case 8: _t->updateCheckBoxState((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 9: _t->doCheat((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 10: _t->doCustomAssign(); break;
        case 11: _t->setMiniCheckBox(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData ServerDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ServerDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_ServerDialog,
      qt_meta_data_ServerDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ServerDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ServerDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ServerDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ServerDialog))
        return static_cast<void*>(const_cast< ServerDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int ServerDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    }
    return _id;
}
static const uint qt_meta_data_Server[] = {

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
       8,    7,    7,    7, 0x05,

 // slots: signature, parameters, type, tag, flags
      39,   32,    7,    7, 0x08,
      83,   75,    7,    7, 0x08,
     105,    7,    7,    7, 0x08,
     115,    7,    7,    7, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_Server[] = {
    "Server\0\0server_message(QString)\0socket\0"
    "processNewConnection(ClientSocket*)\0"
    "request\0processRequest(char*)\0cleanup()\0"
    "gameOver()\0"
};

void Server::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Server *_t = static_cast<Server *>(_o);
        switch (_id) {
        case 0: _t->server_message((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->processNewConnection((*reinterpret_cast< ClientSocket*(*)>(_a[1]))); break;
        case 2: _t->processRequest((*reinterpret_cast< char*(*)>(_a[1]))); break;
        case 3: _t->cleanup(); break;
        case 4: _t->gameOver(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Server::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Server::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Server,
      qt_meta_data_Server, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Server::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Server::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Server::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Server))
        return static_cast<void*>(const_cast< Server*>(this));
    return QObject::qt_metacast(_clname);
}

int Server::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
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
void Server::server_message(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
