//
//  ImageDetailViewController .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 07.02.2023.
//

import UIKit

class ImageDetailViewController: UIViewController, Storyboarded {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
        
    var imageDetailViewModel: ImageDetailViewModelProtocol! 
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = configureLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.scrollToItem(
            at: IndexPath(item: imageDetailViewModel.currentImage, section: 0),
            at: .left,
            animated: false)
        }
    
    // MARK: - @IBAction
    
    @IBAction func prevButtonTapped(_ sender: UIButton) {
        guard let index = getIndexPath() else { return }
                
        imageDetailViewModel.prevButtonTapped(index: index) { index in
            collectionView.scrollToItem(
                at: IndexPath(item: index, section: 0),
                at: .right,
                animated: true)
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let index = getIndexPath() else { return }
        
        imageDetailViewModel.nextButtonTapped(index: index) { index in
            collectionView.scrollToItem(
                at: IndexPath(item: index, section: 0),
                at: .right,
                animated: true)
        }
    }
    
    @IBAction func sourceButtonTapped(_ sender: UIButton) {
        guard let index = getIndexPath() else { return }
        
        imageDetailViewModel.sourceButtonTapped(index: index)
    }

    // MARK: - Helpers
    
    func getIndexPath() -> IndexPath? {
        collectionView.indexPath(for: collectionView.visibleCells.first ?? UICollectionViewCell())
    }
    
    private func configureLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16,
                                                     bottom: 8, trailing: 16)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .paging
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ImageDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageDetailViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageDetailCell.reuseIdentifier,
            for: indexPath) as! ImageDetailCell

        cell.imageDetailCellViewModel = imageDetailViewModel.imageDetailCellViewModel(at: indexPath)
    
        return cell
    }
}
