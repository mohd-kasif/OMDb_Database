//
//  HeaderVC.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class HeaderVC: UIView {
    var button=OMDbButton(title: "Search", color: .systemPurple)
    var textField=OMDbTextField(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints=false
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(textField)
        addSubview(button)
        
        //constraint
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
//            textField.widthAnchor.constraint(equalToConstant: 50),
            
            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    

}
