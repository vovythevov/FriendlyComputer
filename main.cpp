

#include <QtGui/QGuiApplication>
#include <QtGui/QScreen>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlComponent>
#include <QtQuick/QQuickWindow>
#include <QtCore/QUrl>
#include <QDebug>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);
    const auto screens = QGuiApplication::screens();
    for (QScreen *screen : screens)
        screen->setOrientationUpdateMask(Qt::LandscapeOrientation | Qt::PortraitOrientation |
                                         Qt::InvertedLandscapeOrientation | Qt::InvertedPortraitOrientation);
    QQmlEngine engine;
    QQmlComponent component(&engine);
    QQuickWindow::setDefaultAlphaBuffer(true);
    component.loadUrl(QUrl("qrc:///window.qml"));
    if ( component.isReady() )
        component.create();
    else
        qWarning() << component.errorString();
    return app.exec();
}