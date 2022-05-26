//
//  NewsDataModel.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import Foundation
import SwiftUI

struct NewsDataModel: Codable {
    let items: [NewsDataModelComponent]
}

struct NewsDataModelComponent: Codable, Identifiable {
    var id: Int
    let newsTitle: String?
    let url: String?
    let newsPublishDate: String?
    var image: UIImage?
    
    enum CodingKeys: String, CodingKey {
        case newsTitle = "title"
        case url = "thumbnail"
        case newsPublishDate = "pubDate"
        case id
    }
}
