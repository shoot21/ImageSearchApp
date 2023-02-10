//
//  ImageDetailCell .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import UIKit
import SDWebImage

class ImageDetailCell: UICollectionViewCell {
    
    // MARK: - Static property
    
    static let reuseIdentifier = String(describing: ImageDetailCell.self)
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var imageDetailView: UIImageView!
    
    // MARK: - Properties
    
    var imageDetailCellViewModel: ImageDetailCellViewModelProtocol! {
        didSet {
            imageDetailView.sd_setImage(with: imageDetailCellViewModel.imageURL,
                                        placeholderImage: UIImage(named: "no-pictures"))
        }
    }
    
    // MARK: - Helpers
}
