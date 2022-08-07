//
//  APICaller.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 07/08/22.
//

import Foundation

struct Constants {
    static let API_KEY = "96dd278d45abf85bc179831d48f22e83"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

enum ShowType: String {
    case all
    case movie
    case tv
    case person
}

class APICaller {
    static let shared = APICaller()
    
    func getTrending(type: ShowType, completion: @escaping (Result<[Show], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/\(type)/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(ShowList.self, from: data)
                print(results.results[0])
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Show], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(ShowList.self, from: data)
                print(results.results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopular(type: ShowType, completion: @escaping (Result<[Show], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/\(type)/popular?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(ShowList.self, from: data)
                print(results.results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTopRated(type: ShowType, completion: @escaping (Result<[Show], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/\(type)/top_rated?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(ShowList.self, from: data)
                print(results.results)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
