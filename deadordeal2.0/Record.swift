//
//  Record.swift
//  deadordeal2.0
//
//  Created by imac on 26/04/24.
//

import UIKit

class Record: NSObject {
    var nombres: [String]
    var puntos: [Int]
    static var records: Record!
    
    
    override init()
    {
        nombres = ["Vicky","Kiara","Kassy","Cepillin","Vita Uva"]
        puntos = [200000,100000,50000,30000,20000]
    }
    
    static func sharedRecords() -> Record
    {
        if records == nil
        {
            records = Record.init()
        }
        return records
    }
    func save() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(nombres, forKey: "nombres")
        userDefaults.set(puntos, forKey: "puntos")
        userDefaults.synchronize()
    }
    func load() {
        let userDefaults = UserDefaults.standard
        nombres = [String(userDefaults.string(forKey: "nombres") ?? "")]
        puntos = [Int(userDefaults.integer(forKey: "puntos"))]
    }
}
