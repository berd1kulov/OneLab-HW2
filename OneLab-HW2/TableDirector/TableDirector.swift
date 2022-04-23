//
//  TableDirector.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 23.04.2022.
//

import UIKit

class TableDirector: NSObject {
    
    let tableView: UITableView
    var items = [AddNewFriendData]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let actionProxy = CellActionProxy()
    
    init(tableView: UITableView, items: [AddNewFriendData]) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.items = items
        
        NotificationCenter.default.addObserver(self, selector: #selector(onActionEvent(notification:)), name: CellAction.notificationName, object: nil)
    }
    
    @objc fileprivate func onActionEvent(notification: Notification) {
        if let eventData = notification.userInfo?["data"] as? CellActionEventData, let cell = eventData.cell as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) {
            actionProxy.invoke(action: eventData.action, cell: cell, configurator: self.items[indexPath.section].datas[indexPath.row])
        }
    }
}

extension TableDirector: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 72
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return "\(self.items[section].sectionName.localized()) (\(self.items[section].datas.count))"
        }
        return self.items[section].sectionName.localized()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.sectionHeader
        (view as! UITableViewHeaderFooterView).textLabel?.font = .boldSystemFont(ofSize: 22)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 28
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellConfig = self.items[indexPath.section].datas[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        self.actionProxy.invoke(action: .didSelect, cell: cell, configurator: cellConfig)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellConfig = self.items[indexPath.section].datas[indexPath.row]
        self.actionProxy.invoke(action: .willDisplay, cell: cell, configurator: cellConfig)
    }
}

extension TableDirector: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.items[indexPath.section].datas[indexPath.row]
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        return cell
    }
}
