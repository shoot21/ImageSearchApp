//
//  Image.swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 06.02.2023.
//

import Foundation

struct ImageResult: Decodable {
    
    let imagesResults: [Image]
    
    enum CodingKeys: String, CodingKey {
        case imagesResults = "images_results"
    }
}

struct Image: Decodable {
    let position: Int
    let thumbnail: String
    let source: String
    let title: String
    let link: String
    let original: String
    let originalWidth: Int
    let originalHeight: Int
    let isProduct: Bool
    
    enum CodingKeys: String, CodingKey {
        case position, thumbnail, source, title, link, original
        case originalWidth = "original_width"
        case originalHeight = "original_height"
        case isProduct = "is_product"
    }
}

struct ImageDetail {
    let images: [Image]
    let currentIndex: Int
}
