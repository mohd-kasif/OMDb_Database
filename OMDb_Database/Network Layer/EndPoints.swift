//
//  EndPoints.swift
//  OMDb_Database
//
//  Created by Mohd Kashif on 17/08/24.
//

import Foundation
//https://www.omdbapi.com/?apikey=de089793&s=batman&page=2
enum APIEndpoints{
    static let baseUrl="https://www.omdbapi.com/?apikey="
}

enum OmDbError:String, Error{
    case invlaidUrl="Movie name is invalid. Please provide correct name"
    case serverError="There is some error occur. Please try again"
    case invalidData="Server provide invalid data. Please try again"
    case failedSerialization="Serialiazation failed"
    
}

enum APIKey{
    static let key="de089793"
}
