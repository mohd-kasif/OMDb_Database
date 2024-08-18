//
//  MovieModel.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import Foundation

//MARK: - Movie List Model
struct Movie:Codable,Hashable{
    var search: [Search]?
    let response: String
    let totalResults:String?
    let error:String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
        case error="Error"
    }
}

struct Search:Codable, Hashable{
    let title:String
    let year:String
    let imdbID:String
    let type:String
    let poster:String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

//MARK: - Movie Detail Model
struct MovieDetailModel: Codable {
    let title, released: String
    let director: String
    let plot: String
    let poster: String
    let imdbRating: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case director = "Director"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating
    }
}
