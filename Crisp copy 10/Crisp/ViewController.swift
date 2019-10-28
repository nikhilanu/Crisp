//
//  ViewController.swift
//  Crisp
//
//  Created by Nikhil Anu on 6/8/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var tiltleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 20
        self.tiltleLabel.alpha = 0
        self.bodyLabel.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations:{
            
            self.tiltleLabel.transform = CGAffineTransform(translationX: -20, y: 0)
        }) {(_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                
                self.tiltleLabel.alpha = 1
                self.tiltleLabel.transform = self.tiltleLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations:{
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -20, y: 0)
        }) {(_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1,options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 1
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        
    }
    @IBAction func startTapped(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DashView") as? DashViewController{
            navigationController?.pushViewController(vc, animated: true)
        
    }
        
}
}
    
    


