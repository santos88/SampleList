//
//  NewsArticleViewController.swift
//  SampleList
//
//  Created by Santos Ramon on 3/1/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsArticleViewController: UIViewController {
    
    var article : ArticleModel?
    
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = article?.title
        descriptionText.text = article?.description
        if let image = article?.image {
            newsImage.af_setImage(withURL: URL(string: image)!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
