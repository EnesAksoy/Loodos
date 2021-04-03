//
//  SearchModel.swift
//  Loodos
//
//  Created by ENES AKSOY on 3.04.2021.
//

import Foundation

struct SearchModel: Codable { 
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title", year = "Year", imdbID, type = "Type", poster = "Poster"
    }
}
