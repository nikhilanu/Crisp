//
//  DashViewController.swift
//  Crisp
//
//  Created by Nikhil Anu on 6/8/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {

    @IBOutlet var generateButton: UIButton!
    
    @IBOutlet var box1: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateButton.layer.cornerRadius = 20
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController:  SumViewController = segue.destination as! SumViewController
        DestViewController.sumText = box1.text
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
