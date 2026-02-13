//
//  NotificationViewController.swift
//  Tabbar_Ex
//
//  Created by ADMIN on 09/02/26.
//

import UIKit

class NotificationViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var notificationTableView: UITableView!
    
    var notifications =  [AppNotification]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifications = notificationList
        notificationTableView.delegate = self
        notificationTableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell", for: indexPath) as! NotificationTableViewCell
        cell.layer.cornerRadius = 6
        cell.clipsToBounds = true
        cell.configureCell(notifications: notifications[indexPath.row])
        return cell
    }
    
    

}

