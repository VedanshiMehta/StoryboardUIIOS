//
//  MenuItem.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 22/01/26.
//

struct MenuItem{
    let title: String
    let iconName: String
}

let accountSection = [
       MenuItem(title: "My Orders", iconName: "bag.fill"),
       MenuItem(title: "Saved Items", iconName: "heart.fill"),
       MenuItem(title: "Notifications", iconName: "bell.fill")
   ]

    // Section 2 Data
let supportSection = [
        MenuItem(title: "Help & Support", iconName: "questionmark.circle.fill"),
        MenuItem(title: "Logout", iconName: "power")
    ]
