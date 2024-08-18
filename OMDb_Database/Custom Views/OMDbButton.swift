//
//  OMDbButton.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class OMDbButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code here
        setupButtonUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title:String, color:UIColor){
        self.init(frame: .zero)
        configButton(background: color, title: title)
    }
    
    private func setupButtonUI(){
//        layer.cornerRadius=10
        configuration = .tinted()
        configuration?.cornerStyle = .medium
//        setTitleColor(.white, for: .normal)
//        titleLabel?.font=UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints=false
    }
    
    func configButton(background:UIColor, title:String){
        configuration?.baseBackgroundColor = background
        configuration?.baseForegroundColor = background
        configuration?.title=title
    }
}
