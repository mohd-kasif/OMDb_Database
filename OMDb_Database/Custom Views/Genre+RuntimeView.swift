//
//  Genre+RuntimeView.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 19/08/24.
//

import UIKit

class Genre_RuntimeView: UIView {
    var genreLabel=OMDbBodyLabel(alignement: .left)
    var runtimeLabel=OMDbBodyLabel(alignement: .left)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        translatesAutoresizingMaskIntoConstraints=false
        genreLabel.textColor = .secondaryLabel.withAlphaComponent(0.6)
        runtimeLabel.textColor = .secondaryLabel.withAlphaComponent(0.6)
        addSubview(genreLabel)
        addSubview(runtimeLabel)
        
        // conatriant
        
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: topAnchor),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -15),
            
            runtimeLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 5),
            runtimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            runtimeLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
