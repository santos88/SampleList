//
//  NewsTableViewCell.swift
//  SampleList
//
//  Created by Santos Ramon on 3/1/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsTableViewCell: UITableViewCell {

    let downloader = ImageDownloader()
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var titleLeading: NSLayoutConstraint!
    @IBOutlet weak var descriptionLeading: NSLayoutConstraint!
    
    func configure(article:ArticleModel) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description
        if let image = article.image {
            newsImage.af_setImage(withURL: URL(string: image)!)
            titleLeading.constant = 93
            descriptionLeading.constant = 93
        } else {
            titleLeading.constant = 16
            descriptionLeading.constant = 16
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
