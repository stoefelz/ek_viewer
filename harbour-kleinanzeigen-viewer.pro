# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-kleinanzeigen-viewer

CONFIG += sailfishapp

PKGCONFIG += qt5embedwidget

SOURCES += \
    src/harbour-kleinanzeigen-viewer.cpp

DISTFILES += \
    harbour-kleinanzeigen-viewer.desktop \
    icons/108x108/harbour-kleinanzeigen-viewer.png \
    icons/128x128/harbour-kleinanzeigen-viewer.png \
    icons/172x172/harbour-kleinanzeigen-viewer.png \
    icons/86x86/harbour-kleinanzeigen-viewer.png \
    icons/harbour-kleinanzeigen-viewer.png \
    icons/no_image.svg \
    qml/cover/CoverPage.qml \
    qml/harbour-kleinanzeigen-viewer.qml \
    qml/pages/About.qml \
    qml/pages/Error.qml \
    qml/pages/Filter.qml \
    qml/pages/FilterProperties.qml \
    qml/pages/ItemView.qml \
    qml/pages/LoadItem.qml \
    qml/pages/PictureCarussel.qml \
    qml/pages/PossibleFilterValues.qml \
    qml/pages/StartPageWithSearchResults.qml \
    qml/pages/WebView.qml \
    qml/pages/ZipSelection.qml \
    qml/pages/get_search_entries.py \
    rpm/harbour-kleinanzeigen-viewer.changes.in \
    rpm/harbour-kleinanzeigen-viewer.changes.run.in \
    rpm/harbour-kleinanzeigen-viewer.spec \
    rpm/harbour-kleinanzeigen-viewer.yaml \
    translations/*.ts

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/harbour-kleinanzeigen-viewer-de.ts