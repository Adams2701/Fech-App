//
//  DashboardConstant .swift
//  Fech
//
//  Created by MAC on 02/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

struct Dashboard {
    var screenName: String = ""
    var image: String = ""
    var imageDescp: String = ""
    var bgColor: UIColor?
    
    
    init(screenName: String, image: String, imageDescp: String, bgColor: UIColor? ) {
        
        self.screenName = screenName
        self.image = image
        self.imageDescp = imageDescp
        self.bgColor = bgColor
    }
    
}
