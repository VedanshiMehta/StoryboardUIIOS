//
//  Notification.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 09/02/26.
//

struct AppNotification {
    
    let iconName : String
    let title : String
    let time : String
}

let notificationList : [AppNotification] = [
    AppNotification(iconName: "bell.circle.fill", title: "New follower: @design_guru", time: "2m ago"),
    AppNotification(iconName: "bell.circle.fill", title: "Reminder: Yoga class at 8:00 A.M.", time: "2h ago"),
    AppNotification(iconName: "bell.circle.fill", title: "Reminder: Yoga class at 6:00 P.M.", time: "1h ago"),
    AppNotification(iconName: "bell.circle.fill", title: "Order Shipped: #12346789", time: "1h ago"),
    AppNotification(iconName: "bell.circle.fill", title: "Low battery warning (20%)", time: "2h ago"),
]

