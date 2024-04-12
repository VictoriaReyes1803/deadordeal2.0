//
//  MaletinesViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit

class MaletinesViewController: UIViewController {
    
    
    @IBOutlet var btnMaletines: [UIButton]!
    var cantidadesMaletines = [1,5,10,25,50,100,300,500,1000,5000,10000,25000,50000,100000,300000,500000]
    var indiceCantidades = [Int]()
    var maletinUsuario: (posicion: Int, cantidad: Int)?
    var cantidadLlevada = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(cantidadesMaletines)
        indiceCantidades = cantidadesMaletines
        indiceCantidades.shuffle()
        print(indiceCantidades)
    
    }
    @IBAction func maletinTapped(_ sender: UIButton) {
          guard let index = btnMaletines.firstIndex(of: sender) else {
              return
          }
          
          let tag = sender.tag
        print (tag)
          
          let cantidadIndex = indiceCantidades[index]
        print(cantidadIndex)
          print("Tag del botón clickeado: \(tag)")
          
          var cantidad = cantidadesMaletines[cantidadIndex]
          
          maletinUsuario = (posicion: index, cantidad: cantidad)

          sender.isHidden = true
      }
}
