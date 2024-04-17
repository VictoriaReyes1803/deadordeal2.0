//
//  MaletinesViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit

class MaletinesViewController: UIViewController {
    
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet var btnMaletines: [UIButton]!
    var cantidadesMaletines = [1,5,10,25,50,100,300,500,1000,5000,10000,25000,50000,100000,300000,500000]
    @IBOutlet weak var LblChoosecases: UILabel!
    var Cantidadesshuffle = [Int]()
    var maletinUsuario: (posicion: Int, cantidad: Int)?
    var cantidadLlevada:Int = 0
    var cantidadeselegidas = [Int]()
    var contadorClicks = 1
    var cases = 1
    var cantidadIndex:Int = 0
    var tagC = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(cantidadesMaletines)
        Cantidadesshuffle = cantidadesMaletines
        Cantidadesshuffle.shuffle()
        print(Cantidadesshuffle)
        
        if tagC.count >= 2 {
            lblTitulo.text = "Play Game"
            for button in btnMaletines {
                if tagC.contains(button.tag) {
                    button.isHidden = true
                }
            }
        }
        
    }
    @IBAction func maletinTapped(_ sender: UIButton) {
        guard let index = btnMaletines.firstIndex(of: sender)
                
        else {
            return
        }
        print(index)
        let tag = sender.tag
        tagC.append(tag)
        print (tag)
        
        cantidadIndex = Cantidadesshuffle[tag]
        print("Maletin",cantidadIndex)
        print("Tag del botón clickeado: \(tag)")
        
        
        if contadorClicks == 1 {
            maletinUsuario = (posicion: tag, cantidad: cantidadIndex)
            contadorClicks = contadorClicks + 1
            lblTitulo.text = "Play Game"
            
        }
        else if contadorClicks < 6 && contadorClicks > 1 {
            LblChoosecases.isHidden = false
            LblChoosecases.text = "Choose " + String(cases) + "  briefcases"
            cases += 1
            print(cantidadIndex)
            cantidadLlevada += cantidadIndex
            cantidadeselegidas.append(cantidadIndex)
            contadorClicks = contadorClicks + 1
            
            self.performSegue(withIdentifier: "MuestraDinero", sender: cantidadIndex)
            
        }
        else
        {
            self.performSegue(withIdentifier: "dealornodeal", sender: cantidadeselegidas)
        }
        sender.isHidden = true
        
        if let maletin = maletinUsuario {
            print("Cantidad maletin: \(maletin.posicion), \(maletin.cantidad)")
        } else
        {
            print("Maletin no seleccionado")
        }
        print("cantidad llevada",cantidadLlevada)
        print("Hola ver cuantos click a echo",contadorClicks)
        print("Cantidades Elegidas",cantidadeselegidas)
        print("Tag clickeados", tagC)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MuestraDinero" {
            let cant = segue.destination as! MaletinabiertoViewController
            cant.cantidadMostrada = String(self.cantidadIndex)
            cant.maletinUsuario = maletinUsuario
            cant.cantidadeselegidas = cantidadeselegidas
            cant.contadorClicks = contadorClicks
            cant.tagC = tagC
            cant.cases = cases
            
            print ("Valores pasados a Muestra Dinero")
        }
        
    }
    
}
