//
//  LoginColorControl.swift
//  Trade
//
//  Created by Anshul on 11/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class LoginColorControl {
    
    func initlaizeColorControl(topIcon: UIButton,  txtEmail: UITextField, txtPWD: UITextField , _buttonLogin: UIButton) {
           self.setTextFiledEmail(txtEmail)
           self.setTextPWD(txtPWD)
           self.setBuutonLogin(_buttonLogin)
       }
       
       func changeTopIcon(_ topIcon: UIButton){
       }
       
       func setTextFiledEmail(_ txtEmail: UITextField){
           let padding = 19
           let size = 21
           let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding+20, height: 24) )
           let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: 21, height: 24))
           iconView.image = UIImage(named: "emailIcon")
           outerView.addSubview(iconView)
           txtEmail.roundCorners(corners: [.topLeft, .topRight], radius: 15.0)
           txtEmail.leftViewMode = .always
           txtEmail.leftView = outerView
           txtEmail.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           txtEmail.placeholder = "Enter Email"
           txtEmail.borderStyle = .none
       }
    
       func setTextPhoneNumber(_ txtPhoneNumber: UITextField){
          // txtPhoneNumber.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 15.0)
           txtPhoneNumber.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           let padding = 19
           let size = 20
           let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding+20, height: size) )
           let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
           iconView.image = UIImage(named: "tel")
           outerView.addSubview(iconView)
           txtPhoneNumber.leftViewMode = .always
           txtPhoneNumber.leftView = outerView
           txtPhoneNumber.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           txtPhoneNumber.placeholder = "Enter Phone Number"
           txtPhoneNumber.borderStyle = .none
       }
    
       func setTextPWD(_ txtPhoneNumber: UITextField){
           txtPhoneNumber.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 15.0)
           txtPhoneNumber.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           let padding = 19
           let size = 24
           let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding+20, height: size) )
           let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: 17, height: size))
           iconView.image = UIImage(named: "pwd")
           outerView.addSubview(iconView)
           txtPhoneNumber.leftViewMode = .always
           txtPhoneNumber.leftView = outerView
           txtPhoneNumber.backgroundColor = UIColor().hexStringToUIColor(hex: "#F3F3F4")
           txtPhoneNumber.placeholder = "Enter Password"
           txtPhoneNumber.borderStyle = .none
       }
       
       func setBuutonLogin(_ button: UIButton){
           button.setTitleColor(.white, for: .normal)
           button.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 15.0)
           button.backgroundColor = UIColor().hexStringToUIColor(hex: "#0176DD")
           button.setTitle("Log in", for: .normal)
       }
    
}

