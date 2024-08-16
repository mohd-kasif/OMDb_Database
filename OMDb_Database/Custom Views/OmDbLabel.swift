//
//  OmDbLabel.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import Foundation
import UIKit
class OmDbLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    init(alignement:NSTextAlignment, fontSize:CGFloat){
        super.init(frame: .zero)
        self.textAlignment=alignement
        self.font=UIFont.systemFont(ofSize: fontSize, weight: .bold)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        textColor = .label
        adjustsFontSizeToFitWidth=true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints=false
    }

}
