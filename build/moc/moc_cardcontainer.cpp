/****************************************************************************
** Meta object code from reading C++ file 'cardcontainer.h'
**
** Created: Wed Dec 4 14:50:26 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/ui/cardcontainer.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cardcontainer.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_CloseButton[] = {

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
      13,   12,   12,   12, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_CloseButton[] = {
    "CloseButton\0\0clicked()\0"
};

void CloseButton::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CloseButton *_t = static_cast<CloseButton *>(_o);
        switch (_id) {
        case 0: _t->clicked(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData CloseButton::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CloseButton::staticMetaObject = {
    { &Pixmap::staticMetaObject, qt_meta_stringdata_CloseButton,
      qt_meta_data_CloseButton, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CloseButton::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CloseButton::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CloseButton::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CloseButton))
        return static_cast<void*>(const_cast< CloseButton*>(this));
    return Pixmap::qt_metacast(_clname);
}

int CloseButton::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Pixmap::qt_metacall(_c, _id, _a);
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
void CloseButton::clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
static const uint qt_meta_data_GrabCardItem[] = {

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

static const char qt_meta_stringdata_GrabCardItem[] = {
    "GrabCardItem\0\0grabbed()\0"
};

void GrabCardItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        GrabCardItem *_t = static_cast<GrabCardItem *>(_o);
        switch (_id) {
        case 0: _t->grabbed(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData GrabCardItem::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GrabCardItem::staticMetaObject = {
    { &CardItem::staticMetaObject, qt_meta_stringdata_GrabCardItem,
      qt_meta_data_GrabCardItem, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GrabCardItem::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GrabCardItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GrabCardItem::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GrabCardItem))
        return static_cast<void*>(const_cast< GrabCardItem*>(this));
    return CardItem::qt_metacast(_clname);
}

int GrabCardItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = CardItem::qt_metacall(_c, _id, _a);
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
void GrabCardItem::grabbed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
static const uint qt_meta_data_CardContainer[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      23,   15,   14,   14, 0x05,
      40,   15,   14,   14, 0x05,

 // slots: signature, parameters, type, tag, flags
      69,   60,   14,   14, 0x0a,
      91,   14,   14,   14, 0x0a,
     110,   99,   14,   14, 0x0a,
     128,   14,   14,   14, 0x08,
     139,   14,   14,   14, 0x08,
     152,   14,   14,   14, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_CardContainer[] = {
    "CardContainer\0\0card_id\0item_chosen(int)\0"
    "item_gongxined(int)\0card_ids\0"
    "fillCards(QList<int>)\0clear()\0is_disable\0"
    "freezeCards(bool)\0grabItem()\0chooseItem()\0"
    "gongxinItem()\0"
};

void CardContainer::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CardContainer *_t = static_cast<CardContainer *>(_o);
        switch (_id) {
        case 0: _t->item_chosen((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->item_gongxined((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->fillCards((*reinterpret_cast< const QList<int>(*)>(_a[1]))); break;
        case 3: _t->clear(); break;
        case 4: _t->freezeCards((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->grabItem(); break;
        case 6: _t->chooseItem(); break;
        case 7: _t->gongxinItem(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CardContainer::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CardContainer::staticMetaObject = {
    { &Pixmap::staticMetaObject, qt_meta_stringdata_CardContainer,
      qt_meta_data_CardContainer, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CardContainer::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CardContainer::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CardContainer::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CardContainer))
        return static_cast<void*>(const_cast< CardContainer*>(this));
    return Pixmap::qt_metacast(_clname);
}

int CardContainer::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Pixmap::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}

// SIGNAL 0
void CardContainer::item_chosen(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void CardContainer::item_gongxined(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
static const uint qt_meta_data_GuanxingBox[] = {

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
      30,   13,   12,   12, 0x0a,
      58,   12,   12,   12, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_GuanxingBox[] = {
    "GuanxingBox\0\0card_ids,up_only\0"
    "doGuanxing(QList<int>,bool)\0adjust()\0"
};

void GuanxingBox::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        GuanxingBox *_t = static_cast<GuanxingBox *>(_o);
        switch (_id) {
        case 0: _t->doGuanxing((*reinterpret_cast< const QList<int>(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 1: _t->adjust(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData GuanxingBox::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GuanxingBox::staticMetaObject = {
    { &Pixmap::staticMetaObject, qt_meta_stringdata_GuanxingBox,
      qt_meta_data_GuanxingBox, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GuanxingBox::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GuanxingBox::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GuanxingBox::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GuanxingBox))
        return static_cast<void*>(const_cast< GuanxingBox*>(this));
    return Pixmap::qt_metacast(_clname);
}

int GuanxingBox::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Pixmap::qt_metacall(_c, _id, _a);
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
