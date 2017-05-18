CONFIG      += plugin debug_and_release
TARGET      = $$qtLibraryTarget(WidgetBoxPlugin)
TEMPLATE    = lib

HEADERS     = widgetboxplugin.h widgetbox.h \
              widgetboxextensionfactory.h \
              widgetboxdesignercontainerextension.h \
              CategoryWidgets.h \
              plugin_export.h \
              PageEventFilter.h

SOURCES     = widgetboxplugin.cpp widgetbox.cpp \
              widgetboxextensionfactory.cpp \
              widgetboxdesignercontainerextension.cpp \
              CategoryWidgets.cpp \
              PageEventFilter.cpp

RESOURCES   = icons.qrc
LIBS        += -L.

greaterThan(QT_MAJOR_VERSION, 4) {
    QT += designer
} else {
    CONFIG += designer
}

target.path = $$[QT_INSTALL_PLUGINS]/designer

creator_target.name = Copying the target dll to Qt Creator plugins directory as well
creator_target.input = $qtLbraryTarget(WidgetBoxPlugin)
creator_target.path  = $$(QTCREATOR_BIN_PATH)/plugins/designer
creator_target.CONFIG += no_check_exist
creator_target.output = WidgetBoxPlugin.dll
win32:creator_target.files = $$OUT_PWD/release/WidgetBoxPlugin.dll
else:unix:creator_target.files = $$OUT_PWD/release/libWidgetBoxPlugin.so
QMAKE_EXTRA_COMPILERS += creator_target

INSTALLS += target creator_target
