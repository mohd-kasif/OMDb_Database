//
//  FavButton.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 19/08/24.
//

import UIKit

class FavButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        translatesAutoresizingMaskIntoConstraints=false
        let image=UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        tintColor = .systemRed
        let config=UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        let resize=image?.applyingSymbolConfiguration(config)
        setImage(resize, for: .normal)
    }
}
