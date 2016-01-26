#include "friendmodel.h"

FriendModel::FriendModel( QObject *parent /*= NULL*/ ):
    QAbstractListModel(parent)
{

    //san cun tian tang
     QHash<int, QByteArray> roles;
     roles[FriendName] = "Name";
     roles[IconPath] = "iconPath";
     roles[SpaceStatus] = "spaceStatus";
     roles[Limited] = "limited";
     roles[SignContents] = "signContents";
     roles[FriendId]="friendId";
//     setRoleNames(roles);
     init();
     qRegisterMetaType<QModelIndex>("QModelIndex");
}

FriendModel::~FriendModel()
{

}

QVariant FriendModel::data( const QModelIndex & index, int role /*= Qt::DisplayRole */ ) const
{
    if (index.row() > m_ItemDataVec.size())
    {
        return QVariant();
    }
    else
    {
        switch (role)
        {
        case FriendName:
        {
            return m_ItemDataVec[index.row()]->Name;
        }
            break;
        case IconPath:
        {
            return QIcon(m_ItemDataVec[index.row()]->iconPath);
        }
            break;
        case Qt::SizeHintRole:
        {
            return QSize(10,50);

        }
        case SignContents:
        {
            return m_ItemDataVec[index.row()]->signContents;
        }break;
        }
    }
    return QVariant();
}
int FriendModel::rowCount( const QModelIndex & parent /*= QModelIndex() */ ) const
{
    return m_ItemDataVec.size();
}

void FriendModel::init()
{
    for (int i = 1; i <=6; ++i)
    {
        ListItemData *pItem = new ListItemData;
        pItem->Name = QString::number(i);
        pItem->iconPath = QString(":/images/%1.png").arg(i);
        pItem->signContents = QString("最近局势很紧啊啊啊啊撒是");
        QFile Iconfile(pItem->iconPath);
        if (Iconfile.exists())
        {
            m_ItemDataVec.push_back(pItem);
        }

    }
}

void FriendModel::deleteItem( int index )
{
     std::vector<ListItemData*>::iterator it = m_ItemDataVec.begin();
    m_ItemDataVec.erase(it + index);
}

void FriendModel::addItem( ListItemData *pItem )
{
    if (pItem)
    {
        this->beginInsertRows(QModelIndex(),m_ItemDataVec.size(),m_ItemDataVec.size() + 1);
        m_ItemDataVec.push_back(pItem);
        this->endInsertRows();
    }

}

ListItemData* FriendModel::getItem( int index )
{
    if (index > -1 && index < m_ItemDataVec.size())
    {
        return m_ItemDataVec[index];
    }
}
