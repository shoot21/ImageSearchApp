//
//  ViewController.swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 06.02.2023.
//

import UIKit

class SearchImageViewController: UIViewController, Storyboarded {
    
    // MARK: - Constant
    
    private let inset: CGFloat = 2
        
    // MARK: - @IBOutlet
    
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    
    var searchImageViewModel: SearchImageViewModelProtocol!
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        activityIndicator.isHidden = true
        searchBar.delegate = self
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        imagesCollectionView.collectionViewLayout = configureLayout()
    }
    
    // MARK: - Helpers
    
    func configureLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: inset, leading: inset,
                                                     bottom: inset, trailing: inset)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension SearchImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        searchImageViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier,
            for: indexPath) as! ImageCollectionViewCell
        
        cell.imageViewModel = searchImageViewModel.imageViewModel(at: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchImageViewModel.didSelectRow(at: indexPath)
    }
}

// MARK: - UISearchBarDelegate

extension SearchImageViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let flag = searchImageViewModel.checkSearchText(searchText: searchText) { [weak self] in
            self?.activityIndicator.isHidden = true
        }
        
        guard flag == true else { return }
        
        imagesCollectionView.reloadData()
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        searchImageViewModel.fetchImages(searchText: searchText) { [weak self] in
            self?.imagesCollectionView.reloadData()
            self?.activityIndicator.stopAnimating()
        }
        
    }
}

