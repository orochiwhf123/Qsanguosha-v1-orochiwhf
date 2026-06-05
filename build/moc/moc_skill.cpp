/****************************************************************************
** Meta object code from reading C++ file 'skill.h'
**
** Created: Wed Dec 4 14:48:19 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/core/skill.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'skill.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Skill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       2,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
       6, 0x0,    5,   22,
      16, 0x0,    2,   32,

 // enum data: key, value
      25, uint(Skill::Frequent),
      34, uint(Skill::NotFrequent),
      46, uint(Skill::Compulsory),
      57, uint(Skill::Limited),
      65, uint(Skill::Wake),
      70, uint(Skill::Left),
      75, uint(Skill::Right),

       0        // eod
};

static const char qt_meta_stringdata_Skill[] = {
    "Skill\0Frequency\0Location\0Frequent\0"
    "NotFrequent\0Compulsory\0Limited\0Wake\0"
    "Left\0Right\0"
};

void Skill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData Skill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject Skill::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Skill,
      qt_meta_data_Skill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Skill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Skill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Skill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Skill))
        return static_cast<void*>(const_cast< Skill*>(this));
    return QObject::qt_metacast(_clname);
}

int Skill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ViewAsSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ViewAsSkill[] = {
    "ViewAsSkill\0"
};

void ViewAsSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ViewAsSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ViewAsSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_ViewAsSkill,
      qt_meta_data_ViewAsSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ViewAsSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ViewAsSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ViewAsSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ViewAsSkill))
        return static_cast<void*>(const_cast< ViewAsSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int ViewAsSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ZeroCardViewAsSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ZeroCardViewAsSkill[] = {
    "ZeroCardViewAsSkill\0"
};

void ZeroCardViewAsSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ZeroCardViewAsSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ZeroCardViewAsSkill::staticMetaObject = {
    { &ViewAsSkill::staticMetaObject, qt_meta_stringdata_ZeroCardViewAsSkill,
      qt_meta_data_ZeroCardViewAsSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ZeroCardViewAsSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ZeroCardViewAsSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ZeroCardViewAsSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ZeroCardViewAsSkill))
        return static_cast<void*>(const_cast< ZeroCardViewAsSkill*>(this));
    return ViewAsSkill::qt_metacast(_clname);
}

int ZeroCardViewAsSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = ViewAsSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_OneCardViewAsSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_OneCardViewAsSkill[] = {
    "OneCardViewAsSkill\0"
};

void OneCardViewAsSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData OneCardViewAsSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject OneCardViewAsSkill::staticMetaObject = {
    { &ViewAsSkill::staticMetaObject, qt_meta_stringdata_OneCardViewAsSkill,
      qt_meta_data_OneCardViewAsSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &OneCardViewAsSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *OneCardViewAsSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *OneCardViewAsSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_OneCardViewAsSkill))
        return static_cast<void*>(const_cast< OneCardViewAsSkill*>(this));
    return ViewAsSkill::qt_metacast(_clname);
}

int OneCardViewAsSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = ViewAsSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_FilterSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_FilterSkill[] = {
    "FilterSkill\0"
};

void FilterSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData FilterSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject FilterSkill::staticMetaObject = {
    { &OneCardViewAsSkill::staticMetaObject, qt_meta_stringdata_FilterSkill,
      qt_meta_data_FilterSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &FilterSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *FilterSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *FilterSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_FilterSkill))
        return static_cast<void*>(const_cast< FilterSkill*>(this));
    return OneCardViewAsSkill::qt_metacast(_clname);
}

int FilterSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = OneCardViewAsSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TriggerSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_TriggerSkill[] = {
    "TriggerSkill\0"
};

void TriggerSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData TriggerSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TriggerSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_TriggerSkill,
      qt_meta_data_TriggerSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TriggerSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TriggerSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TriggerSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TriggerSkill))
        return static_cast<void*>(const_cast< TriggerSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int TriggerSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ScenarioRule[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ScenarioRule[] = {
    "ScenarioRule\0"
};

void ScenarioRule::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ScenarioRule::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ScenarioRule::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_ScenarioRule,
      qt_meta_data_ScenarioRule, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ScenarioRule::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ScenarioRule::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ScenarioRule::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ScenarioRule))
        return static_cast<void*>(const_cast< ScenarioRule*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int ScenarioRule::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MasochismSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_MasochismSkill[] = {
    "MasochismSkill\0"
};

void MasochismSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData MasochismSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MasochismSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_MasochismSkill,
      qt_meta_data_MasochismSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MasochismSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MasochismSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MasochismSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MasochismSkill))
        return static_cast<void*>(const_cast< MasochismSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int MasochismSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_PhaseChangeSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_PhaseChangeSkill[] = {
    "PhaseChangeSkill\0"
};

void PhaseChangeSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData PhaseChangeSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject PhaseChangeSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_PhaseChangeSkill,
      qt_meta_data_PhaseChangeSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PhaseChangeSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PhaseChangeSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PhaseChangeSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PhaseChangeSkill))
        return static_cast<void*>(const_cast< PhaseChangeSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int PhaseChangeSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DrawCardsSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_DrawCardsSkill[] = {
    "DrawCardsSkill\0"
};

void DrawCardsSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData DrawCardsSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DrawCardsSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_DrawCardsSkill,
      qt_meta_data_DrawCardsSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DrawCardsSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DrawCardsSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DrawCardsSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DrawCardsSkill))
        return static_cast<void*>(const_cast< DrawCardsSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int DrawCardsSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SlashBuffSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_SlashBuffSkill[] = {
    "SlashBuffSkill\0"
};

void SlashBuffSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SlashBuffSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SlashBuffSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_SlashBuffSkill,
      qt_meta_data_SlashBuffSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SlashBuffSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SlashBuffSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SlashBuffSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SlashBuffSkill))
        return static_cast<void*>(const_cast< SlashBuffSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int SlashBuffSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_GameStartSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_GameStartSkill[] = {
    "GameStartSkill\0"
};

void GameStartSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData GameStartSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GameStartSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_GameStartSkill,
      qt_meta_data_GameStartSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GameStartSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GameStartSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GameStartSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GameStartSkill))
        return static_cast<void*>(const_cast< GameStartSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int GameStartSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SPConvertSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_SPConvertSkill[] = {
    "SPConvertSkill\0"
};

void SPConvertSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SPConvertSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SPConvertSkill::staticMetaObject = {
    { &GameStartSkill::staticMetaObject, qt_meta_stringdata_SPConvertSkill,
      qt_meta_data_SPConvertSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SPConvertSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SPConvertSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SPConvertSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SPConvertSkill))
        return static_cast<void*>(const_cast< SPConvertSkill*>(this));
    return GameStartSkill::qt_metacast(_clname);
}

int SPConvertSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = GameStartSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ProhibitSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ProhibitSkill[] = {
    "ProhibitSkill\0"
};

void ProhibitSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ProhibitSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ProhibitSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_ProhibitSkill,
      qt_meta_data_ProhibitSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ProhibitSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ProhibitSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ProhibitSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ProhibitSkill))
        return static_cast<void*>(const_cast< ProhibitSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int ProhibitSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_DistanceSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_DistanceSkill[] = {
    "DistanceSkill\0"
};

void DistanceSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData DistanceSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject DistanceSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_DistanceSkill,
      qt_meta_data_DistanceSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &DistanceSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *DistanceSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *DistanceSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_DistanceSkill))
        return static_cast<void*>(const_cast< DistanceSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int DistanceSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MaxCardsSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_MaxCardsSkill[] = {
    "MaxCardsSkill\0"
};

void MaxCardsSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData MaxCardsSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MaxCardsSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_MaxCardsSkill,
      qt_meta_data_MaxCardsSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MaxCardsSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MaxCardsSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MaxCardsSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MaxCardsSkill))
        return static_cast<void*>(const_cast< MaxCardsSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int MaxCardsSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_SlashSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       1,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
      11, 0x0,    3,   18,

 // enum data: key, value
      16, uint(SlashSkill::Residue),
      24, uint(SlashSkill::AttackRange),
      36, uint(SlashSkill::ExtraGoals),

       0        // eod
};

static const char qt_meta_stringdata_SlashSkill[] = {
    "SlashSkill\0Type\0Residue\0AttackRange\0"
    "ExtraGoals\0"
};

void SlashSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData SlashSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SlashSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_SlashSkill,
      qt_meta_data_SlashSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SlashSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SlashSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SlashSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SlashSkill))
        return static_cast<void*>(const_cast< SlashSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int SlashSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_TargetModSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       1,   14, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // enums: name, flags, count, data
      15, 0x0,    3,   18,

 // enum data: key, value
      23, uint(TargetModSkill::Residue),
      31, uint(TargetModSkill::DistanceLimit),
      45, uint(TargetModSkill::ExtraTarget),

       0        // eod
};

static const char qt_meta_stringdata_TargetModSkill[] = {
    "TargetModSkill\0ModType\0Residue\0"
    "DistanceLimit\0ExtraTarget\0"
};

void TargetModSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData TargetModSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject TargetModSkill::staticMetaObject = {
    { &Skill::staticMetaObject, qt_meta_stringdata_TargetModSkill,
      qt_meta_data_TargetModSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &TargetModSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *TargetModSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *TargetModSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_TargetModSkill))
        return static_cast<void*>(const_cast< TargetModSkill*>(this));
    return Skill::qt_metacast(_clname);
}

int TargetModSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = Skill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_WeaponSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_WeaponSkill[] = {
    "WeaponSkill\0"
};

void WeaponSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData WeaponSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject WeaponSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_WeaponSkill,
      qt_meta_data_WeaponSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &WeaponSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *WeaponSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *WeaponSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_WeaponSkill))
        return static_cast<void*>(const_cast< WeaponSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int WeaponSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_ArmorSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_ArmorSkill[] = {
    "ArmorSkill\0"
};

void ArmorSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData ArmorSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject ArmorSkill::staticMetaObject = {
    { &TriggerSkill::staticMetaObject, qt_meta_stringdata_ArmorSkill,
      qt_meta_data_ArmorSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &ArmorSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *ArmorSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *ArmorSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_ArmorSkill))
        return static_cast<void*>(const_cast< ArmorSkill*>(this));
    return TriggerSkill::qt_metacast(_clname);
}

int ArmorSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = TriggerSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MarkAssignSkill[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

static const char qt_meta_stringdata_MarkAssignSkill[] = {
    "MarkAssignSkill\0"
};

void MarkAssignSkill::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData MarkAssignSkill::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MarkAssignSkill::staticMetaObject = {
    { &GameStartSkill::staticMetaObject, qt_meta_stringdata_MarkAssignSkill,
      qt_meta_data_MarkAssignSkill, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MarkAssignSkill::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MarkAssignSkill::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MarkAssignSkill::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MarkAssignSkill))
        return static_cast<void*>(const_cast< MarkAssignSkill*>(this));
    return GameStartSkill::qt_metacast(_clname);
}

int MarkAssignSkill::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = GameStartSkill::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
QT_END_MOC_NAMESPACE
