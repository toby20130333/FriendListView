#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QToolBox>
#include <QInputDialog>
#include "friendmodel.h"
#include "mylistview.h"
#include <QtDeclarative/QDeclarativeView>
#include <QQuickView>
class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(Qt::WindowFlags flags,QWidget *parent = 0);
    ~Widget();

    void showQML();
    QDeclarativeView* feedBackTipView;
protected:
    void contextMenuEvent ( QContextMenuEvent * event );

protected slots:
    void addGroupSlot(bool addgroup);
private:
    QToolBox    *m_pBox;
    QMap<MyListView*,QString> *m_pListMap;    //记录分组和分组名字的映射关系，好在转移图标时知道转移到那个分组
};

#endif // WIDGET_H
