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
    
    func loadNews(completion: () -> Void) {
        Alamofire.request(URLManager.newsList).responseJSON { response in
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }

    }
}
