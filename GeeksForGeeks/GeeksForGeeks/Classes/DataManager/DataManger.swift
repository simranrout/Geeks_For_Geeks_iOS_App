//
//  DataManger.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import Foundation
import UIKit
class DataManager {
    
    static let sharedInstance = DataManager()
    
    /// Make private init
    private init() {}
    
    func parseJSON() -> [NewsDataModelComponent]? {
        ///created json path
        guard let jsonFilePath = Bundle.main.path(forResource: "NewsJSON", ofType: "json") else {
            return nil
        }
        
        let decoder = JSONDecoder()
        do {
            ///converted json to data
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath))
            ///converted json data to struct
            let newsData = try decoder.decode(NewsDataModel.self, from: jsonData)
            ///returing item property of parsed struct
            return newsData.items
        } catch {
            return nil
        }
    }
    
    func load(url: URL?) -> UIImage? {
        guard let url = url else {
            return UIImage(named: "gfg")
        }

        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                   return image
            }
        }
        return UIImage(named: "gfg")
    }
}
