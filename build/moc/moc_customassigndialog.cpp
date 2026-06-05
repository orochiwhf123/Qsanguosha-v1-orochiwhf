/****************************************************************************
** Meta object code from reading C++ file 'customassigndialog.h'
**
** Created: Wed Dec 4 14:48:31 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/customassigndialog.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'customassigndialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_LabelButton[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      13,   12,   12,   12, 0x05,
      30,   12,   12,   12, 0x05,

       0        // eod
};

static const char qt_meta_stringdata_LabelButton[] = {
    "LabelButton\0\0double_clicked()\0clicked()\0"
};

void LabelButton::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        LabelButton *_t = static_cast<LabelButton *>(_o);
        switch (_id) {
        case 0: _t->double_clicked(); break;
        case 1: _t->clicked(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData LabelButton::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject LabelButton::staticMetaObject = {
    { &QLabel::staticMetaObject, qt_meta_stringdata_LabelButton,
      qt_meta_data_LabelButton, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &LabelButton::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *LabelButton::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *LabelButton::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_LabelButton))
        return static_cast<void*>(const_cast< LabelButton*>(this));
    return QLabel::qt_metacast(_clname);
}

int LabelButton::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QLabel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}

// SIGNAL 0
void LabelButton::double_clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void LabelButton::clicked()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
static const uint qt_meta_data_CustomAssignDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      51,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      28,   20,   19,   19, 0x05,
      44,   19,   19,   19, 0x05,

 // slots: signature, parameters, type, tag, flags
      69,   63,   19,   19, 0x08,
      89,   85,   19,   19, 0x08,
     107,   19,   19,   19, 0x08,
     129,  125,   19,   19, 0x08,
     149,   19,   19,   19, 0x28,
     171,  166,   19,   19, 0x08,
     197,  166,   19,   19, 0x08,
     233,  225,   19,   19, 0x08,
     254,   19,   19,   19, 0x28,
     285,  271,   19,   19, 0x08,
     319,  225,   19,   19, 0x08,
     336,  225,   19,   19, 0x08,
     354,  225,   19,   19, 0x08,
     374,  225,   19,   19, 0x08,
     395,   19,   19,   19, 0x08,
     411,  225,   19,   19, 0x08,
     436,  225,   19,   19, 0x08,
     467,  464,   19,   19, 0x08,
     490,  484,   19,   19, 0x08,
     519,  510,   19,   19, 0x08,
     549,  543,   19,   19, 0x08,
     569,   63,   19,   19, 0x08,
     589,  225,   19,   19, 0x08,
     606,  225,   19,   19, 0x08,
     635,   19,   19,   19, 0x08,
     655,  225,   19,   19, 0x08,
     682,   19,   19,   19, 0x08,
     700,   19,   19,   19, 0x08,
     717,   19,   19,   19, 0x08,
     735,   19,   19,   19, 0x08,
     752,   19,   19,   19, 0x08,
     770,   19,   19,   19, 0x08,
     789,   19,   19,   19, 0x08,
     809,   19,   19,   19, 0x08,
     828,   19,   19,   19, 0x08,
     848,   19,   19,   19, 0x08,
     867,   19,   19,   19, 0x08,
     883,   19,   19,   19, 0x08,
     902,  225,   19,   19, 0x08,
     927,  225,   19,   19, 0x08,
     960,  952,   19,   19, 0x08,
    1007,   19,   19,   19, 0x08,
    1024, 1019, 1014,   19, 0x08,
    1038,   19, 1014,   19, 0x28,
    1058, 1045,   19,   19, 0x0a,
    1084,   20,   19,   19, 0x0a,
    1102,   20,   19,   19, 0x0a,
    1119,   20,   19,   19, 0x0a,
    1137,   20,   19,   19, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_CustomAssignDialog[] = {
    "CustomAssignDialog\0\0card_id\0card_addin(int)\0"
    "scenario_changed()\0index\0updateRole(int)\0"
    "num\0updateNumber(int)\0updateListItems()\0"
    "row\0updatePileInfo(int)\0updatePileInfo()\0"
    "name\0updatePlayerInfo(QString)\0"
    "updatePlayerHpInfo(QString)\0toggled\0"
    "updateAllRoles(bool)\0updateAllRoles()\0"
    "update_skills\0updatePlayerExSkills(QStringList)\0"
    "freeChoose(bool)\0freeChoose2(bool)\0"
    "doPlayerTurns(bool)\0doPlayerChains(bool)\0"
    "doSkillSelect()\0setPlayerHpEnabled(bool)\0"
    "setPlayerMaxHpEnabled(bool)\0hp\0"
    "getPlayerHp(int)\0maxhp\0getPlayerMaxHp(int)\0"
    "draw_num\0setPlayerStartDraw(int)\0value\0"
    "setPlayerMarks(int)\0getPlayerMarks(int)\0"
    "setStarter(bool)\0setMoveButtonAvaliable(bool)\0"
    "setNationality(int)\0setNationalityEnable(bool)\0"
    "removeEquipCard()\0removeHandCard()\0"
    "removeJudgeCard()\0removePileCard()\0"
    "doGeneralAssign()\0doGeneralAssign2()\0"
    "doEquipCardAssign()\0doHandCardAssign()\0"
    "doJudgeCardAssign()\0doPileCardAssign()\0"
    "clearGeneral2()\0exchangeListItem()\0"
    "checkSingleTurnBox(bool)\0"
    "checkBeforeNextBox(bool)\0current\0"
    "on_list_itemSelectionChanged(QListWidgetItem*)\0"
    "load()\0bool\0path\0save(QString)\0save()\0"
    "general_name\0getChosenGeneral(QString)\0"
    "getEquipCard(int)\0getHandCard(int)\0"
    "getJudgeCard(int)\0getPileCard(int)\0"
};

void CustomAssignDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CustomAssignDialog *_t = static_cast<CustomAssignDialog *>(_o);
        switch (_id) {
        case 0: _t->card_addin((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->scenario_changed(); break;
        case 2: _t->updateRole((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 3: _t->updateNumber((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->updateListItems(); break;
        case 5: _t->updatePileInfo((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->updatePileInfo(); break;
        case 7: _t->updatePlayerInfo((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: _t->updatePlayerHpInfo((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 9: _t->updateAllRoles((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 10: _t->updateAllRoles(); break;
        case 11: _t->updatePlayerExSkills((*reinterpret_cast< QStringList(*)>(_a[1]))); break;
        case 12: _t->freeChoose((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 13: _t->freeChoose2((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 14: _t->doPlayerTurns((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 15: _t->doPlayerChains((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 16: _t->doSkillSelect(); break;
        case 17: _t->setPlayerHpEnabled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 18: _t->setPlayerMaxHpEnabled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 19: _t->getPlayerHp((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 20: _t->getPlayerMaxHp((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 21: _t->setPlayerStartDraw((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 22: _t->setPlayerMarks((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 23: _t->getPlayerMarks((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 24: _t->setStarter((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 25: _t->setMoveButtonAvaliable((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 26: _t->setNationality((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 27: _t->setNationalityEnable((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 28: _t->removeEquipCard(); break;
        case 29: _t->removeHandCard(); break;
        case 30: _t->removeJudgeCard(); break;
        case 31: _t->removePileCard(); break;
        case 32: _t->doGeneralAssign(); break;
        case 33: _t->doGeneralAssign2(); break;
        case 34: _t->doEquipCardAssign(); break;
        case 35: _t->doHandCardAssign(); break;
        case 36: _t->doJudgeCardAssign(); break;
        case 37: _t->doPileCardAssign(); break;
        case 38: _t->clearGeneral2(); break;
        case 39: _t->exchangeListItem(); break;
        case 40: _t->checkSingleTurnBox((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 41: _t->checkBeforeNextBox((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 42: _t->on_list_itemSelectionChanged((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 43: _t->load(); break;
        case 44: { bool _r = _t->save((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 45: { bool _r = _t->save();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 46: _t->getChosenGeneral((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 47: _t->getEquipCard((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 48: _t->getHandCard((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 49: _t->getJudgeCard((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 50: _t->getPileCard((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CustomAssignDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CustomAssignDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_CustomAssignDialog,
      qt_meta_data_CustomAssignDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CustomAssignDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CustomAssignDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CustomAssignDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CustomAssignDialog))
        return static_cast<void*>(const_cast< CustomAssignDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int CustomAssignDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 51)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 51;
    }
    return _id;
}

// SIGNAL 0
void CustomAssignDialog::card_addin(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void CustomAssignDialog::scenario_changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
static const uint qt_meta_data_GeneralAssignDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: signature, parameters, type, tag, flags
      26,   21,   20,   20, 0x05,
      50,   20,   20,   20, 0x05,

 // slots: signature, parameters, type, tag, flags
      68,   20,   20,   20, 0x08,
      84,   20,   20,   20, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_GeneralAssignDialog[] = {
    "GeneralAssignDialog\0\0name\0"
    "general_chosen(QString)\0general_cleared()\0"
    "chooseGeneral()\0clearGeneral()\0"
};

void GeneralAssignDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        GeneralAssignDialog *_t = static_cast<GeneralAssignDialog *>(_o);
        switch (_id) {
        case 0: _t->general_chosen((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 1: _t->general_cleared(); break;
        case 2: _t->chooseGeneral(); break;
        case 3: _t->clearGeneral(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData GeneralAssignDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject GeneralAssignDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_GeneralAssignDialog,
      qt_meta_data_GeneralAssignDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &GeneralAssignDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *GeneralAssignDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *GeneralAssignDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_GeneralAssignDialog))
        return static_cast<void*>(const_cast< GeneralAssignDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int GeneralAssignDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void GeneralAssignDialog::general_chosen(const QString & _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void GeneralAssignDialog::general_cleared()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}
static const uint qt_meta_data_CardAssignDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      26,   18,   17,   17, 0x05,

 // slots: signature, parameters, type, tag, flags
      43,   17,   17,   17, 0x08,
      53,   17,   17,   17, 0x08,
      70,   18,   17,   17, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_CardAssignDialog[] = {
    "CardAssignDialog\0\0card_id\0card_chosen(int)\0"
    "askCard()\0updateCardList()\0"
    "updateExcluded(int)\0"
};

void CardAssignDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        CardAssignDialog *_t = static_cast<CardAssignDialog *>(_o);
        switch (_id) {
        case 0: _t->card_chosen((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->askCard(); break;
        case 2: _t->updateCardList(); break;
        case 3: _t->updateExcluded((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData CardAssignDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject CardAssignDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_CardAssignDialog,
      qt_meta_data_CardAssignDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &CardAssignDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *CardAssignDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *CardAssignDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_CardAssignDialog))
        return static_cast<void*>(const_cast< CardAssignDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int CardAssignDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    }
    return _id;
}

// SIGNAL 0
void CardAssignDialog::card_chosen(int _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
static const uint qt_meta_data_SkillAssignDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      19,   18,   18,   18, 0x05,

 // slots: signature, parameters, type, tag, flags
      45,   18,   18,   18, 0x08,
      59,   18,   18,   18, 0x08,
      73,   18,   18,   18, 0x08,
      84,   18,   18,   18, 0x08,
     102,   18,   18,   18, 0x08,
     128,  120,   18,   18, 0x08,
     157,   18,   18,   18, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_SkillAssignDialog[] = {
    "SkillAssignDialog\0\0skill_update(QStringList)\0"
    "selectSkill()\0deleteSkill()\0addSkill()\0"
    "changeSkillInfo()\0updateSkillList()\0"
    "general\0getSkillFromGeneral(QString)\0"
    "accept()\0"
};

void SkillAssignDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        SkillAssignDialog *_t = static_cast<SkillAssignDialog *>(_o);
        switch (_id) {
        case 0: _t->skill_update((*reinterpret_cast< QStringList(*)>(_a[1]))); break;
        case 1: _t->selectSkill(); break;
        case 2: _t->deleteSkill(); break;
        case 3: _t->addSkill(); break;
        case 4: _t->changeSkillInfo(); break;
        case 5: _t->updateSkillList(); break;
        case 6: _t->getSkillFromGeneral((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: _t->accept(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData SkillAssignDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject SkillAssignDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_SkillAssignDialog,
      qt_meta_data_SkillAssignDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &SkillAssignDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *SkillAssignDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *SkillAssignDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_SkillAssignDialog))
        return static_cast<void*>(const_cast< SkillAssignDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int SkillAssignDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
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
void SkillAssignDialog::skill_update(QStringList _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
