//
//  ImageCollectionViewCell .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 07.02.2023.
//

import UIKit
import SDWebImage

class ImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Static properties
    
    static let reuseIdentifier = String(describing: ImageCollectionViewCell.self)
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var searchImageView: UIImageView!
    
    // MARK: - Properties
    
    var imageViewModel: ImageViewModelProtocol! {
        didSet {
            searchImageView.sd_setImage(with: imageViewModel.imageURL,
                                        placeholderImage: UIImage(named: "no-pictures"))
        }
    }
}
