//
//  NewsAPI.swift
//  SampleList
//
//  Created by Santos Ramon on 3/5/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol APIProtocol {
    func fetchAll(completion: @escaping (JSON?, Error?) -> Void)
}

class NewsAPI: APIProtocol {
    
    func fetchAll(completion: @escaping (JSON?, Error?) -> Void) {
        Alamofire.request(URLManager.newsList).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
