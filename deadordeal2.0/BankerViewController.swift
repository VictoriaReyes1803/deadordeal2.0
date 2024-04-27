
//
//  BankerViewController.swift
//  deadordeal2.0
//
//  Created by imac on 23/04/24.
//

import UIKit
import AVFAudio

class BankerViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
        var oferta = Int()
        @IBOutlet weak var lbOferta: UILabel!
        var timer: Timer? = nil
        var secondsRemaining = 15
    var cantidadMostrada: String?
    var jugador =  Jugador.sharedData()
    var maletin: Int!
    let records = Record.sharedRecords()
    
    //variables vienen de Maletines
    var maletinUsuario: (posicion: Int, cantidad: Int)?
    var cantidadLlevada:Int = 0
    var cantidadeselegidas = [Int]()
    var contadorClicks = 1
    var cantidadIndex:Int = 0
    var cases = 0
    var tagC = [Int]()
    var audioPlayer: AVAudioPlayer!
    var player = AVAudioPlayer()
    
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            startTimer()
            oferton()
            print(records.puntos)
            print(records.puntos.last)
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgMaletines"
        {
            let maletines = segue.destination as! MaletinesViewController
            maletines.maletinUsuario = maletinUsuario
            maletines.cantidadeselegidas = cantidadeselegidas
            maletines.contadorClicks = contadorClicks
            maletines.tagC = tagC
            maletines.cases = cases
            
            print ("Valores pasados a Deal or No Deal")
        }
       
    }
    func oferton() {
        let randomNumber = 501 + Int(arc4random_uniform(UInt32(50000 - 501)))
        oferta = randomNumber
        lbOferta.text = "$\(String(oferta))"
    }
        func startTimer() {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }

            @objc func updateTimer() {
                if secondsRemaining > 0 {
                    secondsRemaining -= 1
                    timerLabel.text = "\(secondsRemaining)"
                } else {
                    if let timer = timer {
                        timer.invalidate()
                        self.timer = nil
                    }
                    self.dismiss(animated: true)
                }
            }
            
   
    @IBAction func deal(_ sender: UIButton) {
        if maletin < oferta
        {
            let audioFilename = "Old victory sound roblox"
            
            if let audioURL = Bundle.main.url(forResource: audioFilename, withExtension: "mp3")
            {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                    audioPlayer.numberOfLoops = 0
                    audioPlayer.play()
                } catch {
                    print("Error al inicializar el reproductor de audio: \(error.localizedDescription)")
                }
            } else {
                print("Archivo de audio no encontrado")
            }
            
            let alerta = UIAlertController(title: "¡Felicidades!", message: "Tomaste la decisión correcta, has ganado $\(oferta)\t\tTu maletín: $\(maletin!)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .default){_ in
                self.regresar()
            }
            alerta.addAction(ok)
            present(alerta, animated: true)
            jugador.guardarPuntos(oferta)
            print("puntos de \(jugador.nombre): \(oferta)")
            
                if jugador.puntos >= records.puntos.last!
                {
                    records.puntos.removeLast()
                    records.nombres.removeLast()
                    for i in 0..<records.puntos.count
                    {
                        if jugador.puntos >= records.puntos[i]
                        {
                            records.puntos.insert(jugador.puntos, at: i)
                            records.nombres.insert(jugador.nombre, at: i)
                            
                            break
                            
                        }
                    }
                    
                }
        }
        else
        {
            let audioFilename = "no-luck-too-bad-disappointing-sound-effect-112943"
            
            if let audioURL = Bundle.main.url(forResource: audioFilename, withExtension: "mp3")
            {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                    audioPlayer.numberOfLoops = 0
                    audioPlayer.play()
                } catch {
                    print("Error al inicializar el reproductor de audio: \(error.localizedDescription)")
                }
            } else {
                print("Archivo de audio no encontrado")
            }
            let alerta = UIAlertController(title: "¡Lástima!", message: "No tomaste la decisión correcta, ¡no tienes ganancias!\t\tTu maletín: $\(maletin!)", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .default){_ in
                self.regresar()
            }
            alerta.addAction(ok)
            present(alerta, animated: true)
            jugador.guardarPuntos(0)
            
        }
    }
    
    @IBAction func nodeal(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func regresar()
    {
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "menu")
        menu.modalTransitionStyle = .crossDissolve
        menu.modalPresentationStyle = .fullScreen
        self.present(menu, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopTimer()
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
