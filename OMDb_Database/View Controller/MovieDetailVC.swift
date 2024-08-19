//
//  MovieDetailVC.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class MovieDetailVC: UIViewController {
    var movieDetail:MovieDetailModel!
    var moviePoster=OMDBImage(frame: .zero)
    var moviePosterConatiner=UIView()
    var movieTitle=OmDbLabel(alignement: .left, fontSize: 20)
    var director=OMDbBodyLabel(alignement: .left)
    var plot=OMDbBodyLabel(alignement: .left)
    var releaseDate=OMDbBodyLabel(alignement: .left)
    var ratingView=RatingView(frame: .zero)
    var plotLabel=OmDbLabel(alignement: .left, fontSize: 20)
    var detailContainer=UIView()
    var favButton=FavButton(frame: .zero)
    var genreRuntimeView=Genre_RuntimeView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title="Detail"
        setupUI()
        setupDetailView()
    }
    init(imdbID:String){
        super.init(nibName: nil, bundle: nil)
        getMovieDetail(withID: imdbID)
    }
    
    func setupDetailView(){
        detailContainer.backgroundColor = .systemBackground
        detailContainer.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(detailContainer)
        detailContainer.addSubview(movieTitle)
        detailContainer.addSubview(ratingView)
        detailContainer.addSubview(plotLabel)
        detailContainer.addSubview(plot)
        detailContainer.addSubview(genreRuntimeView)
        detailContainer.addSubview(favButton)
        
        let padding:CGFloat=20
        
        NSLayoutConstraint.activate([
            detailContainer.topAnchor.constraint(equalTo: moviePosterConatiner.bottomAnchor, constant: 10),
            detailContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            detailContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            detailContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            movieTitle.topAnchor.constraint(equalTo: detailContainer.topAnchor, constant: 20),
            movieTitle.leadingAnchor.constraint(equalTo: detailContainer.leadingAnchor),
            movieTitle.trailingAnchor.constraint(lessThanOrEqualTo: detailContainer.trailingAnchor, constant: -10),
            
            genreRuntimeView.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10),
            genreRuntimeView.leadingAnchor.constraint(equalTo: detailContainer.leadingAnchor),
            
            favButton.centerYAnchor.constraint(equalTo: genreRuntimeView.centerYAnchor),
            favButton.leadingAnchor.constraint(equalTo: genreRuntimeView.trailingAnchor, constant: 10),
            favButton.trailingAnchor.constraint(equalTo: ratingView.leadingAnchor, constant: -10),
            
            ratingView.centerYAnchor.constraint(equalTo: favButton.centerYAnchor),
            ratingView.trailingAnchor.constraint(equalTo: detailContainer.trailingAnchor),
            ratingView.widthAnchor.constraint(equalToConstant: 60),
            ratingView.heightAnchor.constraint(equalToConstant: 30),
            
            plotLabel.topAnchor.constraint(equalTo: genreRuntimeView.bottomAnchor, constant: 10),
            plotLabel.leadingAnchor.constraint(equalTo: detailContainer.leadingAnchor),
            
            plot.topAnchor.constraint(equalTo: plotLabel.bottomAnchor, constant: 5),
            plot.leadingAnchor.constraint(equalTo: detailContainer.leadingAnchor),
            plot.trailingAnchor.constraint(equalTo: detailContainer.trailingAnchor,constant: -10)
        ])
    }
    
    func setupUI(){
        moviePosterConatiner.translatesAutoresizingMaskIntoConstraints=false
        moviePosterConatiner.layer.shadowColor=UIColor.systemGray.cgColor
        moviePosterConatiner.layer.shadowOpacity=0.8
        moviePosterConatiner.layer.shadowOffset=CGSize(width: 2, height: 6)
        moviePosterConatiner.layer.shadowRadius=3
        moviePosterConatiner.layer.masksToBounds=false
        
        moviePosterConatiner.addSubview(moviePoster)
        plotLabel.text="Plot"
        
        view.addSubview(moviePosterConatiner)
        
        //constraint
        
        NSLayoutConstraint.activate([
            moviePoster.topAnchor.constraint(equalTo: moviePosterConatiner.topAnchor),
            moviePoster.leadingAnchor.constraint(equalTo: moviePosterConatiner.leadingAnchor),
            moviePoster.trailingAnchor.constraint(equalTo: moviePosterConatiner.trailingAnchor),
            moviePoster.bottomAnchor.constraint(equalTo: moviePosterConatiner.bottomAnchor),
            
            moviePosterConatiner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            moviePosterConatiner.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            moviePosterConatiner.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            moviePosterConatiner.heightAnchor.constraint(equalToConstant: 250),
            
            
        ])
    }
    
    func getMovieDetail(withID imdbID:String){
        showLoadingView()
        NetworkLayer.shared.fetchMoviewDetail(withID: imdbID) {[weak self] result in
            guard let self else {return}
            dismissLoadingView()
            switch result {
            case .success(let detail):
                DispatchQueue.main.async {
                    self.movieDetail=detail
                    self.configUI(withDetail: self.movieDetail)
                }
            case .failure(let failure):
                print(failure, "error in moview detail")
            }
        }
    }
    
    func configUI(withDetail detail:MovieDetailModel){
        moviePoster.downloadImage(url: detail.poster)
        movieTitle.text=detail.title+" ("+"\(detail.year)"+")"
        genreRuntimeView.genreLabel.text=detail.genre
        genreRuntimeView.runtimeLabel.text=detail.runtime.timeHour()
        ratingView.ratingLabel.text=detail.imdbRating
        plot.text=detail.plot
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
