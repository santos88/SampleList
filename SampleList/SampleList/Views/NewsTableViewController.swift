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
    var selectedArticle : ArticleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        newsController.loadNews { [weak self] (data, error) in
            if (error != nil) {
                SVProgressHUD.show(withStatus: error?.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                self?.tableView.reloadData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsIdentifier", for: indexPath) as! NewsTableViewCell
        let model = self.newsController.cache[indexPath.row]
        cell.configure(article: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = self.newsController.cache[indexPath.row]
        performSegue(withIdentifier: "goDetail", sender: self)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "goDetail"{
            let vc = segue.destination as! NewsArticleViewController
            vc.article = selectedArticle
        }
    }

}
