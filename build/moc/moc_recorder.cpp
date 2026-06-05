/****************************************************************************
** Meta object code from reading C++ file 'recorder.h'
**
** Created: Wed Dec 4 14:50:56 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/util/recorder.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'recorder.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Recorder[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      15,   10,    9,    9, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_Recorder[] = {
    "Recorder\0\0line\0record(char*)\0"
};

void Recorder::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Recorder *_t = static_cast<Recorder *>(_o);
        switch (_id) {
        case 0: _t->record((*reinterpret_cast< char*(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Recorder::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Recorder::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Recorder,
      qt_meta_data_Recorder, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Recorder::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Recorder::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Recorder::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Recorder))
        return static_cast<void*>(const_cast< Recorder*>(this));
    return QObject::qt_metacast(_clname);
}

int Recorder::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}
static const uint qt_meta_data_Replayer[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: signature, parameters, type, tag, flags
      14,   10,    9,    9, 0x05,
      43,   38,    9,    9, 0x05,
      62,   56,    9,    9, 0x05,

 // slots: signature, parameters, type, tag, flags
      83,    9,    9,    9, 0x0a,
      93,    9,    9,    9, 0x0a,
     102,    9,    9,    9, 0x0a,
     112,    9,    9,    9, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_Replayer[] = {
    "Replayer\0\0cmd\0command_parsed(QString)\0"
    "secs\0elasped(int)\0speed\0speed_changed(qreal)\0"
    "uniform()\0toggle()\0speedUp()\0slowDown()\0"
};

void Replayer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        Replayer *_t = static_cast<Replayer *>(_o);
        switch (_id) {
        case 0: _t->command_parsed((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->elasped((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->speed_changed((*reinterpret_cast< qreal(*)>(_a[1]))); break;
        case 3: _t->uniform(); break;
        case 4: _t->toggle(); break;
        case 5: _t->speedUp(); break;
        case 6: _t->slowDown(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData Replayer::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Replayer::staticMetaObject = {
    { &QThread::staticMetaObject, qt_meta_stringdata_Replayer,
      qt_meta_data_Replayer, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Replayer::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Replayer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Replayer::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Replayer))
        return static_cast<void*>(const_cast< Replayer*>(this));
    return QThread::qt_metacast(_clname);
}

int Replayer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
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
void Replayer::command_parsed(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Replayer::elasped(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void Replayer::speed_changed(qreal _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_END_MOC_NAMESPACE
