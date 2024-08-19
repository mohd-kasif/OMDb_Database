//
//  RatingView.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 18/08/24.
//

import UIKit

class RatingView: UIView {
    
    var starImageView = UIImageView(image: UIImage(systemName: "star.fill"))
    var ratingLabel = OMDbBodyLabel(alignement: .right)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func setupUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds=true
        layer.cornerRadius = 3
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 1.0
        backgroundColor = .systemYellow.withAlphaComponent(0.8)

        starImageView.translatesAutoresizingMaskIntoConstraints = false
        starImageView.tintColor = .black.withAlphaComponent(0.6)
        ratingLabel.textColor = .black
        addSubview(starImageView)

        addSubview(ratingLabel)

        NSLayoutConstraint.activate([
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            starImageView.widthAnchor.constraint(equalToConstant: 15),
            starImageView.heightAnchor.constraint(equalToConstant: 15),
        ])

        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 4),
            ratingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])

    }

}
