//
//  FriendsListViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 19.04.2021.
//

import UIKit

var usersDictionary = Dictionary(grouping: UsersDataStorage.shared.usersArray, by: { String($0.lastName.trimmingCharacters(in: .whitespaces).first!) }).sorted(by: { $0.0 < $1.0 })

class FriendsListViewController: UIViewController, AlphabetControlDelegate {
    
    @IBOutlet weak var friendsListTableView: UITableView!
    
    @IBOutlet weak var friendsListControl: AlphabetControl!
    
    let friendsToPhotoSegue = "friendsToPhoto"
    
    let friendsCellNib = UINib(nibName: "FriendsTableViewCell", bundle: nil)
    
    let friendsCellIdentifier = "friendsCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsListTableView.register(friendsCellNib, forCellReuseIdentifier: friendsCellIdentifier)
        
        
        
        friendsListControl.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func alertNoPhotoAvailable(alertText: String) {
        let alertMessage = UIAlertController(title: "Сообщение!", message: alertText, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alertMessage.addAction(okButton)
        present(alertMessage, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == friendsToPhotoSegue else { return }
        guard let destination = segue.destination as? PhotoConteinersViewController else { return }
        guard let indexPath = self.friendsListTableView.indexPathForSelectedRow else {return}
        guard let array = usersDictionary[indexPath.section].value[indexPath.row].photoArray else {return}
        destination.images = array
    }
    
    
}

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return usersDictionary.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usersDictionary[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: friendsCellIdentifier, for: indexPath) as! FriendsTableViewCell
        cell.configFriendCell(index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 30)
        title.backgroundColor =  #colorLiteral(red: 0.2143571675, green: 0.4973421693, blue: 0.6577147245, alpha: 0.5)
        title.textAlignment = .center
        title.text = usersDictionary[section].key
        title.tintColor = UIColor.black
        view.addSubview(title)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let seconds = 0.2
        
        if let cell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell {
            cell.pushAnimation()
        }
        
        if usersDictionary[indexPath.section].value[indexPath.row].photoArray != nil   {
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
                performSegue(withIdentifier: friendsToPhotoSegue, sender: nil)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
                alertNoPhotoAvailable(alertText: "У этого пользователя нет фотографий.")
            }
        }
    }
    
}

extension FriendsListViewController: UITableViewDelegate {
    
    func buttonPushed(index: IndexPath) {
        self.friendsListTableView.scrollToRow(at: index, at: .top, animated: true)
    }
}
