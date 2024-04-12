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
        
        dineroLabel = btnDiner.first(where: { $0.tag == dineroTag })
               
               dineroLabel?.alpha = 1.0
               dineroLabel?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           
           guard let dineroLabel = dineroLabel else {
               return
           }
           
           UIView.animate(withDuration: 3.5,
                          delay: 0.5,
                          usingSpringWithDamping: 0.6,
                          initialSpringVelocity: 0.8,
                          options: .curveEaseInOut,
                          animations: {
               dineroLabel.center.y -= self.view.frame.height / 2
               dineroLabel.alpha = 0.0
               dineroLabel.transform = CGAffineTransform.identity
           },
                          completion: { finished in
               if finished {
                  
               }
           })
       }
   }
