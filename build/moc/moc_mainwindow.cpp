/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.h'
**
** Created: Wed Dec 4 14:48:39 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/mainwindow.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_BroadcastBox[] = {

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

static const char qt_meta_stringdata_BroadcastBox[] = {
    "BroadcastBox\0"
};

void BroadcastBox::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData BroadcastBox::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject BroadcastBox::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_BroadcastBox,
      qt_meta_data_BroadcastBox, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &BroadcastBox::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *BroadcastBox::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *BroadcastBox::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_BroadcastBox))
        return static_cast<void*>(const_cast< BroadcastBox*>(this));
    return QDialog::qt_metacast(_clname);
}

int BroadcastBox::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_MeleeDialog[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      13,   12,   12,   12, 0x08,
      42,   29,   12,   12, 0x08,
      62,   12,   12,   12, 0x08,
      74,   12,   12,   12, 0x08,
      95,   88,   12,   12, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_MeleeDialog[] = {
    "MeleeDialog\0\0selectGeneral()\0general_name\0"
    "setGeneral(QString)\0startTest()\0"
    "onGameStart()\0winner\0onGameOver(QString)\0"
};

void MeleeDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MeleeDialog *_t = static_cast<MeleeDialog *>(_o);
        switch (_id) {
        case 0: _t->selectGeneral(); break;
        case 1: _t->setGeneral((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: _t->startTest(); break;
        case 3: _t->onGameStart(); break;
        case 4: _t->onGameOver((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData MeleeDialog::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MeleeDialog::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_MeleeDialog,
      qt_meta_data_MeleeDialog, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MeleeDialog::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MeleeDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MeleeDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MeleeDialog))
        return static_cast<void*>(const_cast< MeleeDialog*>(this));
    return QDialog::qt_metacast(_clname);
}

int MeleeDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
static const uint qt_meta_data_MainWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      44,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      12,   11,   11,   11, 0x0a,
      46,   11,   11,   11, 0x08,
      77,   11,   11,   11, 0x08,
     109,   11,   11,   11, 0x08,
     148,   11,   11,   11, 0x08,
     189,   11,   11,   11, 0x08,
     225,   11,   11,   11, 0x08,
     255,   11,   11,   11, 0x08,
     286,   11,   11,   11, 0x08,
     321,   11,   11,   11, 0x08,
     354,   11,   11,   11, 0x08,
     391,   11,   11,   11, 0x08,
     422,   11,   11,   11, 0x08,
     461,   11,   11,   11, 0x08,
     500,   11,   11,   11, 0x08,
     545,   11,   11,   11, 0x08,
     581,   11,   11,   11, 0x08,
     613,   11,   11,   11, 0x08,
     641,   11,   11,   11, 0x08,
     668,   11,   11,   11, 0x08,
     705,   11,   11,   11, 0x08,
     737,   11,   11,   11, 0x08,
     771,   11,   11,   11, 0x08,
     806,   11,   11,   11, 0x08,
     844,   11,   11,   11, 0x08,
     876,   11,   11,   11, 0x08,
     909,   11,   11,   11, 0x08,
     938,   11,   11,   11, 0x08,
     964,   11,   11,   11, 0x08,
     999,   11,   11,   11, 0x08,
    1032,   11,   11,   11, 0x08,
    1069,   11,   11,   11, 0x08,
    1099,   11,   11,   11, 0x08,
    1132,   11,   11,   11, 0x08,
    1169,   11,   11,   11, 0x08,
    1225, 1199,   11,   11, 0x08,
    1265, 1255,   11,   11, 0x08,
    1287,   11,   11,   11, 0x08,
    1305, 1299,   11,   11, 0x08,
    1332,   11,   11,   11, 0x08,
    1354,   11,   11,   11, 0x08,
    1383,   11,   11,   11, 0x08,
    1402,   11,   11,   11, 0x08,
    1438,   11,   11,   11, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_MainWindow[] = {
    "MainWindow\0\0on_actionRestart_game_triggered()\0"
    "on_actionAbout_Lua_triggered()\0"
    "on_actionAbout_fmod_triggered()\0"
    "on_actionAbout_libtomcrypt_triggered()\0"
    "on_actionReplay_file_convert_triggered()\0"
    "on_actionCheck_resource_triggered()\0"
    "on_actionAI_Melee_triggered()\0"
    "on_actionPackaging_triggered()\0"
    "on_actionScript_editor_triggered()\0"
    "on_actionCard_editor_triggered()\0"
    "on_actionAcknowledgement_triggered()\0"
    "on_actionBroadcast_triggered()\0"
    "on_actionScenario_Overview_triggered()\0"
    "on_actionRole_assign_table_triggered()\0"
    "on_actionMinimize_to_system_tray_triggered()\0"
    "on_actionShow_Hide_Menu_triggered()\0"
    "on_actionFullscreen_triggered()\0"
    "on_actionReplay_triggered()\0"
    "on_actionAbout_triggered()\0"
    "on_actionEnable_Hotkey_toggled(bool)\0"
    "on_actionEnable_Lua_triggered()\0"
    "on_actionEnable_Lua_toggled(bool)\0"
    "on_actionCard_Overview_triggered()\0"
    "on_actionGeneral_Overview_triggered()\0"
    "on_actionStart_Game_triggered()\0"
    "on_actionReturn_main_triggered()\0"
    "on_actionPause_toggled(bool)\0"
    "on_actionExit_triggered()\0"
    "on_actionView_ban_list_triggered()\0"
    "on_actionCStandard_toggled(bool)\0"
    "on_actionCGolden_Snake_toggled(bool)\0"
    "on_actionSgs_OL_toggled(bool)\0"
    "on_actionGStandard_toggled(bool)\0"
    "on_actionGGolden_Snake_toggled(bool)\0"
    "on_actionCustom_toggled(bool)\0"
    "server_version,server_mod\0"
    "checkVersion(QString,QString)\0error_msg\0"
    "networkError(QString)\0enterRoom()\0"
    "scene\0gotoScene(QGraphicsScene*)\0"
    "sendLowLevelCommand()\0"
    "startGameInAnotherInstance()\0"
    "changeBackground()\0"
    "on_actionChange_general_triggered()\0"
    "on_actionFile_encryption_decryption_triggered()\0"
};

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MainWindow *_t = static_cast<MainWindow *>(_o);
        switch (_id) {
        case 0: _t->on_actionRestart_game_triggered(); break;
        case 1: _t->on_actionAbout_Lua_triggered(); break;
        case 2: _t->on_actionAbout_fmod_triggered(); break;
        case 3: _t->on_actionAbout_libtomcrypt_triggered(); break;
        case 4: _t->on_actionReplay_file_convert_triggered(); break;
        case 5: _t->on_actionCheck_resource_triggered(); break;
        case 6: _t->on_actionAI_Melee_triggered(); break;
        case 7: _t->on_actionPackaging_triggered(); break;
        case 8: _t->on_actionScript_editor_triggered(); break;
        case 9: _t->on_actionCard_editor_triggered(); break;
        case 10: _t->on_actionAcknowledgement_triggered(); break;
        case 11: _t->on_actionBroadcast_triggered(); break;
        case 12: _t->on_actionScenario_Overview_triggered(); break;
        case 13: _t->on_actionRole_assign_table_triggered(); break;
        case 14: _t->on_actionMinimize_to_system_tray_triggered(); break;
        case 15: _t->on_actionShow_Hide_Menu_triggered(); break;
        case 16: _t->on_actionFullscreen_triggered(); break;
        case 17: _t->on_actionReplay_triggered(); break;
        case 18: _t->on_actionAbout_triggered(); break;
        case 19: _t->on_actionEnable_Hotkey_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 20: _t->on_actionEnable_Lua_triggered(); break;
        case 21: _t->on_actionEnable_Lua_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 22: _t->on_actionCard_Overview_triggered(); break;
        case 23: _t->on_actionGeneral_Overview_triggered(); break;
        case 24: _t->on_actionStart_Game_triggered(); break;
        case 25: _t->on_actionReturn_main_triggered(); break;
        case 26: _t->on_actionPause_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 27: _t->on_actionExit_triggered(); break;
        case 28: _t->on_actionView_ban_list_triggered(); break;
        case 29: _t->on_actionCStandard_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 30: _t->on_actionCGolden_Snake_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 31: _t->on_actionSgs_OL_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 32: _t->on_actionGStandard_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 33: _t->on_actionGGolden_Snake_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 34: _t->on_actionCustom_toggled((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 35: _t->checkVersion((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 36: _t->networkError((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 37: _t->enterRoom(); break;
        case 38: _t->gotoScene((*reinterpret_cast< QGraphicsScene*(*)>(_a[1]))); break;
        case 39: _t->sendLowLevelCommand(); break;
        case 40: _t->startGameInAnotherInstance(); break;
        case 41: _t->changeBackground(); break;
        case 42: _t->on_actionChange_general_triggered(); break;
        case 43: _t->on_actionFile_encryption_decryption_triggered(); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData MainWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_MainWindow,
      qt_meta_data_MainWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MainWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 44)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 44;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
