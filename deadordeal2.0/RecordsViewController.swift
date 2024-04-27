//
//  RecordsViewController.swift
//  deadordeal2.0
//
//  Created by imac on 25/04/24.
//

import UIKit

class RecordsViewController: UIViewController {
    
    var records = Record.sharedRecords()
    @IBOutlet weak var lblTop1: UILabel!
    
    @IBOutlet weak var lblTop2: UILabel!
    @IBOutlet weak var lblTop3: UILabel!
    @IBOutlet weak var lblTop4: UILabel!
    @IBOutlet weak var lblTop5: UILabel!
    
    
    @IBOutlet weak var lblPuntos1: UILabel!
    @IBOutlet weak var lblPuntos2: UILabel!
    @IBOutlet weak var lblPuntos3: UILabel!
    @IBOutlet weak var lblPuntos4: UILabel!
    @IBOutlet weak var lblPuntos5: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(records.nombres)
        print(records.puntos)
        nombres()
        puntos()
        // Do any additional setup after loading the view.
    }
    
    func nombres()
    {
        var nombres = records.nombres
        if nombres.count >= 1 { lblTop1.text = nombres[0] } else { lblTop1.text = "" }
            if nombres.count >= 2 { lblTop2.text = nombres[1] } else { lblTop2.text = "" }
            if nombres.count >= 3 { lblTop3.text = nombres[2] } else { lblTop3.text = "" }
            if nombres.count >= 4 { lblTop4.text = nombres[3] } else { lblTop4.text = "" }
            if nombres.count >= 5 { lblTop5.text = nombres[4] } else { lblTop5.text = "" }
    }
    
    func puntos()
    {
        var puntos = records.puntos
        
        if puntos.count >= 1 { lblPuntos1.text = "$\(puntos[0])" } else { lblPuntos1.text = "" }
            if puntos.count >= 2 { lblPuntos2.text = "$\(puntos[1])" } else { lblPuntos2.text = "" }
            if puntos.count >= 3 { lblPuntos3.text = "$\(puntos[2])" } else { lblPuntos3.text = "" }
            if puntos.count >= 4 { lblPuntos4.text = "$\(puntos[3])" } else { lblPuntos4.text = "" }
            if puntos.count >= 5 { lblPuntos5.text = "$\(puntos[4])" } else { lblPuntos5.text = "" }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
