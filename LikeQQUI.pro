#-------------------------------------------------
#
# Project created by QtCreator 2014-04-25T10:52:24
#
#-------------------------------------------------

QT       += core gui declarative quick

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = LikeQQUI
TEMPLATE = app

MOC_DIR =./moc
UI_DIR    =./ui
OBJECTS_DIR = ./obj

SOURCES += main.cpp\
        widget.cpp \
    friendmodel.cpp \
    mylistview.cpp

HEADERS  += widget.h \
    friendmodel.h \
    mylistview.h

RESOURCES += \
    ybrc.qrc \
    ChatRc.qrc

OTHER_FILES += \
    YibanItem.qml \
    YibanFriendItem.qml \
    YibanModel.qml \
    YibanMain.qml \
    YibanHeadItem.qml \
    ybjs.js \
    YibanControls.qml \
    YibanFriend.qml \
    YibanQunItem.qml \
    YibanQun.qml \
    YibanQunView.qml \
    YibanJigouUI.qml \
    YibanHistory.qml \
    ChatUI/ChatView.qml \
    ChatUI/ChatItem.qml \
    ChatUI/ChatBiaoq.qml \
    ChatUI/ChatImageGif.qml \
    ChatUI/ChatITipsImg.qml \
    ChatUI/ChatOption.qml \
    ChatUI/ChatScrollBar.qml \
    ChatUI/ChatOptionBtn.qml \
    ChatUI/main.qml \
    YbTxt.js \
    ChatUI/ChatRigehtUI.qml \
    ChatUI/ChatUI.qml \
    ChatUI/ChatSomeInfo.qml
