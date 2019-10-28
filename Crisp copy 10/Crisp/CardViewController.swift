//
//  CardView.swift
//  shortnsweet
//
//  Created by Nikhil Anu on 6/7/19.
//  Copyright © 2019 Nikhil Anu. All rights reserved.
//

import UIKit



@IBDesignable class CardViewController: UIView {
    @IBInspectable var cornerRadius1: CGFloat = 21
    @IBInspectable var shadowWidth1: CGFloat = 0
    @IBInspectable var shadowHeight1: CGFloat = 5
    @IBInspectable var shadowColor1: UIColor = UIColor.black
    @IBInspectable var shadowOpacity1: CGFloat = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius1
        layer.shadowColor = shadowColor1.cgColor
        layer.shadowOffset = CGSize(width: shadowWidth1, height: shadowHeight1)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius1)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOpacity1)
        let col1 = UIColor(red: 47/255.0, green: 29/255.0, blue: 63/255.0, alpha: 1.0)
        layer.backgroundColor = col1.cgColor
        
        //let gradient = CAGradientLayer(start: .topCenter, end: .bottomRight, colors: [col2.cgColor,col1.cgColor], type: .radial)
        //gradient.frame = layer.frame
        //layer.addSublayer(gradient)

    
    }
    
    

}
