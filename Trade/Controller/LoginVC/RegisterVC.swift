//
//  LoginVC.swift
//  Trade
//
//  Created by Anshul on 02/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit
import OktaAuth

class RegisterVC: UIViewController {
    
    @IBOutlet weak var topIcon: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    let loginColorContoller = RegisterColorContoller()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginColorContoller.initlaizeColorControl(topIcon: topIcon, txtEmail: txtEmail, txtPhoneNumber: txtPhoneNumber, txtPWD: txtPassword, _buttonLogin: buttonLogin)
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonFbClicked(_ sender: Any) {
      

        OktaAuth.login("dev@ios.com", password: "Password1")
        .start(self) { response, error in
          if error != nil { print(error!) }

          // Success
          if let tokenResponse = response {
            // tokenResponse.accessToken
            // tokenResponse.idToken
            // tokenResponse.refreshToken
          }
        }
    }
    
    @IBAction func buttonGplusClicked(_ sender: Any) {
        
    }
    
    @IBAction func buttonAppleClicked(_ sender: Any) {
        
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
