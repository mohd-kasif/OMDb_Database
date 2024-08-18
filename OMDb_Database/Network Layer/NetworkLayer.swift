//
//  NetworkLayer.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import Foundation
import UIKit

final class NetworkLayer{
    static let shared=NetworkLayer()
    var cache=NSCache<NSString, UIImage>()
    private init(){}
    
    func getMovieList(name:String, page:Int, completion:@escaping (Result<Movie,OmDbError>)->Void){
        guard let url=URL(string:APIEndpoints.baseUrl+"\(APIKey.key)&s=\(name)&page=\(page)") else {
            completion(.failure(.invlaidUrl))
            return
        }
        let dataTask=URLSession.shared.dataTask(with: url){data, response, error in
            if let _ = error{
                completion(.failure(.serverError))

            }
            guard let data=data, let response=response as? HTTPURLResponse else {
                completion(.failure(.invalidData))
                return
            }
            
            if response.statusCode==200{
                do{
                    let decodedMovie=try JSONDecoder().decode(Movie.self, from: data)
                    completion(.success(decodedMovie))
                } catch let error {
                    print(error)
                    completion(.failure(.failedSerialization))
                }
            } else {
                completion(.failure(.invalidData))
            }
        }
        dataTask.resume()
    }
    
    func fetchMoviewDetail(withID imdbId:String, completion:@escaping (Result<MovieDetailModel, OmDbError>)->Void){
        guard let url=URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(APIKey.key)") else {
            return completion(.failure(.invlaidUrl))
        }
        
        let dataTask=URLSession.shared.dataTask(with: url){data, response, error in
            if let _ = error{
                completion(.failure(.serverError))

            }
            guard let data=data, let response=response as? HTTPURLResponse else {
                completion(.failure(.invalidData))
                return
            }
            
            if response.statusCode==200{
                do{
                    let decodedMovie=try JSONDecoder().decode(MovieDetailModel.self, from: data)
                    completion(.success(decodedMovie))
                } catch let error {
                    print(error)
                    completion(.failure(.failedSerialization))
                }
            } else {
                completion(.failure(.invalidData))
            }
        }
        dataTask.resume()
    }
}
