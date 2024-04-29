//
//  MaletinesViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit
import AVFoundation
class MaletinesViewController: UIViewController {
    @IBOutlet weak var contadorSegundos: UILabel!
    var segundosTranscurridos = 0
    var timer: Timer?
    
    
    var jugador =  Jugador.sharedData()
    @IBOutlet var backView: UIView!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet var btnMaletines: [UIButton]!
    @IBOutlet weak var maletinarriba: UIView!
    @IBOutlet weak var lblCases: UILabel!
    let records = Record.sharedRecords()
    let maletinClass = Maletin.sharedData()
    @IBOutlet weak var titlee: UILabel!
    
    @IBOutlet weak var botondevolver: UIButton!
    @IBOutlet weak var usuariomaletin: UILabel!
    var cantidadesMaletines = [1,5,10,25,50,100,300,500,1000,5000,10000,25000,50000,100000,300000,500000]
    @IBOutlet weak var LblChoosecases: UILabel!
    var Cantidadesshuffle = [Int]()
    var maletinUsuario:(posicion: Int, cantidad: Int)?
    var cantidadLlevada:Int = 0
    var cantidadeselegidas = [Int]()
    var contadorClicks = 1

    var cantidadIndex:Int = 0
    var cases = 5
    var cases1 = 4
    var cases2 = 3
    var cases3 = 2
    var cases4 = 1
    let maletin = Maletin.sharedData()
    var tagC = [Int]()
    var audioPlayer: AVAudioPlayer!
    var player = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
startT()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           
           
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
        maletin.guardarCantidadIndex(cantidadIndex)
        print("Tag del botón clickeado: \(tag)")
        let audioFilename = "sonido"
        
        if let audioURL = Bundle.main.url(forResource: audioFilename, withExtension: "mp3")
        {
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                self.audioPlayer.numberOfLoops = 0
                self.audioPlayer.play()
            } catch {
                print("Error al inicializar el reproductor de audio: \(error.localizedDescription)")
            }
        } else {
            print("Archivo de audio no encontrado")
        }
        if contadorClicks == 1 {
            maletinUsuario = (posicion: tag, cantidad: cantidadIndex)
            contadorClicks = contadorClicks + 1
            lblTitulo.text = "Play Game"
           
            
        }
        else if contadorClicks < 6 && contadorClicks > 1 {
            LblChoosecases.isHidden = false
            cases -= 1
            LblChoosecases.text = "Choose " + String(cases) + "  briefcases"
            print("Choose \(String(cases))  briefcases")
            
            print(cantidadIndex)
            titlee.isHidden = true
            cantidadLlevada += cantidadIndex
            cantidadeselegidas.append(cantidadIndex)
            contadorClicks = contadorClicks + 1
            botondevolver.setTitle("Aceptar", for: .normal)
           
            LblChoosecases.isHidden = false
            usuariomaletin.text = "$" + String(cantidadIndex)
                maletinarriba.isHidden = false
            
        }
        else if contadorClicks == 6 || contadorClicks == 10 || contadorClicks == 13 || contadorClicks == 15
        {LblChoosecases.isHidden = true
            cantidadLlevada += cantidadIndex
            cantidadeselegidas.append(cantidadIndex)
            contadorClicks = contadorClicks + 1
            LblChoosecases.isHidden = true
            self.performSegue(withIdentifier: "dealornodeal", sender: cantidadeselegidas)
            //siguio jugando
        
        } else if contadorClicks > 6 && contadorClicks < 10
        
        {
            lblTitulo.text = "Ronda 2"
            cases1 -= 1
            LblChoosecases.text = "Choose " + String(cases1) + "  briefcases"
            LblChoosecases.isHidden = false
            print("Choose \(String(cases))  briefcases")
           
            print(cantidadIndex)
            cantidadLlevada += cantidadIndex
            cantidadeselegidas.append(cantidadIndex)
            contadorClicks = contadorClicks + 1
            botondevolver.setTitle("aceptar", for: .normal)
            titlee.isHidden = true
           
            usuariomaletin.text = "$" + String(cantidadIndex)
                maletinarriba.isHidden = false
           
        
            
        }
    else if contadorClicks > 10 && contadorClicks < 13
    
    {   lblTitulo.text = "Ronda 3"
        cases2 -= 1
        LblChoosecases.text = "Choose " + String(cases2) + "  briefcases"
        LblChoosecases.isHidden = false
        print("Choose \(String(cases))  briefcases")
    
        print(cantidadIndex)
        cantidadLlevada += cantidadIndex
        cantidadeselegidas.append(cantidadIndex)
        contadorClicks = contadorClicks + 1
        botondevolver.setTitle("aceptar", for: .normal)
        titlee.isHidden = true
       
        usuariomaletin.text = "$" + String(cantidadIndex)
            maletinarriba.isHidden = false
       
    
        
        }
        
        
        
        
        else if contadorClicks > 13 && contadorClicks <= 16
        {
            lblTitulo.text = "Ronda 4"
            
            cases3 -= 1
            LblChoosecases.text = "Choose " + String(cases3) + "  briefcases"
            LblChoosecases.isHidden = false
           
            
            cantidadLlevada += cantidadIndex
            cantidadeselegidas.append(cantidadIndex)
            contadorClicks = contadorClicks + 1
            botondevolver.setTitle("aceptar", for: .normal)
            titlee.isHidden = true
            
            usuariomaletin.text = "$" + String(cantidadIndex)
            maletinarriba.isHidden = false
        }
            if contadorClicks == 17
                        
            { lblTitulo.text = "Ronda 5"
                LblChoosecases.isHidden = false
                LblChoosecases.text = "Choose " + String(cases4) + "  briefcases"
                titlee.isHidden = false
                cantidadLlevada += cantidadIndex
                cantidadeselegidas.append(cantidadIndex)
                contadorClicks = contadorClicks + 1
                botondevolver.setTitle("aceptar", for: .normal)
                
                titlee.isHidden = false
                titlee.text = "Ultimo maletin! Espera, elije vender tu maletin o tomarlo"
                LblChoosecases.isHidden = true
                usuariomaletin.text = "$" + String(cantidadIndex)
                maletinarriba.isHidden = false
                

                
                DispatchQueue.main.asyncAfter(deadline: .now() + 14.0) {
                    
                    self.lblTitulo.text = "Llegaste a tu maletin"
                    self.botondevolver.isHidden = false
                    self.LblChoosecases.isHidden = true
                    if let cantidadMaletin = self.maletinUsuario?.cantidad {
                        self.usuariomaletin.text = "$" + String(cantidadMaletin)
                        self.jugador.guardarPuntos(cantidadMaletin)
                        if cantidadMaletin <= self.maletinClass.oferta
                        { self.titlee.text = "Lástima =( Debiste aceptar la oferta: $\(self.maletinClass.oferta)"
                            let audioFilename = "no-luck-too-bad-disappointing-sound-effect-112943"
                            
                            if let audioURL = Bundle.main.url(forResource: audioFilename, withExtension: "mp3")
                            {
                                do {
                                    self.audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                                    self.audioPlayer.numberOfLoops = 0
                                    self.audioPlayer.play()
                                } catch {
                                    print("Error al inicializar el reproductor de audio: \(error.localizedDescription)")
                                }
                            } else {
                                print("Archivo de audio no encontrado")
                            }                        }
                        else
                        {
                            self.titlee.text = "¡Felicidades!"
                            let audioFilename = "Old victory sound roblox"
                            
                            if let audioURL = Bundle.main.url(forResource: audioFilename, withExtension: "mp3")
                            {
                                do {
                                    self.audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                                    self.audioPlayer.numberOfLoops = 0
                                    self.audioPlayer.play()
                                } catch {
                                    print("Error al inicializar el reproductor de audio: \(error.localizedDescription)")
                                }
                            } else {
                                print("Archivo de audio no encontrado")
                            }
                        
                            self.records.puntos.removeLast()
                            self.records.nombres.removeLast()
                            
                                    
                                    for i in 0..<self.records.puntos.count {
                                        if self.jugador.puntos >= self.records.puntos[i] {
                                            self.records.puntos.insert(self.jugador.puntos, at: i)
                                            self.records.nombres.insert(self.jugador.nombre, at: i)
                                            let alerta = UIAlertController(title: "¡Felicidades!", message: "Has entrado al top 5", preferredStyle: .alert)
                                            let ok = UIAlertAction(title: "Aceptar", style: .default) { _ in
                                                self.regresar()
                                            }
                                            
                                            alerta.addAction(ok)
                                            self.present(alerta, animated: true)
                                            break
                                        }
                                    }
                            }
                    } else {
                        self.usuariomaletin.text = "Cantidad no disponible"
                    }
                    self.botondevolver.isHidden = false
                    // Realiza la animación de entrada de maletinarriba
                    self.maletinarriba.isHidden = false

                    // Limpia las variables y ajustes para la siguiente ronda
                    self.Cantidadesshuffle = [Int]()
                    self.maletinUsuario = nil
                    self.cantidadLlevada = 0
                    self.cantidadeselegidas = [Int]()
                    self.cantidadIndex = 0
                    self.cases = 5
                }

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
   
    
    
    @IBAction func botondevolver(_ sender: Any) {
        if contadorClicks < 18 {
            maletinarriba.isHidden = true
            self.performSegue(withIdentifier: "Quitadinero", sender: nil)
            
            
        
        }else if contadorClicks == 18 {
            LblChoosecases.isHidden = true
                cantidadLlevada += cantidadIndex
                cantidadeselegidas.append(cantidadIndex)
                contadorClicks = contadorClicks + 1
                LblChoosecases.isHidden = true
            botondevolver.isHidden = true
                self.performSegue(withIdentifier: "dealornodeal", sender: cantidadeselegidas)
                //ultima oferta
            
        }
        else if contadorClicks == 19 {
            
         
            contadorClicks = 1
            tagC = [Int]()
            let storyboard  = UIStoryboard(name: "Main", bundle: nil)
            let menu = storyboard.instantiateViewController(withIdentifier: "menu")
            menu.modalTransitionStyle = .crossDissolve
            menu.modalPresentationStyle = .fullScreen
            self.present(menu, animated: true)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Quitadinero" {
            let cant = segue.destination as! DineroViewController
            cant.Dinero = String(maletin.cantidad)
            cant.maletinUsuario = maletinUsuario
            cant.cantidadeselegidas = cantidadeselegidas
            cant.contadorClicks = contadorClicks
            cant.tagC = tagC
            cant.cases = cases
            
            print ("Valores pasados a Quita dinero Dinero")
        }
        else if segue.identifier == "dealornodeal"
        {
            let deal = segue.destination as! BankerViewController
            deal.cantidadMostrada = String(self.cantidadIndex)
            deal.maletinUsuario = maletinUsuario
            deal.cantidadeselegidas = cantidadeselegidas
            deal.contadorClicks = contadorClicks
            deal.tagC = tagC
            deal.cases = cases
            deal.maletin = maletinUsuario!.cantidad
            
            print ("Valores pasados a Deal or No Deal")
        }
        
    }
    func regresar()
    {
        let storyboard  = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewController(withIdentifier: "menu")
        menu.modalTransitionStyle = .crossDissolve
        menu.modalPresentationStyle = .fullScreen
        self.present(menu, animated: true)
    }
    
   
    deinit {
            // Detener el temporizador cuando se destruye la vista
            stopTimer()
    }
        
    func startT() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.segundosTranscurridos += 1
            if self.segundosTranscurridos >= 60 {
                        let minutos = self.segundosTranscurridos / 60
                        let segundos = self.segundosTranscurridos % 60
                        self.contadorSegundos.text = "\(minutos):\(segundos)"
                    } else {
                        self.contadorSegundos.text = ":\(self.segundosTranscurridos)"
                    }
        }
    }
    
        
    func stopTimer() {
            timer?.invalidate()
            timer = nil
    }
        
}
