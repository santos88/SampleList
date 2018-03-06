//
//  NewsController.swift
//  SampleList
//
//  Created by Santos Ramon on 3/1/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NewsController {
    var cache = [ArticleModel]()
    
    func loadNews(completion: @escaping ([ArticleModel]?, Error?) -> Void) {
        Alamofire.request(URLManager.newsList).responseJSON { [weak self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for (_, JSON) in json {
                    self?.cache.append(ArticleModel(json: JSON))
                }
                completion(self?.cache, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
