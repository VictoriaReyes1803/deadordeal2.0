//
//  Jugador.swift
//  deadordeal2.0
//
//  Created by imac on 23/04/24.
//

import UIKit

class Jugador: NSObject {
var nombre: String
var puntos : Int

    static var userData: Jugador!

    override init() {
        self.nombre = ""
        self.puntos = 0
        
    }

    static func sharedData() -> Jugador {
        if userData == nil {
            userData = Jugador()
        }

        return userData
    }
    
    /*static func recordsFalsos()->[Jugador]
    {
        
    }*/

    func save() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(nombre, forKey: "nombre")
        userDefaults.set(puntos, forKey: "puntos")
        userDefaults.synchronize()
    }

    func load() {
        let userDefaults = UserDefaults.standard
        nombre = userDefaults.string(forKey: "nombre") ?? ""
        puntos = Int(userDefaults.integer(forKey: "puntos"))
    }
    func guardarNombre(_ nombre: String) {
            self.nombre = nombre
            save()
    }
    
    func guardarPuntos(_ puntos: Int)
    {
        self.puntos = puntos
        save()
    }
    
    
}
