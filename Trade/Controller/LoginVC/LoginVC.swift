//
//  LoginVC.swift
//  Trade
//
//  Created by Anshul on 11/01/20.
//  Copyright © 2020 Apurva. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var topIcon: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    let loginColorContoller = LoginColorControl()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginColorContoller.initlaizeColorControl(topIcon: topIcon, txtEmail: txtEmail, txtPWD: txtPassword, _buttonLogin: buttonLogin)
        // Do any additional setup after loading the view.
        
       
    }
    
    @IBAction func buttonFbClicked(_ sender: Any) {
        
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
