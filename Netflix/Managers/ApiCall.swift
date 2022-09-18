//
//  ApiCall.swift
//  Netflix
//
//  Created by Mehmet Ergün on 2022-09-17.
//

import Foundation

struct Constants {
    static let API_KEY = "c893a0fd4c887738808d86da788986ae"
    static let base_URL = "https://api.themoviedb.org"
}

enum ApiError: Error {
    case failedToGetData
}

class ApiCall {
    static let shared = ApiCall()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.base_URL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.base_URL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.base_URL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.base_URL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
        
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.base_URL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch  {
                completion(.failure(ApiError.failedToGetData))
            }
        }
        task.resume()
    }
}

