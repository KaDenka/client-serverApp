//
//  GroupsTableViewCell.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 11.04.2021.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupAvatar: UIImageView!
    
    @IBOutlet weak var groupLabel: UILabel!
    
    func clearCell() {
        groupAvatar.image = nil
        groupLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    override func prepareForReuse() {
        clearCell()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configUserGroupsCell(index: IndexPath) {
        if let avatar = GroupsDataStorage.shared.userGroupsArray[index.row].avatar {
           // groupAvatar.image = avatar
        } else { groupAvatar.image = UIImage(named: "noGroupAvatarImage")}
        groupLabel.text = GroupsDataStorage.shared.userGroupsArray[index.row].name
    }
    
    func configGlobalGroupsCell(index: IndexPath) {
        if let avatar = GroupsDataStorage.shared.globalGroupsArray[index.row].avatar {
           // groupAvatar.image = avatar
        } else { groupAvatar.image = UIImage(named: "noGroupAvatarImage")}
        groupLabel.text = GroupsDataStorage.shared.globalGroupsArray[index.row].name
    }
    
    func configSearchedGroupsCell(index: IndexPath) {
        if let avatar = searchedGroups[index.row].avatar {
           // groupAvatar.image = avatar
        } else { groupAvatar.image = UIImage(named: "noGroupAvatarImage")}
        groupLabel.text = searchedGroups[index.row].name
    }
    
    func pushAnimation() {
        self.groupAvatar.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.groupAvatar.transform = .identity
        }, completion: nil)
    }
}
