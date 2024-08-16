//
//  MovieCell.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    static let resuseId="MovieCell"
    var avatarImage=OMDBImage(frame: .zero)
    var titleLabel=OmDbLabel(alignement: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(avatarImage)
        addSubview(titleLabel)
        let padding:CGFloat=8
        
        //constraint
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configUI(movie:Search){
        titleLabel.text=movie.title
        avatarImage.downloadImage(url: movie.poster)
    }
    
}
