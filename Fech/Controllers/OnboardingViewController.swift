//
//  OnboardingViewController.swift
//  Fech
//
//  Created by MAC on 22/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var OnboadingCollectionView: UICollectionView!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0
    
//    var currentPage = 0 {
//           didSet {
//               pageControl.currentPage = currentPage
//               if currentPage == slides.count - 1 {
//                   nextBtn.setTitle("Get Started", for: .normal)
//               } else {
//                   nextBtn.setTitle("Next", for: .normal)
//               }
//           }
//       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
                OnboardingSlide(title: "Quick and Secure", description: "Enjoy quick payment and secure access to our pool of dumps.", image: #imageLiteral(resourceName: "fech_logo-4")),
                OnboardingSlide(title: "Unlimited Dumps and Questions", description: "Enjoy unlimited access to varieties of dumps in several categories.", image: #imageLiteral(resourceName: "fech_logo-2")),
                OnboardingSlide(title: "Assured Success", description: "Success all in with our dumps.", image: #imageLiteral(resourceName: "fech_logo-3"))
            ]
            
//            pageControl.numberOfPages = slides.count
        
        OnboadingCollectionView.delegate = self
        OnboadingCollectionView.dataSource = self

        
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = OnboadingCollectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
            cell.setup(slides[indexPath.row])
            return cell
        
    }
    
    func OnboadingCollectionView(_ OnboadingCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: OnboadingCollectionView.frame.width, height: OnboadingCollectionView.frame.height)
    }
    
    // this is to let the image on the obording screen to conform or give fit as the size is designed
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        // this alone could make ur page control not to work 
    }
    // this enable us to see the pageController dent ink to scroll as we scroll the page in actual sense.
    
}


