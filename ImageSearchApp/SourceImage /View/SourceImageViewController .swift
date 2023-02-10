//
//  SourceImageViewController .swift
//  ImageSearchApp
//
//  Created by Никита Иващенков on 09.02.2023.
//

import UIKit
import WebKit

class SourceImageViewController: UIViewController, Storyboarded {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Properties
    
    var sourceImageViewModel: SourceImageViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sourceImageViewModel.loadRequest { [weak self] request in
            self?.webView.load(request)
        }
    }
}
