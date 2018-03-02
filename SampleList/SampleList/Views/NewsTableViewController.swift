//
//  NewsTableViewController.swift
//  SampleList
//
//  Created by Santos Ramon on 3/1/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit
import SVProgressHUD
import AlamofireImage

class NewsTableViewController: UITableViewController {
    var newsController = NewsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        newsController.loadNews { (data, error) in
            if ((error?.localizedDescription) != nil) {
                SVProgressHUD.show(withStatus: error?.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsController.cache.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsIdentifier", for: indexPath)
        let model = self.newsController.cache[indexPath.row]
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.description
        cell.imageView?.af_setImage(withURL: URL(string: model.image!)!)
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "goDetail"{
            
        }
    }

}
