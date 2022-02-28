//
//  OnboardingCollectionViewCell.swift
//  Fech
//
//  Created by MAC on 22/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
//    static let identifier:String = "OnboardingCollectionViewCell"
//    private let cellIdentifier = "Picture"
//    private let detailViewIdentifier = "Detail"
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)

    @IBOutlet weak var slideImageView: UIImageView!
       @IBOutlet weak var slideTitleLbl: UILabel!
       @IBOutlet weak var slideDescriptionLbl: UILabel!
      
    
    func setup(_ slid: OnboardingSlide) {
        slideImageView.image = slid.image
        slideTitleLbl.text = slid.title
        slideDescriptionLbl.text = slid.description
    }
}
