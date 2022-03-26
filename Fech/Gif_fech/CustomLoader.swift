//
//  CustomLoader.swift
//  Fech
//
//  Created by MAC on 18/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    var viewColor: UIColor = .black
    var setAlpha: CGFloat = 0.5
    var gifName: String = ""
    
    lazy var loaderView: UIView = {
        let gifSuperView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        gifSuperView.backgroundColor = .white
        gifSuperView.isUserInteractionEnabled = false
        return gifSuperView
    }()
    
    lazy var gifImage: UIImageView = {
        var gifImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 110))
        self.addSubview(gifImage)
        gifImage.contentMode = .scaleAspectFit
        gifImage.center = loaderView.center
        gifImage.isUserInteractionEnabled = false
        gifImage.loadGif(name: gifName)
        return gifImage
    }()
    
    func showLoaderView() {
        self.addSubview(self.loaderView)
        self.loaderView.addSubview(self.gifImage)
        self.loaderView.bringSubviewToFront(self.gifImage)
        UIApplication.shared.keyWindow?.addSubview(loaderView)
        
    }
    
    func hideLoaderView() {
        self.loaderView.removeFromSuperview()
    }
    
}
