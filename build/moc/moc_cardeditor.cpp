/****************************************************************************
** Meta object code from reading C++ file 'cardeditor.h'
**
** Created: Wed Dec 4 14:48:21 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/cardeditor.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cardeditor.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_BlackEdgeTextItem[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      24,   19,   18,   18, 0x0a,
      46,   41,   18,   18, 0x0a,
      66,   61,   18,   18, 0x0a,
      86,   18,   79,   18, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_BlackEdgeTextItem[] = {
    "BlackEdgeTextItem\0\0text\0setText(QString)\0"
    "font\0setFont(QFont)\0skip\0setSkip(int)\0"
    "QRectF\0boundingRect()\0"
};

void BlackEdgeTextItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        BlackEdgeTextItem *_t = static_cast<BlackEdgeTextItem *>(_o);
        switch (_id) {
        case 0: _t->setText((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->setFont((*reinterpret_cast< const QFont(*)>(_a[1]))); break;
        case 2: _t->setSkip((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: { QRectF _r = _t->boundingRect();
            if (_a[0]) *reinterpret_cast< QRectF*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
}

const QMetaObjectExtraData BlackEdgeTextItem::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject BlackEdgeTextItem::staticMetaObject = {
    { &QGraphicsObject::staticMetaObject, qt_meta_stringdata_BlackEdgeTextItem,
      qt_meta_data_BlackEdgeTextItem, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &BlackEdgeTextItem::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *BlackEdgeTextItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *BlackEdgeTextItem::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_BlackEdgeTextItem))
        return static_cast<void*>(const_cast< BlackEdgeTextItem*>(this));
    return QGraphicsObject::qt_metacast(_clname);
}

int BlackEdgeTextItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}
static const uint qt_meta_data_SkillBox[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      10,    9,    9,    9, 0x0a,
      29,   24,    9,    9, 0x0a,
      54,   24,    9,    9, 0x0a,
      85,   24,    9,    9, 0x0a,
     110,  104,    9,    9, 0x0a,
     136,  126,    9,    9, 0x0a,
     160,    9,    9,    9, 0x0a,
     173,    9,    9,    9, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_SkillBox[] = {
    "SkillBox\0\0removeSkill()\0font\0"
    "setSkillTitleFont(QFont)\0"
    "setSkillDescriptionFont(QFont)\0"
    "setTinyFont(QFont)\0index\0insertSuit(int)\0"
    "bold_text\0insertBoldText(QString)\0"
    "saveConfig()\0loadConfig()\0"
};

void SkillBox::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        SkillBox *_t = static_cast<SkillBox *>(_o);
        switch (_id) {
        case 0: _t->removeSkill(); break;
        case 1: _t->setSkillTitleFont((*reinterpret_cast< const QFont(*)>(_a[1]))); break;
        case 2: _t->setSkillDescriptionFont((*reinterpret_cast< const QFont(*)>(_a[1]))); break;
        case 3: _t->setTinyFont((*reinterpret_cast< const QFont(*)>(_a[1]))); break;
        case 4: _t->insertSuit((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->insertBoldText((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: _t->saveConfig(); break;
        case 7: _t->loadConfig(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData SkillBox::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SkillBox::staticMetaObject = {
    { &QGraphicsObject::staticMetaObject, qt_meta_stringdata_SkillBox,
      qt_meta_data_SkillBox, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SkillBox::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SkillBox::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SkillBox::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SkillBox))
        return static_cast<void*>(const_cast< SkillBox*>(this));
    return QGraphicsObject::qt_metacast(_clname);
}

int SkillBox::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}
static const uint qt_meta_data_CardScene[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      16,   11,   10,   10, 0x05,

 // slots: signature, parameters, type, tag, flags
      45,   39,   10,   10, 0x0a,
      66,   59,   10,   10, 0x0a,
      80,   10,   10,   10, 0x0a,
      96,   10,   10,   10, 0x0a,
     114,   10,   10,   10, 0x0a,
     131,   10,   10,   10, 0x0a,
     150,   10,   10,   10, 0x0a,
     173,  168,   10,   10, 0x0a,
     199,   10,   10,   10, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_CardScene[] = {
    "CardScene\0\0rect\0avatar_snapped(QRectF)\0"
    "ratio\0setRatio(int)\0max_hp\0setMaxHp(int)\0"
    "makeBigAvatar()\0makeSmallAvatar()\0"
    "makeTinyAvatar()\0doneMakingAvatar()\0"
    "hideAvatarRects()\0text\0setAvatarNameBox(QString)\0"
    "resetPhoto()\0"
};

void CardScene::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CardScene *_t = static_cast<CardScene *>(_o);
        switch (_id) {
        case 0: _t->avatar_snapped((*reinterpret_cast< const QRectF(*)>(_a[1]))); break;
        case 1: _t->setRatio((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->setMaxHp((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->makeBigAvatar(); break;
        case 4: _t->makeSmallAvatar(); break;
        case 5: _t->makeTinyAvatar(); break;
        case 6: _t->doneMakingAvatar(); break;
        case 7: _t->hideAvatarRects(); break;
        case 8: _t->setAvatarNameBox((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 9: _t->resetPhoto(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CardScene::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CardScene::staticMetaObject = {
    { &QGraphicsScene::staticMetaObject, qt_meta_stringdata_CardScene,
      qt_meta_data_CardScene, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CardScene::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CardScene::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CardScene::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CardScene))
        return static_cast<void*>(const_cast< CardScene*>(this));
    return QGraphicsScene::qt_metacast(_clname);
}

int CardScene::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGraphicsScene::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    }
    return _id;
}

// SIGNAL 0
void CardScene::avatar_snapped(const QRectF & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
static const uint qt_meta_data_CardEditor[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      12,   11,   11,   11, 0x08,
      27,   11,   11,   11, 0x08,
      36,   11,   11,   11, 0x08,
      48,   11,   11,   11, 0x08,
      65,   60,   11,   11, 0x08,
      94,   89,   11,   11, 0x08,
     113,   11,   11,   11, 0x08,
     124,   11,   11,   11, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_CardEditor[] = {
    "CardEditor\0\0setCardFrame()\0import()\0"
    "saveImage()\0copyPhoto()\0font\0"
    "updateButtonText(QFont)\0rect\0"
    "saveAvatar(QRectF)\0addSkill()\0editSkill()\0"
};

void CardEditor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CardEditor *_t = static_cast<CardEditor *>(_o);
        switch (_id) {
        case 0: _t->setCardFrame(); break;
        case 1: _t->import(); break;
        case 2: _t->saveImage(); break;
        case 3: _t->copyPhoto(); break;
        case 4: _t->updateButtonText((*reinterpret_cast< const QFont(*)>(_a[1]))); break;
        case 5: _t->saveAvatar((*reinterpret_cast< const QRectF(*)>(_a[1]))); break;
        case 6: _t->addSkill(); break;
        case 7: _t->editSkill(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CardEditor::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CardEditor::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_CardEditor,
      qt_meta_data_CardEditor, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CardEditor::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CardEditor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CardEditor::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CardEditor))
        return static_cast<void*>(const_cast< CardEditor*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int CardEditor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
