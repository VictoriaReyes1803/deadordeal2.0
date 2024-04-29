//
//  Maletin.swift
//  deadordeal2.0
//
//  Created by imac on 23/04/24.
//

import UIKit

class Maletin: NSObject {
    var cantidad : Int
    var oferta: Int

        static var maletinData: Maletin!

        override init() {
            self.cantidad = 0
            self.oferta = 0
            
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
           userDefaults.set(oferta, forKey: "oferta")
           userDefaults.synchronize()
       }

       func load() {
           let userDefaults = UserDefaults.standard
           cantidad = userDefaults.integer(forKey: "cantidad")
           oferta = userDefaults.integer(forKey: "oferta")
       }

    func guardarCantidadIndex(_ cantidad: Int) {
                self.cantidad = cantidad
                save()
        }
    
    func guardarOferta(_ oferta: Int) {
                self.oferta = oferta
                save()
        }
     
}
