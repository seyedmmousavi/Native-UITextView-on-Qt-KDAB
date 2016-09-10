#include "mytextview.h"
#include <QQuickWindow>
#include <QDebug>

#import <CoreFoundation/CoreFoundation.h>
#import <UIKit/UIKit.h>


static inline CGRect toCGRect(const QRectF &rect)
{
    return CGRectMake(rect.x(), rect.y(), rect.width(), rect.height());
}


MyTextView::MyTextView(QQuickItem *parent /*= 0*/)
    : QQuickItem(parent)
    , m_view(0)
{
    connect(this, SIGNAL(windowChanged(QQuickWindow*)), this, SLOT(onWindowChanged(QQuickWindow*)));
    connect(this, SIGNAL(visibleChanged()), this, SLOT(onVisibleChanged()));
}

MyTextView::~MyTextView()
{
    [m_view release];
}

void MyTextView::onWindowChanged(QQuickWindow* window)
{
    if(!m_view) {
        m_view = [[UITextView alloc] init];
//        m_view.backgroundColor = [UIColor grayColor];
    }
    if (window != 0) {
        UIView *parentView = reinterpret_cast<UIView *>(window->winId());
        [parentView addSubview:m_view];
    } else {
        [m_view removeFromSuperView];
    }
}

void MyTextView::geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry)
{
    QQuickItem::geometryChanged(newGeometry, oldGeometry);
    CGRect rc = toCGRect(mapRectToScene(newGeometry).toRect());
    rc.size.width -= 2;
    rc.size.height -= 2;
    [m_view setFrame:rc];
    qDebug() << newGeometry << [m_view frame].size.width << [m_view frame].size.height;
}

void MyTextView::onVisibleChanged()
{
    [m_view setHidden:isVisible()];
}

