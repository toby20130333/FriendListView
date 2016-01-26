#ifndef MYLISTVIEW_H
#define MYLISTVIEW_H

#include <QListView>
#include "friendmodel.h"

class MyListView:public QListView
{
  Q_OBJECT
public:
  MyListView(QWidget *parent = NULL);
  ~MyListView();
  void setListMap(QMap<MyListView*,QString> *pListMap);
  void addItem(ListItemData *pItem);
protected:
  void contextMenuEvent ( QContextMenuEvent * event );
private slots:
  void deleteItemSlot(bool bDelete);
  void moveSlot(bool bMove);
private:
  int  m_hitIndex;
  FriendModel   *m_pModel;
  ////记录分组和分组名字的映射关系，这个值跟QQPanel类中的映射组的值保持一致
  //这里还有一个用处就是在弹出的菜单需要分组的名称
  QMap<MyListView*,QString> *m_pListMap;
  //记录每个菜单项对应的列表，才能知道要转移到那个分组
  QMap<QAction*,MyListView*> m_ActionMap;
};

#endif // MYLISTVIEW_H
