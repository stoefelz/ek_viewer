import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0
import "../database.js" as DB
import "../startpage"

Page {

    // for showing warning of not updating prices until user clicks on warning first time
    ConfigurationGroup
    {
        id: firstLaunch
        path: "/apps/harbour-kleinanzeigen-viewer/startup/first_launch"
    }

    allowedOrientations: Orientation.All
    property bool firstStart: true

    SilicaListView {
        id: favouriteListView
        anchors.fill: parent
        opacity: firstStart ? 0.5 : 1.0

        header: PageHeader {
            title: qsTr("Watchlist")
        }

        ViewPlaceholder {
            id: emptyWatchlist
            //value is set later because otherwise user would see this text for a few milliseconds on the screen
            enabled: false
            text: qsTr("Your watchlist is empty")
        }

        model: FavouriteModel {}
        delegate: ItemDelegate {
            function removeFavourite(itemId) {
                remorseAction(qsTr("Removing from watchlist"), function() {
                    DB.deleteFavourite(itemId)
                    favouriteListView.model.remove(index)
                    if(favouriteListView.count === 0) {
                        emptyWatchlist.enabled = true
                    }
                })
            }

            menu: ContextMenu {
                MenuItem {
                    text: qsTr("Remove")
                    onClicked: {
                        removeFavourite(itemId)
                    }
                }
            }
        }

    }

    Component.onCompleted: {
       firstStart = firstLaunch.value("isFirst", true, Boolean)
    }

    onStatusChanged: {
        //when in itemview one favourite is removed -> model must be updated
        if (status == PageStatus.Activating) {
            favouriteListView.model.loadData()
            if(favouriteListView.count === 0) {
                emptyWatchlist.enabled = true
            }
        }
    }

    InteractionHintLabel {
            anchors.bottom: parent.bottom
            opacity: 1.0
            text: qsTr("Unfortunately there are no automatic price updates")

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    firstLaunch.setValue("isFirst", false)
                    firstStart = false
                }
            }
            visible: firstStart
    }

}
