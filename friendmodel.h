#ifndef FRIENDMODEL_H
#define FRIENDMODEL_H

#include <QAbstractListModel>
#include <QFile>
#include <QMenu>
#include <QAction>
#include <QString>
#include <QListView>
#include <QContextMenuEvent>
#include <string>
#include <iostream>
#include <map>
#include <vector>
struct ListItemData
{
    QString  iconPath;
    QString  spaceStatus;
    QString  Name;
    QString  limited;
    QString  signContents;
    QString friendId;
};
class FriendModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit FriendModel(QObject *parent = 0);
    ~FriendModel();
    enum FriendRol {
        FriendName = Qt::UserRole + 100,
        IconPath,
        SpaceStatus,
        Limited,
        SignContents,
        FriendId
    };

    void init();
    void addItem(ListItemData *pItem);
    QVariant data ( const QModelIndex & index, int role = Qt::DisplayRole ) const ;
    int rowCount ( const QModelIndex & parent = QModelIndex() ) const;
    void deleteItem(int index);
    ListItemData* getItem(int index );
protected:
private:
    std::vector<ListItemData*> m_ItemDataVec;
};
#endif // FRIENDMODEL_H
