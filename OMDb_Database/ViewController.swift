//
//  ViewController.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import UIKit

class ViewController: UIViewController {
    private var movieList:Movie=Movie(search: [], totalResults: "", response: "")
    var searchController:UISearchController!
    var header=HeaderVC(frame: .zero)
    var name:String="Spiderman"
    var collectionView:UICollectionView!
    var dataSource:UICollectionViewDiffableDataSource<Section, Search>!
    var page:Int=1
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title="Search Movies"
        // Do any additional setup after loading the view.
        
        configCollectionView()
        configDataSource()
//        getMovieList(name: name, page: page)
        header.button.addTarget(self, action: #selector(search), for: .touchUpInside)
    }
    
    @objc func search(){
        guard let text=header.textField.text else {return}
        if !text.isEmpty && text.count>3{
            movieList.search.removeAll()
            getMovieList(name: text, page: page)
        }
    }
    
    func configCollectionView(){
        collectionView=UICollectionView(frame: view.bounds, collectionViewLayout: twoColumnLayOut())
        collectionView.translatesAutoresizingMaskIntoConstraints=false
        view.addSubview(collectionView)
        view.addSubview(header)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.resuseId)
        collectionView.delegate=self

        //constraint
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            header.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
        ])
        
    }
    
    
    func twoColumnLayOut()->UICollectionViewLayout{
        let width=view.bounds.width
        let padding:CGFloat=12
        let minimumItemSpacing:CGFloat=10
        let availableWidth=width-(padding*2)-(minimumItemSpacing*2)
        
        let itemWidth=availableWidth/2
        
        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.sectionInset=UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize=CGSize(width: itemWidth, height: itemWidth+40)
        return flowLayout
    }
    
    func configDataSource(){
        dataSource=UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, movieList)->UICollectionViewCell? in
            
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.resuseId, for: indexPath) as! MovieCell
            cell.configUI(movie: movieList)
            return cell
        })
    }
    
    func getMovieList(name:String, page:Int){
        NetworkLayer.shared.getMovieList(name: name, page: page) {[weak self] result in
            guard let self else {return}
            switch result {
            case .success(let movieList):
                DispatchQueue.main.async {
                    self.movieList.search.append(contentsOf: movieList.search)
                    self.updateData(movie: self.movieList.search)
                }
            case .failure(let failure):
                print(failure, "failure")
            }
        }
        
    }
    
    func updateData(movie:[Search]){
        var snapShot=NSDiffableDataSourceSnapshot<Section, Search>()
        snapShot.appendSections([.main])
        snapShot.appendItems(movie)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
}

extension ViewController:UICollectionViewDelegate, UISearchBarDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell=movieList.search[indexPath.row]
        print(cell, "secledt row")
    }
}

