//
//  MaletinabiertoViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit

class MaletinabiertoViewController: UIViewController {
    @IBOutlet weak var lblCantidad: UILabel!
    
    @IBOutlet weak var imgMujer: UIImageView!
    var cantidadMostrada: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            if let cantidad = cantidadMostrada {
                       lblCantidad.text = "$" + cantidad + ".00"
                self.performSegue(withIdentifier: "Quitadinero", sender: cantidad)
                   } else {
                       lblCantidad.text = "Cantidad no disponible"
                   }
            
            let w = 0.9 * view.frame.width
            let h = 0.5 * w
            let x = (view.frame.width - w)/2
            let y = -h
            imgMujer.frame = CGRect(x: x, y: y, width: w, height: h)
            imgMujer.alpha = 0.0
            imgMujer.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            UIView.animate(withDuration: 1.5,
                           delay: 0,
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseInOut,
                           animations: {
                let centerX = self.view.frame.width / 2
                let centerY = self.view.frame.height / 2
                self.imgMujer.center = CGPoint(x: centerX, y: centerY)
                self.imgMujer.alpha = 1.0
                self.imgMujer.transform = CGAffineTransform.identity
            },
                           completion: { finished in
                if finished {
                    self.performSegue(withIdentifier: "Quitadinero", sender: nil)
                }
            })
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Quitadinero" {
             let cant = segue.destination as! DineroViewController
                cant.Dinero = cantidadMostrada
                print ("hola")
        }
    }
}
