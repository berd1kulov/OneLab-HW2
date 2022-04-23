//
//  AddNewFriendTableViewController.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import UIKit

class AddNewFriendTableViewController: UITableViewController {
    
    private var viewModel = AddNewFriendViewModel()
    
    private lazy var tableDirector: TableDirector = {
        let tableDirector = TableDirector(tableView: tableView, items: viewModel.datas)
        return tableDirector
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Friend".localized()
        tableView.backgroundColor = .systemBackground
        tableView.separatorStyle = .none
        viewModel.fetchAllDatas()
        cellActionHandlers()
        tableDirector.tableView.reloadData()
    }
}

// MARK: - Table view data source
extension AddNewFriendTableViewController {
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return viewModel.datas.count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.datas[section].datas.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = viewModel.datas[indexPath.section].datas[indexPath.row]
//        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
//        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
//        item.configure(cell: cell)
//        return cell
//    }
}

// MARK: - Table view delegate
extension AddNewFriendTableViewController {
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 1{
//            return 72
//        }else{
//            return 44
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 1{
//            return "\(viewModel.datas[section].sectionName.localized()) (\(viewModel.datas[section].datas.count))"
//        }
//        return viewModel.datas[section].sectionName.localized()
//    }
//
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.sectionHeader
//        (view as! UITableViewHeaderFooterView).textLabel?.font = .boldSystemFont(ofSize: 22)
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 28
//    }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row > 2{
//            tableView.deselectRow(at: indexPath, animated: false)
//        }else{
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
//
    private func cellActionHandlers() {
        self.tableDirector.actionProxy
            .on(action: .didSelect) { (config: NewUserCellConfigurator, cell) in

            }
            .on(action: .custom(NewUserCell.didAddButtonAction)){ (config: NewUserCellConfigurator, cell) in
                print("USER ADD TAPPED")
            }
    }
}
