//
//  SourceImageViewModel .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import Foundation

protocol SourceImageViewModelProtocol {
    
    func loadRequest(completion: @escaping (URLRequest) -> ())
    
    init(url: URL)
}

final class SourceImageViewModel: SourceImageViewModelProtocol {
    
    // MARK: - Private properties
    
    private let url: URL
    
    // MARK: - Init
    
    required init(url: URL) {
        self.url = url
    }
    
    // MARK: - Methods
    
    func loadRequest(completion: (URLRequest) -> ()) {
        let urlRequest = URLRequest(url: url)
        completion(urlRequest)
    }
    
}
