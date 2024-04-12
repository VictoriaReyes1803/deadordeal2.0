//
//  DineroViewController.swift
//  deadordeal2.0
//
//  Created by imac on 12/04/24.
//

import UIKit

class DineroViewController: UIViewController {
    @IBOutlet var btnDiner: [UILabel]!
    var Dinero: String?
    var dineroLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let dinero = Dinero else {
            return
        }
        
        guard let dineroTag = Int(dinero) else {
            return
        }
        
        // Buscar la etiqueta con el tag correspondiente
        guard let dineroLabel = btnDiner.first(where: { $0.tag == dineroTag }) else {
            return
        }
        
        let originalCenter = dineroLabel.center
        
        dineroLabel.alpha = 5.0
        dineroLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let dineroLabel = dineroLabel else {
            return
        }
        
        UIView.animate(withDuration: 4.5,
                       delay: 0,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.8,
                       options: .curveEaseInOut,
                       animations: {
            // Mover el label hacia arriba
            dineroLabel.center.y -= self.view.frame.height / 2
            // Restaurar la transparencia del label a 1.0
            dineroLabel.alpha = 1.0
            // Restaurar el tamaño original del label
            dineroLabel.transform = CGAffineTransform.identity
        },
                       completion: { finished in
            if finished {
                self.performSegue(withIdentifier: "Vuelve", sender: nil)
            }
        })
    }}
