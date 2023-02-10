//
//  ImageDetailViewModel .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import Foundation

protocol ImageDetailViewModelProtocol {
    
    var currentImage: Int { get }
    
    func numberOfRows() -> Int
    func prevButtonTapped(index: IndexPath?, completion: (Int) -> ())
    func nextButtonTapped(index: IndexPath?, completion: (Int) -> ())
    func sourceButtonTapped(index: IndexPath)
    
    func imageDetailCellViewModel(at indexPath: IndexPath) -> ImageDetailCellViewModelProtocol
    
    init(imageDetail: ImageDetail)
}

final class ImageDetailViewModel: ImageDetailViewModelProtocol {
    // MARK: - Private properties
    
    private let imageDetail: ImageDetail
    private var url: URL!
    
    // MARK: - Properties
    
    var coordinator: ImageDetailCoordinator? 
    
    var currentImage: Int {
        imageDetail.currentIndex
    }
    
    // MARK: - Init
    
    init(imageDetail: ImageDetail) {
        self.imageDetail = imageDetail
    }
    
    // MARK: - Methods
    
    func numberOfRows() -> Int {
        imageDetail.images.count
    }
    
    func prevButtonTapped(index: IndexPath?, completion: (Int) -> ()) {
        guard let index = index?.item else { return }
        if index < 0 { return }
        completion(index - 1)
    }
    
    func nextButtonTapped(index: IndexPath?, completion: (Int) -> ()) {
        guard let index = index?.item else { return }
        if index > imageDetail.images.count { return }
        completion(index + 1)
    }
    
    func sourceButtonTapped(index: IndexPath) {
        let index = index.item
        let image = imageDetail.images[index]
        
        guard let url = URL(string: image.link) else { return }
        
        self.url = url
        
        coordinator?.onSelect(url: url)
    }
    
    func imageDetailCellViewModel(at indexPath: IndexPath) -> ImageDetailCellViewModelProtocol {
        ImageDetailCellViewModel(image: imageDetail.images[indexPath.item])
    }
}
