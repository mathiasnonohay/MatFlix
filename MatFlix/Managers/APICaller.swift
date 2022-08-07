//
//  APICaller.swift
//  MatFlix
//
//  Created by Mathias Nonohay on 07/08/22.
//

import Foundation

struct Constants {
    static let API_KEY = "96dd278d45abf85bc179831d48f22e83"
    static let baseURL = "https://api.themoviedb.org "
}


class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
    }
    
}
