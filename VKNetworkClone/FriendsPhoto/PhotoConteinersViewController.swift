//
//  PhotoConteinersViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 30.04.2021.
//

import UIKit

class PhotoConteinersViewController: UIViewController {
    
    @IBOutlet weak var photoConteinerGallery: PhotoConteiner!
    
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoConteinerGallery.setImages(images: images)
        
    }
}
