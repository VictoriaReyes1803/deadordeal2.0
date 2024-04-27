//
//  Maletin.swift
//  deadordeal2.0
//
//  Created by imac on 23/04/24.
//

import UIKit

class Maletin: NSObject {
    var cantidad : Int

        static var maletinData: Maletin!

        override init() {
            self.cantidad = 0
            
        }

        static func sharedData() -> Maletin {
            if maletinData == nil {
                maletinData = Maletin()
            }

            return maletinData
        }
        
    
    func save() {
           let userDefaults = UserDefaults.standard
           userDefaults.set(cantidad, forKey: "cantidad")
           userDefaults.synchronize()
       }

       func load() {
           let userDefaults = UserDefaults.standard
           cantidad = userDefaults.integer(forKey: "cantidad")
       }

    func guardarCantidadIndex(_ cantidad: Int) {
                self.cantidad = cantidad
                save()
        }
     
}
