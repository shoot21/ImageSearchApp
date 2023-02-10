//
//  ImageDetailCellViewModel .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import Foundation

protocol ImageDetailCellViewModelProtocol {
    
    var imageURL: URL? { get }
    
    init(image: Image)
}

final class ImageDetailCellViewModel: ImageDetailCellViewModelProtocol {
    
    
    // MARK: - Private properties
    
    private let image: Image
    
    // MARK: - Properties
    
    var imageURL: URL? {
        URL(string: image.thumbnail)
    }
    
    // MARK: - Init
    
    init(image: Image) {
        self.image = image 
    }
}
