#include "widget.h"
Widget::Widget( Qt::WindowFlags flags,QWidget *parent)
    : QWidget(parent, flags),feedBackTipView(NULL)
{
    m_pBox = new QToolBox(this);
    m_pListMap = new QMap<MyListView*,QString>();
    MyListView *pListView = new MyListView(this);
    pListView->setViewMode(QListView::ListMode);
    pListView->setStyleSheet("QListView{icon-size:40px}");
    m_pBox->addItem(pListView,tr("我的好友"));
//    m_pListMap->insert(QPair<MyListView*,QString>(pListView,tr("我的好友")));

    MyListView *pListView1 = new MyListView(this);
    pListView1->setViewMode(QListView::ListMode);
    pListView1->setStyleSheet("QListView{icon-size:40px}");
    m_pBox->addItem(pListView1,tr("陌生人"));
//    m_pListMap->insert(QPair<MyListView*,QString>(pListView1,tr("陌生人")));

    pListView->setListMap(m_pListMap);
    pListView1->setListMap(m_pListMap);
    m_pBox->setFixedWidth(150);
    m_pBox->setMinimumHeight(500);
    this->setMinimumSize(200,500);
    //ui.setupUi(this);
}

Widget::~Widget()
{

}

void Widget::showQML()
{
//    if(feedBackTipView==NULL)
//    {
//        feedBackTipView = new QDeclarativeView;
//        feedBackTipView->setSource(QUrl("../../../YibanMain.qml"));
//        feedBackTipView->setResizeMode(QDeclarativeView::SizeRootObjectToView);
//        feedBackTipView->setWindowFlags(Qt::CustomizeWindowHint | Qt::WindowCloseButtonHint | Qt::WindowMinimizeButtonHint);
//        feedBackTipView->setViewportUpdateMode(QGraphicsView::FullViewportUpdate);
//    }
//    feedBackTipView->show();

    QQuickView *view = new QQuickView;
    view->setSource(QUrl::fromLocalFile("../../../ChatUI/ChatUI.qml"));
    view->show();

    QQuickView *viewUI = new QQuickView;
    viewUI->setSource(QUrl::fromLocalFile("../../../YibanMain.qml"));
    viewUI->show();


}
void Widget::contextMenuEvent( QContextMenuEvent * event )
{
    QMenu *pMenu = new QMenu(this);
    QAction *pAddGroupAct = new QAction(tr("添加分组"),pMenu);
    pMenu->addAction(pAddGroupAct);
    connect(pAddGroupAct,SIGNAL(triggered (bool)),this,SLOT(addGroupSlot(bool)));
    pMenu->popup(mapToGlobal(event->pos()));
}


void Widget::addGroupSlot( bool addgroup )
{
    QString name = QInputDialog::getText(this,tr("输入分组名"),tr(""));
    if (!name.isEmpty())
    {
        MyListView *pListView1 = new MyListView(this);
        pListView1->setViewMode(QListView::ListMode);
        pListView1->setStyleSheet("QListView{icon-size:40px}");
        m_pBox->addItem(pListView1,name);
//        m_pListMap->insert(QPair<MyListView*,QString>(pListView1,name));
    }
    //要确保每个MyListView钟的m_pListMap都是一致的，不然就会有错了。
    //因为弹出的菜单进行转移的时候需要用到
    QMap<MyListView*,QString>::iterator it = m_pListMap->begin();
    for (it; it != m_pListMap->end(); ++it)
    {
        MyListView* pList = it.key();
        pList->setListMap(m_pListMap);
    }
}
