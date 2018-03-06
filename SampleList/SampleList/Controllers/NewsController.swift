//
//  NewsController.swift
//  SampleList
//
//  Created by Santos Ramon on 3/1/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation

class NewsController {
    var cache = [ArticleModel]()
    var newsAPI:APIProtocol
    
    init() {
        newsAPI = NewsAPI()
    }
    
    func loadNews(completion: @escaping ([ArticleModel]?, Error?) -> Void) {
        newsAPI.fetchAll { [weak self] (json, error) in
            if error != nil {
                completion(nil, error)
            } else {
                var items = [ArticleModel]()
                for (_, JSON) in json! {
                    let item = ArticleModel(json: JSON)
                    items.append(item)
                }
                self?.cache = items
                completion(items, nil)
            }
        }
    }
}
