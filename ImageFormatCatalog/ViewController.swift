//
//  ViewController.swift
//  ImageFormatCatalog
//
//  Created by 能登 要 on 2019/05/25.
//  Copyright © 2019 能登 要. All rights reserved.
//

import UIKit
import SDWebImage
import SDWebImageWebPCoder

typealias LoadImageCompletion = ((UIImage? , Error?) -> Void)

enum LoadType
{
    case jpeg
    case webp
    
    func bundleType() -> String {
        switch self {
        case .jpeg:
            return "jpg"
        case .webp:
            return "webp"
        }
    }
}

class ViewController: UIViewController {

    let temporaryView = UIImageView(frame: CGRect.zero)
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add coder
        let WebPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(WebPCoder)
    }
    
    @IBAction func onLoadWebP(_ sender: Any) {
        loadWebPImage(.webp) { [unowned self] (image, error) in
            self.imageView.image = image
        }
    }
    
    @IBAction func onLoadJpeg(_ sender: Any) {
        loadWebPImage(.jpeg) { [unowned self] (image, error) in
            self.imageView.image = image
        }
    }
    
    func loadWebPImage(_ loadType:LoadType, completion:@escaping LoadImageCompletion) {
        if let path = Bundle.main.path(forResource: "SapporoStation", ofType: loadType.bundleType() ) {
            let fileURL = URL(fileURLWithPath: path)
            temporaryView.sd_setImage(with: fileURL) { (image, error, cacheType, url) in
                completion(image,error)
            }
        }
    }

}

