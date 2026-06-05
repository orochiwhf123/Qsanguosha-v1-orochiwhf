/****************************************************************************
** Meta object code from reading C++ file 'choosegeneraldialog.h'
**
** Created: Wed Dec 4 14:48:26 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/choosegeneraldialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'choosegeneraldialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_OptionButton[] = {

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
      14,   13,   13,   13, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_OptionButton[] = {
    "OptionButton\0\0double_clicked()\0"
};

void OptionButton::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        OptionButton *_t = static_cast<OptionButton *>(_o);
        switch (_id) {
        case 0: _t->double_clicked(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData OptionButton::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject OptionButton::staticMetaObject = {
    { &QToolButton::staticMetaObject, qt_meta_stringdata_OptionButton,
      qt_meta_data_OptionButton, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &OptionButton::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *OptionButton::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *OptionButton::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_OptionButton))
        return static_cast<void*>(const_cast< OptionButton*>(this));
    return QToolButton::qt_metacast(_clname);
}

int OptionButton::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QToolButton::qt_metacall(_c, _id, _a);
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
void OptionButton::double_clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
static const uint qt_meta_data_ChooseGeneralDialog[] = {

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
      21,   20,   20,   20, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_ChooseGeneralDialog[] = {
    "ChooseGeneralDialog\0\0freeChoose()\0"
};

void ChooseGeneralDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        ChooseGeneralDialog *_t = static_cast<ChooseGeneralDialog *>(_o);
        switch (_id) {
        case 0: _t->freeChoose(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ChooseGeneralDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ChooseGeneralDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_ChooseGeneralDialog,
      qt_meta_data_ChooseGeneralDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ChooseGeneralDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ChooseGeneralDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ChooseGeneralDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ChooseGeneralDialog))
        return static_cast<void*>(const_cast< ChooseGeneralDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int ChooseGeneralDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
    return _id;
}
static const uint qt_meta_data_FreeChooseDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      23,   18,   17,   17, 0x05,
      60,   47,   17,   17, 0x05,

 // slots: signature, parameters, type, tag, flags
      89,   17,   17,   17, 0x08,
     112,  105,   17,   17, 0x08,
     149,   18,   17,   17, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_FreeChooseDialog[] = {
    "FreeChooseDialog\0\0name\0general_chosen(QString)\0"
    "first,second\0pair_chosen(QString,QString)\0"
    "chooseGeneral()\0button\0"
    "uncheckExtraButton(QAbstractButton*)\0"
    "onGeneralInput(QString)\0"
};

void FreeChooseDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        FreeChooseDialog *_t = static_cast<FreeChooseDialog *>(_o);
        switch (_id) {
        case 0: _t->general_chosen((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->pair_chosen((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 2: _t->chooseGeneral(); break;
        case 3: _t->uncheckExtraButton((*reinterpret_cast< QAbstractButton*(*)>(_a[1]))); break;
        case 4: _t->onGeneralInput((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData FreeChooseDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FreeChooseDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_FreeChooseDialog,
      qt_meta_data_FreeChooseDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FreeChooseDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FreeChooseDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FreeChooseDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FreeChooseDialog))
        return static_cast<void*>(const_cast< FreeChooseDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int FreeChooseDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
void FreeChooseDialog::general_chosen(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void FreeChooseDialog::pair_chosen(const QString & _t1, const QString & _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_END_MOC_NAMESPACE
