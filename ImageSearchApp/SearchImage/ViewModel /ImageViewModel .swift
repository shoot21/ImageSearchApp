//
//  ImageViewModel .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import Foundation

protocol ImageViewModelProtocol {
    
    var imageURL: URL? { get }
    
    init(image: Image)
}

final class ImageViewModel: ImageViewModelProtocol {
    
    // MARK: - Private properties
    
    private let image: Image
    
    // MARK: - Properties
    
    var imageURL: URL? {
        URL(string: image.thumbnail)
    }
    
    required init(image: Image) {
        self.image = image
    }
}
