//
//  UIButtonExtension.swift
//  psr_api_plugin
//
//  Created by Mouhamed Camara on 8/26/20.
//

import Foundation
import UIKit


class addRoundingButton: UIButton
{
    override func draw(_ rect: CGRect)
    {
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = frame.height / 2
        if #available(iOS 11.0, *)
        {
            layer.borderColor = Colors.greyBorder?.cgColor
        }
        else
        {
            // Fallback on earlier versions
        }
        layer.borderWidth = 2
//        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//        layer.shadowOpacity = 0.25
//        layer.shadowRadius = 5
//        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}

class addStatusButton: UIButton
{
    @IBInspectable var statusColor: UIColor!
//        didSet{
//            draw()
//
    
    override func draw(_ rect: CGRect)
    {
        layer.backgroundColor = statusColor.cgColor
        layer.cornerRadius = frame.height / 2
//        layer.shadowOpacity = 0.25
//        layer.shadowRadius = 5
//        layer.shadowOffset = CGSize(width: 0, height: 10)
    }
}

extension UIButton
{
    func addBottomLine(color: UIColor)
    {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect.init(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 10)
        
        bottomLine.backgroundColor = color.cgColor
        
        //self.borderStyle = UITextField.BorderStyle.none
        
        self.layer.masksToBounds = true
        
        
        self.layer.addSublayer(bottomLine)
    }
}
