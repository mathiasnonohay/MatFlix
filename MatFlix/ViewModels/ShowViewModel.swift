//
//  ShowViewModel.swift
//  MatFlix
//
//  Created by Mathias on 28/02/2023.
//

import Foundation

protocol ShowViewModelProtocol: AnyObject {
}

class ShowViewModel {
    let title: String
    let posterURL: String
    
    init(title: String, posterURL: String) {
        self.title = title
        self.posterURL = posterURL
    }
    
}
