//
//  NetworkProtocol .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 06.02.2023.
//

import Foundation

protocol API {
    
    var scheme: HTTPScheme { get }
    
    var baseURL: String { get }
    
    var path: String { get }
    
    var parameters: [URLQueryItem] { get }
    
    var method: HTTPMethod { get }
}
