//
//  Extension.swift
//  GeeksForGeeks
//
//  Created by Simran Rout on 26/05/22.
//

import Foundation
import UIKit

internal extension String {
    
    /**
    - localized String
     */
    
    var localizedString: String {
        var result = Bundle.main.localizedString(forKey: self, value: nil, table: nil)

        if result == self {
            result = Bundle.main.localizedString(forKey: self, value: nil, table: "GlobalText")
        }

        return result
    }

    
    func convertToDate(format: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  "YYYY-mm-dd HH:mm:ss"
        let date =  dateFormatter.date(from: self)
        
        guard let date = date else {
            return self
        }
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
