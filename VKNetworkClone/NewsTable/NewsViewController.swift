//
//  NewsViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 25.04.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    let newsCellNib = UINib(nibName: "NewsTableViewCell", bundle: nil)
    
    let newsCellIdentifier = "newsCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.register(newsCellNib, forCellReuseIdentifier: newsCellIdentifier)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsDataStorage.shared.newsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellIdentifier, for: indexPath) as! NewsTableViewCell
        
        cell.configNewsCell(index: indexPath)
    
        return cell
    }
    
}



extension NewsViewController: UITableViewDelegate {
    
    
}
