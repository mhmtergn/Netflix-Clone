//
//  Movie.swift
//  Netflix
//
//  Created by Mehmet Ergün on 2022-09-17.
//

import Foundation

struct TrendingTitlesResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
    
}
