//
//  BankeroViewController.swift
//  deadordeal2.0
//
//  Created by imac on 15/04/24.
//
// PRUEBAS DE KASSY AUN NO ESTA BIEN 

import Foundation
import UIKit

class BankeroViewController: UIViewController {
    @IBOutlet weak var segundosLabel: UILabel!
    
    //variables vienen de Maletines
    var maletinUsuario: (posicion: Int, cantidad: Int)?
    var cantidadLlevada:Int = 0
    var cantidadeselegidas = [Int]()
    var contadorClicks = 1
    var cantidadIndex:Int = 0
    var tagC = [Int]()
    
    
    var tiempoTotal = 15
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        tiempoTotal -= 1
        segundosLabel.text = "\(tiempoTotal)"
        
        if tiempoTotal == 0 {
            timer?.invalidate()
            goToMenuScreen()
        }
    }
    
    func goToMenuScreen() {
        
    }
    
    @IBAction func dealButtonPressed(_ sender: UIButton) {
        timer?.invalidate()
     
    }
    
    @IBAction func noDealButtonPressed(_ sender: UIButton) {
        timer?.invalidate()
        goToMenuScreen()
    }
}
