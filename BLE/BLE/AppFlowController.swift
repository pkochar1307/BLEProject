//
//  AppFlowController.swift
//  BLE
//
//  Created by MacMini03 on 17/09/19.
//  Copyright © 2019 MacMini03. All rights reserved.
//

import UIKit
class AppFlowController {
    let window: UIWindow
    var central: BLECentral?
    
    
    init(window: UIWindow){
        self.window = window
    }
    func start()
    {
        central = BLECentral()
        
        let viewController = DiscoveryViewController()
        viewController.central = central
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        //window.rootViewController = viewController
        //window.makeKeyAndVisible()
        //central = BLECentral()
        
        //1.rest to be done after connecting the device
        
    }
}
