//
//  SearchImageViewModel .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import Foundation

protocol SearchImageViewModelProtocol {
    
    var searchTask: DispatchWorkItem? { get }

    func checkSearchText(searchText: String, completion: @escaping () -> ()) -> Bool
    func fetchImages(searchText: String, completion: @escaping () -> ())
    func numberOfRows() -> Int
    
    func imageViewModel(at indexPath: IndexPath) -> ImageViewModelProtocol
    func didSelectRow(at indexPath: IndexPath)
}

final class SearchImageViewModel: SearchImageViewModelProtocol {
    
    // MARK: - Private properties
    
    private var images: [Image] = []
    
    private let service: NetworkManager
    
    // MARK: - Properties
    
    var searchTask: DispatchWorkItem?
    
    var coordinator: SearchImageCoordinator?
    
    // MARK: - Init
    
    init(service: NetworkManager) {
        self.service = service
    }
    
    // MARK: - Methods
    
    @discardableResult
    func checkSearchText(searchText: String, completion: @escaping () -> ()) -> Bool {
        if searchText == "" || searchText == " " {
            searchTask?.cancel()
            completion()
            return false
        }
        return true 
    }
    
    func fetchImages(searchText: String, completion: @escaping () -> ()) {
        searchTask?.cancel()
        images.removeAll()
        
        let task = DispatchWorkItem { [weak self] in
            
            let endpoint = GoogleImageAPI.getImages(searchText: searchText)

            self?.service.request(endpoint: endpoint) { [weak self]
                (result: Result<ImageResult, Error>) in
                switch result {
                case .success(let data):
                    self?.images = data.imagesResults
                    completion()
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        searchTask = task
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75, execute: task)
    }
    
    func numberOfRows() -> Int {
        images.count
    }
    
    func imageViewModel(at indexPath: IndexPath) -> ImageViewModelProtocol {
        ImageViewModel(image: images[indexPath.item])
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let imageDetail = ImageDetail(images: images, currentIndex: indexPath.item)
        coordinator?.onSelect(imageDetail)
    }
}
