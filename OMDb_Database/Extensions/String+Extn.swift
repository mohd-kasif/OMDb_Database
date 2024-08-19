//
//  String+Extn.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 19/08/24.
//

import Foundation
extension String{
    func timeHour()->String{
        let trimMinPart=self.replacingOccurrences(of: " min", with: "")
        guard let timeInMinutes=Int(trimMinPart) else {return ""}
        let hour=timeInMinutes/60
        let min=timeInMinutes%60
        return "\(hour)h \(min)min"
    }
}
