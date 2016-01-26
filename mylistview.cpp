#include "mylistview.h"

MyListView::MyListView( QWidget *parent /*= NULL*/ ):
    QListView(parent)
{
    m_hitIndex = -1;
    m_pModel = new FriendModel;
    this->setModel(m_pModel);
    m_pListMap = NULL;
}

MyListView::~MyListView()
{

}

void MyListView::contextMenuEvent( QContextMenuEvent * event )
{
    int hitIndex = this->indexAt(event->pos()).column();
    if (hitIndex > -1)
    {
        QMenu *pMenu = new QMenu(this);
        QAction *pDeleteAct = new QAction(tr("删除"),pMenu);
        pMenu->addAction(pDeleteAct);
        connect(pDeleteAct,SIGNAL(triggered (bool)),this,SLOT(deleteItemSlot(bool)));
        QMenu *pSubMenu = NULL;
        QMap<MyListView*,QString>::iterator it = m_pListMap->begin();
        for (it;it != m_pListMap->end();++it)
        {
            if (!pSubMenu)
            {
                pSubMenu = new QMenu(tr("转移联系人至") ,pMenu);
                pMenu->addMenu(pSubMenu);
            }
            if (it.key() == this)
            {
                QAction *pMoveAct = new QAction( it.value() ,pMenu);
                //记录菜单与分组的映射，在moveSlot()响应时需要用到。
//                m_ActionMap.insert(QPair<QAction*,MyListView*>(pMoveAct,it.key()));
                pSubMenu->addAction(pMoveAct);
                connect(pMoveAct,SIGNAL(triggered (bool)),this,SLOT(moveSlot(bool)));
            }

        }
        pMenu->popup(mapToGlobal(event->pos()));
    }
}

void MyListView::deleteItemSlot( bool bDelete )
{
    int index = this->currentIndex().row();
    if (index > -1)
    {
        m_pModel->deleteItem(index);
    }
}

void MyListView::setListMap( QMap<MyListView*,QString> *pListMap )
{
    m_pListMap = pListMap;
}

void MyListView::addItem( ListItemData *pItem )
{
    m_pModel->addItem(pItem);
}

void MyListView::moveSlot( bool bMove )
{
    QAction *pSender = qobject_cast<QAction*>(sender());
    if (pSender)
    {
        //根据点击的菜单，找到相应的列表，然后才能把图标转移过去
        MyListView *pList = m_ActionMap.find(pSender).value();
        if (pList)
        {
            int index = this->currentIndex().row();
            ListItemData *pItem = m_pModel->getItem(index);
            pList->addItem(pItem);
            //添加到别的分组，就在原来的分组中删除掉了
            m_pModel->deleteItem(index);
        }
    }
    //操作完了要把这个临时的映射清空
    m_ActionMap.clear();
}

