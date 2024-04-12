//
//  MaletinabiertoViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit

class MaletinabiertoViewController: UIViewController {
    @IBOutlet weak var lblCantidad: UILabel!
    
    var cantidadMostrada: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            if let cantidad = cantidadMostrada {
                       lblCantidad.text = "$" + cantidad
                self.performSegue(withIdentifier: "Quitadinero", sender: cantidad)
                   } else {
                       lblCantidad.text = "Cantidad no disponible"
                   }
        }

}
