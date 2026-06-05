/****************************************************************************
** Meta object code from reading C++ file 'packagingeditor.h'
**
** Created: Wed Dec 4 14:48:41 2013
**      by: The Qt Meta Object Compiler version 63 (Qt 4.8.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../src/dialog/packagingeditor.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'packagingeditor.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_MetaInfoWidget[] = {

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

static const char qt_meta_stringdata_MetaInfoWidget[] = {
    "MetaInfoWidget\0"
};

void MetaInfoWidget::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObjectExtraData MetaInfoWidget::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject MetaInfoWidget::staticMetaObject = {
    { &QGroupBox::staticMetaObject, qt_meta_stringdata_MetaInfoWidget,
      qt_meta_data_MetaInfoWidget, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &MetaInfoWidget::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *MetaInfoWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *MetaInfoWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_MetaInfoWidget))
        return static_cast<void*>(const_cast< MetaInfoWidget*>(this));
    return QGroupBox::qt_metacast(_clname);
}

int MetaInfoWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGroupBox::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    return _id;
}
static const uint qt_meta_data_PackagingEditor[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      17,   16,   16,   16, 0x08,
      34,   16,   16,   16, 0x08,
      50,   16,   16,   16, 0x08,
      69,   16,   16,   16, 0x08,
      85,   16,   16,   16, 0x08,
     109,   99,   16,   16, 0x08,
     148,  143,   16,   16, 0x28,
     177,   16,   16,   16, 0x08,
     190,   16,   16,   16, 0x08,
     214,  204,   16,   16, 0x08,
     233,  143,   16,   16, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_PackagingEditor[] = {
    "PackagingEditor\0\0installPackage()\0"
    "modifyPackage()\0uninstallPackage()\0"
    "rescanPackage()\0browseFiles()\0item,mute\0"
    "removeFile(QListWidgetItem*,bool)\0"
    "item\0removeFile(QListWidgetItem*)\0"
    "removeFile()\0makePackage()\0exit_code\0"
    "done7zProcess(int)\0updateMetaInfo(QListWidgetItem*)\0"
};

void PackagingEditor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        PackagingEditor *_t = static_cast<PackagingEditor *>(_o);
        switch (_id) {
        case 0: _t->installPackage(); break;
        case 1: _t->modifyPackage(); break;
        case 2: _t->uninstallPackage(); break;
        case 3: _t->rescanPackage(); break;
        case 4: _t->browseFiles(); break;
        case 5: _t->removeFile((*reinterpret_cast< QListWidgetItem*(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 6: _t->removeFile((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        case 7: _t->removeFile(); break;
        case 8: _t->makePackage(); break;
        case 9: _t->done7zProcess((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 10: _t->updateMetaInfo((*reinterpret_cast< QListWidgetItem*(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData PackagingEditor::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject PackagingEditor::staticMetaObject = {
    { &QDialog::staticMetaObject, qt_meta_stringdata_PackagingEditor,
      qt_meta_data_PackagingEditor, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &PackagingEditor::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *PackagingEditor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *PackagingEditor::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_PackagingEditor))
        return static_cast<void*>(const_cast< PackagingEditor*>(this));
    return QDialog::qt_metacast(_clname);
}

int PackagingEditor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDialog::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
