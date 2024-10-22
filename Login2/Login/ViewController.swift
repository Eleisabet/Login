//
//  ViewController.swift
//  Login
//
//  Created by Elizaveta Potapova on 10/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func loginAction(_ sender: Any) {
        print("Login button pressed")
    }
    
    @IBAction func signUpHereAction(_ sender: Any) {
        print("Sign up button pressed")
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var envelopeImageView: UIImageView!
    
    @IBOutlet weak var emailLineView: UIView!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var lockImageView: UIImageView!
    
    
    @IBOutlet weak var passwordLineView: UIView!
    
    
    @IBOutlet weak var dontHaveAnAccountLabel: UILabel!
    
    
    @IBOutlet weak var signUpHereButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        
        
        
        // MARK: - button's shadow
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = false
        
        loginButton.layer.shadowColor = UIColor.darkGray.cgColor
        loginButton.layer.shadowOpacity = 0.5
        loginButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        loginButton.layer.shadowRadius = 5
        
        
        
        
    }


}

