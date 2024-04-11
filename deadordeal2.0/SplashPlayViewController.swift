//
//  SplashPlayViewController.swift
//  deadordeal2.0
//
//  Created by imac on 11/04/24.
//

import UIKit

class SplashPlayViewController: UIViewController {
    
    @IBOutlet weak var imvSplashPlay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = 0.9 * view.frame.width
        let h = 0.5 * w
        let x = (view.frame.width - w)/2
        let y = -h
        imvSplashPlay.frame = CGRect(x: x, y: y, width: w, height: h)
        imvSplashPlay.alpha = 0.0
        imvSplashPlay.transform = CGAffineTransform(scaleX: 0.1, y: 0.1) // Escala inicial para el efecto de zoom
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut,
                       animations: {
            // Animación de posición y escala
            let centerX = self.view.frame.width / 2
            let centerY = self.view.frame.height / 2
            self.imvSplashPlay.center = CGPoint(x: centerX, y: centerY)
            self.imvSplashPlay.alpha = 1.0
            self.imvSplashPlay.transform = CGAffineTransform.identity // Restaurar la escala original
        },
                       completion: { finished in
            if finished {
                // Realizar la transición a la siguiente pantalla
                self.performSegue(withIdentifier: "Maletines", sender: nil)
            }
        })
        
    }}
