//
//  SearchGroupsTableViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

var searchedGroups = [Group]()

class SearchGroupsTableViewController: UITableViewController {
    
    let searchGroupCellNib = UINib(nibName: "GroupsTableViewCell", bundle: nil)
    
    let searchGroupCellIdentifier = "searchGroupCellID"
    
    @IBOutlet weak var searchHeader: UIView!
    
    @IBOutlet weak var searchGroup: UISearchBar!
    
    let unwindSegueIdentifier = "fromGlobalToUserGroupsSegue"

    var searchingBegan = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(searchGroupCellNib, forCellReuseIdentifier: searchGroupCellIdentifier)
        
        searchHeader.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50)
        
        tableView.tableHeaderView = searchHeader
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchingBegan {
            return searchedGroups.count
        } else {
        return GroupsDataStorage.shared.globalGroupsArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchGroupCellIdentifier, for: indexPath) as! GroupsTableViewCell
        
        if searchingBegan {
            cell.configSearchedGroupsCell(index: indexPath)
        } else {
            cell.configGlobalGroupsCell(index: indexPath)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let addAction = UIContextualAction(style: .normal, title: "Add") { (action, view, nil) in
            
            var haveGroupInUserListFlag = false
            
            for group in GroupsDataStorage.shared.userGroupsArray {
                if group.name == GroupsDataStorage.shared.globalGroupsArray[indexPath.row].name {
                    haveGroupInUserListFlag = true
                }
            }
            
            if !haveGroupInUserListFlag {
                GroupsDataStorage.shared.userGroupsArray.append(GroupsDataStorage.shared.globalGroupsArray[indexPath.row])
            }
            tableView.reloadData()
            
            self.performSegue(withIdentifier: "fromGlobalToUserGroupsSegue", sender: nil)
            
        }
        addAction.backgroundColor = #colorLiteral(red: 0.1648246646, green: 0.40975371, blue: 0.5832718015, alpha: 1)
        let addConfig = UISwipeActionsConfiguration(actions: [addAction])
        addConfig.performsFirstActionWithFullSwipe = false
        return addConfig
    }
    
}

extension SearchGroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedGroups = []
        var groupsNames = [String]()
        var searchedNames = [String]()
        for group in GroupsDataStorage.shared.globalGroupsArray {
            let name = group.name
            groupsNames.append(name)
        }
        
        searchedNames = groupsNames.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
        for name in searchedNames {
            for group in GroupsDataStorage.shared.globalGroupsArray {
                if name == group.name{
                    searchedGroups.append(group)
                }
            }
        }
        
        searchingBegan = true
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchingBegan = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? GroupsTableViewCell {
            cell.pushAnimation()
        }
    }
    
}
