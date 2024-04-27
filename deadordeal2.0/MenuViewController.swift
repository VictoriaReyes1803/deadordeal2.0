//
//  MenuViewController.swift
//  deadordeal2.0
//
//  Created by imac on 11/04/24.
//

import UIKit
import AVFoundation
class MenuViewController: UIViewController{
    @IBOutlet weak var btnJugar: UIButton!
    @IBOutlet weak var txfNombre: UITextField!
    var audio: AVAudioPlayer?
    var player = AVAudioPlayer()
    var audioDetener: AVAudioPlayer?
    var jugador  = Jugador.sharedData()
    let records =  Record.sharedRecords()
    override func viewDidLoad() {
        super.viewDidLoad()
        if records.puntos.count >= 6
        {
            records.puntos.removeLast()
            records.nombres.removeLast()
        }
        
        print("nombres: \(records.nombres)")
        print("puntos: \(records.puntos)")
        print("puntos: \(jugador.puntos)")
        
        btnJugar.isEnabled = false
        (UIApplication.shared.delegate as? AppDelegate)?.playAudio()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func jugar(_ sender: UIButton) {
        var jugadorNombre = txfNombre.text
        jugador.guardarNombre(jugadorNombre!)
        performSegue(withIdentifier: "sgSplashPlay", sender: self)
        print("nombre")
    }
    @IBAction func ocultarTeclado()
    {
        view.endEditing(true)
    }
    
    @IBAction func textFieldDidChange(_ textField: UITextField) {
        btnJugar.isEnabled = textField.text?.count ?? 0 >= 3
    }

    
    
}
