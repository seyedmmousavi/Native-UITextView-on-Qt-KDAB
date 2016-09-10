#ifndef MYTEXTVIEW_H
#define MYTEXTVIEW_H

#include <QQuickItem>


Q_FORWARD_DECLARE_OBJC_CLASS(UITextView);

class MyTextView : public QQuickItem
{
    Q_OBJECT
public:
    MyTextView(QQuickItem *parent = 0);
    ~MyTextView();

    void geometryChanged(const QRectF &newGeometry, const QRectF &oldGeometry) override;

private slots:
    void onWindowChanged(QQuickWindow* window);
    void onVisibleChanged();

private:
    UITextView* m_view;
};

#endif // MYTEXTVIEW_H
