/****************************************************************************
** Meta object code from reading C++ file 'cryptodialog.h'
**
** Created: Wed Dec 4 14:51:07 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/cryptodialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cryptodialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CryptoThread[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      23,   14,   13,   13, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_CryptoThread[] = {
    "CryptoThread\0\0filename\0fileDone(QString)\0"
};

void CryptoThread::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CryptoThread *_t = static_cast<CryptoThread *>(_o);
        switch (_id) {
        case 0: _t->fileDone((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CryptoThread::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CryptoThread::staticMetaObject = {
    { &QThread::staticMetaObject, qt_meta_stringdata_CryptoThread,
      qt_meta_data_CryptoThread, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CryptoThread::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CryptoThread::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CryptoThread::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CryptoThread))
        return static_cast<void*>(const_cast< CryptoThread*>(this));
    return QThread::qt_metacast(_clname);
}

int CryptoThread::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}

// SIGNAL 0
void CryptoThread::fileDone(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
static const uint qt_meta_data_CryptoDialog[] = {

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
      14,   13,   13,   13, 0x08,
      33,   24,   13,   13, 0x08,
      53,   13,   13,   13, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_CryptoDialog[] = {
    "CryptoDialog\0\0encrypt()\0filename\0"
    "onFileDone(QString)\0onCryptDone()\0"
};

void CryptoDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CryptoDialog *_t = static_cast<CryptoDialog *>(_o);
        switch (_id) {
        case 0: _t->encrypt(); break;
        case 1: _t->onFileDone((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->onCryptDone(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CryptoDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CryptoDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_CryptoDialog,
      qt_meta_data_CryptoDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CryptoDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CryptoDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CryptoDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CryptoDialog))
        return static_cast<void*>(const_cast< CryptoDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int CryptoDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
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
