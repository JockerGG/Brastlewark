//
//  LoaderImageView.swift
//  Brastlewark
//
//  Created by Eduardo García on 13/01/21.
//

import Foundation
import UIKit

class LoaderImageView: UIImageView {
    
    private var imageUrl: String?
    
    func load(url: String) {
        self.imageUrl = url
        
        if let imageCache: UIImage = GetCacheValueInteractor<UIImage>().execute(key: url) {
            self.image = imageCache
            return
        }
        
        LoadImageFromUrlInteractor().execute(url: url) { [weak self] (data) in
            guard let data = data,
                  let image: UIImage = UIImage(data: data) else { return }
            
            SetCacheValueInteractor().execute(key: url, value: image)
            self?.image = image
        }
    }
    
}
