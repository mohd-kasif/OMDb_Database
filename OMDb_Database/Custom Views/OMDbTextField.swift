//
//  OMDbTextField.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class OMDbTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        translatesAutoresizingMaskIntoConstraints=false
        layer.cornerRadius=10
        layer.borderWidth=1
        layer.borderColor=UIColor.systemGray4.cgColor
        textColor = .label
        tintColor = .label
        font=UIFont.preferredFont(forTextStyle: .headline)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        leftView=paddingView
        leftViewMode = .always
        minimumFontSize=12
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        placeholder="Enter movie name"
        returnKeyType = .search
    }

}
