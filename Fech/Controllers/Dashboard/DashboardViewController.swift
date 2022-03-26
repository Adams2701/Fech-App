//
//  DashboardViewController.swift
//  Fech
//
//  Created by MAC on 02/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    var welcomeNam = ""
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    } // this enabled the the city detail button to reverse back to this screen
    
    
    @IBOutlet var welcomeName: UILabel!
    
    @IBOutlet var welcomeStmt: UILabel!
    
    @IBOutlet var dashboardCollectionView: UICollectionView!
    
    private var dashboard : [Dashboard] = [
        
        Dashboard(screenName: "goToProfile", image: "firstImage", imageDescp: "Profile", bgColor: #colorLiteral(red: 0.8466592122, green: 0.8861318005, blue: 0.7159593925, alpha: 1)),
        Dashboard(screenName: "goToSelectedCategory", image: "thirdImage", imageDescp: "Selected Category", bgColor: #colorLiteral(red: 0.6596965511, green: 0.8861318005, blue: 0.8820784598, alpha: 1)),
        
        Dashboard( screenName: "goToPaymentHistory", image: "secondImage", imageDescp: "Payment History", bgColor: #colorLiteral(red: 0.6241454596, green: 0.8861318005, blue: 0.6435539985, alpha: 1)),
        
        Dashboard(screenName: "goToMyDumps", image: "fourthImage", imageDescp: "My Dumps", bgColor: #colorLiteral(red: 0.5672146654, green: 0.8861318005, blue: 0.8836920423, alpha: 1)),
        Dashboard(screenName: "goToContactUs", image: "fiftImage", imageDescp: "Contact Us", bgColor: #colorLiteral(red: 0.8861318005, green: 0.7630746142, blue: 0.579209222, alpha: 1))
    ]
    
    let persistedData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dashboardCollectionView.delegate = self
        dashboardCollectionView.dataSource = self
        let nameString = persistedData.getUserString(key: K.defaultNameKey)
        print(nameString)
        let nameSplit = nameString.components(separatedBy: " ")
        welcomeNam = nameSplit[0]
        var attachTheIndex = ("Hi \(welcomeNam),")
        welcomeName.text = attachTheIndex
        
    }
    
}

extension DashboardViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashboard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! DashboardCollectionCell
        
        // Configure the cell by getting the properties of it based on what should populate.
        
        let board = dashboard[indexPath.row]
        cell.dashboardImage.image = UIImage(named: board.image)
        cell.dashboardDescrp.text = board.imageDescp
        cell.vieww.backgroundColor = board.bgColor
        
        
        return cell
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // adding the code here to perform action on the cell
        self.goToScreen(segueName: dashboard[indexPath.row].screenName)
        
    }
    
    func goToScreen(segueName: String) {
        performSegue(withIdentifier: segueName, sender: nil)
    }
    
    
}



