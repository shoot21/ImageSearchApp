//
//  GoogleImageAPI.swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 06.02.2023.
//

import Foundation

enum GoogleImageAPI: API {
    
    case getImages(searchText: String?)
    
    private static var apiKey: String {
        "375a1fc65cdf083a9a72cb508c0f800a2a27412c40f956ac883b926a8bd212fe"
    }
    
    private static var engine: String {
        "google"
    }
    
    private static var deviceType: String {
        "mobile"
    }
    
    private static var tmb: String {
        "isch"
    }
    
    private static var ijn: String {
        "\(0)"
    }
    
    var scheme: HTTPScheme {
        switch self {
        case .getImages:
            return .https
        }
    }
    
    var baseURL: String {
        switch self {
        case .getImages:
            return "serpapi.com"
        }
    }
    
    var path: String {
        switch self {
        case .getImages:
            return "/search.json"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getImages(let query):
            var params = [
                URLQueryItem(name: "engine", value: GoogleImageAPI.engine),
                URLQueryItem(name: "device", value: GoogleImageAPI.deviceType),
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "tbm", value: GoogleImageAPI.tmb),
                URLQueryItem(name: "ijn", value: GoogleImageAPI.ijn),
                URLQueryItem(name: "api_key", value: GoogleImageAPI.apiKey)
            ]
            if let query = query {
                params.append(URLQueryItem(name: "keyword", value: query))
            }
            return params
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getImages:
            return .get
        }
    }
}
