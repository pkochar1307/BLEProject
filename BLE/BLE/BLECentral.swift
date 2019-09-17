//
//  BLECentral.swift
//  BLE
//
//  Created by MacMini03 on 17/09/19.
//  Copyright © 2019 MacMini03. All rights reserved.
//

import Foundation
import CoreBluetooth
class BLECentral: NSObject, CBCentralManagerDelegate {
   
     var manager: CBCentralManager!
    var discoveredPeripherals = [CBPeripheral]()
    var onDiscovered: (()->Void)?
    
   override init(){
    super.init()
    manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func scanForPeripherals(){
        manager.scanForPeripherals(withServices: nil, options: nil)
    }
    //CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{
           // print("Central is powered On")
            scanForPeripherals()
        }
        else{
            print("Central is unavailable: \(central.state.rawValue)")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        discoveredPeripherals.append(peripheral)
        onDiscovered?()
    }
   
}
