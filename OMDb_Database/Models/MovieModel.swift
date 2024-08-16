//
//  MovieModel.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import Foundation

//MARK: - Movie Search Model
struct Movie:Codable,Hashable{
    var search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
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
