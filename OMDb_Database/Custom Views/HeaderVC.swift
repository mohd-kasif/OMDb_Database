//
//  HeaderVC.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class HeaderVC: UIView {
    lazy var button:UIButton={
        let button=UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
    lazy var textField:UITextField={
        let textField=UITextField(frame: .zero)
        textField.placeholder="Enter movie name..."
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints=false
        return textField
    }()
    
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
            
            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.topAnchor.constraint(equalTo: topAnchor),
            button.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    

}
