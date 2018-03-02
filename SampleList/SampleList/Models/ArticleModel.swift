//
//  ArticleModel.swift
//  SampleList
//
//  Created by Santos Ramon on 3/1/18.
//  Copyright © 2018 Santos Ramon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ArticleModel {
    var title:String?
    var description:String?
    var image:String?
    
    init(json:JSON) {
        title = json["title"].string
        description = json["description"].string
        image = json["image"].string
    }
}
