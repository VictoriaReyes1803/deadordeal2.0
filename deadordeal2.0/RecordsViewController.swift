//
//  RecordsViewController.swift
//  deadordeal2.0
//
//  Created by imac on 25/04/24.
//

import UIKit

class RecordsViewController: UIViewController {

    var records = Record.sharedRecords()
    var records_actuales = Record.load()
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
        print(records_actuales.self)
        nombres()
        puntos()
        

        // Do any additional setup after loading the view.
    }
    
    func nombres()
    {
        var nombres = records.nombres
        
        lblTop1.text = nombres[0]
        lblTop2.text = nombres[1]
        lblTop3.text = nombres[2]
        lblTop4.text = nombres[3]
        lblTop5.text = nombres[4]
    }
    
    func puntos()
    {
        var puntos = records.puntos
        
        lblPuntos1.text = "$\(puntos[0])"
        lblPuntos2.text = "$\(puntos[1])"
        lblPuntos3.text = "$\(puntos[2])"
        lblPuntos4.text = "$\(puntos[3])"
        lblPuntos5.text = "$\(puntos[4])"
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
