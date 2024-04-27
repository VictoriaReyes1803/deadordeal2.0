//
//  MaletinabiertoViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit
import AVFoundation

class MaletinabiertoViewController: UIViewController {
  
    
    @IBOutlet weak var lblCantidad: UILabel!
    
    @IBOutlet weak var imgMaletin: UIImageView!
    var cantidadMostrada: String?
    
    //variables vienen de Maletines
    var maletinUsuario: (posicion: Int, cantidad: Int)?
    var cantidadLlevada:Int = 0
    var cantidadeselegidas = [Int]()
    var contadorClicks = 1
    var cantidadIndex:Int = 0
    var cases = 0
    var tagC = [Int]()
    
    
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
            lblCantidad.alpha = 0.0
            lblCantidad.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            imgMaletin.frame = CGRect(x: x, y: y, width: w, height: h)
            imgMaletin.alpha = 0.0
            imgMaletin.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0.8,
                           options: .curveEaseInOut,
                           animations: {
                let centerX = self.view.frame.width / 2
                let centerY = self.view.frame.height / 2
                self.imgMaletin.center = CGPoint(x: centerX, y: centerY)
                self.lblCantidad.alpha = 1.0
                self.lblCantidad.transform = CGAffineTransform.identity
                self.imgMaletin.alpha = 1.0
                self.imgMaletin.transform = CGAffineTransform.identity
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
            cant.maletinUsuario = maletinUsuario
            cant.cantidadeselegidas = cantidadeselegidas
            cant.contadorClicks = contadorClicks
            cant.tagC = tagC
            cant.cases = cases
                print ("Pasaste a Quitar Dinero")
        }
        
    }
    
    @IBAction func regresar(_ sender: Any) {
        self.dismiss(animated: true)
    }

    
    
  
    
    
    }
