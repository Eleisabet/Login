//
//  ViewController.swift
//  Login
//
//  Created by Elizaveta Potapova on 10/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func loginAction(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        if email.isEmpty {
            makeErrorField(textField: emailTextField)
        }
        
        if password.isEmpty {
            makeErrorField(textField: passwordTextField)
        }
        
        
        
        if email == mockEmail,
           password == mockPassword {
            performSegue(withIdentifier: "goToHomePage", sender: sender)
        } else {
            let alert = UIAlertController(title: "Error".localized,
                                          message: "Wrong password or email".localized, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK".localized, style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
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
    
    //MARK: - Properties
    private let activeColor = UIColor(named: "notes") ?? UIColor.gray
    private var email: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray5
        }
    }
    
    private var password: String = "" {
        didSet {
            loginButton.isUserInteractionEnabled = !(email.isEmpty || password.isEmpty)
            loginButton.backgroundColor = !(email.isEmpty || password.isEmpty) ? activeColor : .systemGray5
        }
    }
    private let mockEmail = "abc@gmail.com"
    private let mockPassword = "123456"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLoginButton()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.becomeFirstResponder()
        
        
        
        // MARK: - button's shadow
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = false
        
        func setLoginButton() {
            loginButton.layer.shadowColor = activeColor.cgColor
            loginButton.layer.shadowOpacity = 0.5
            loginButton.layer.shadowOffset = CGSize(width: 5, height: 5)
            loginButton.layer.shadowRadius = 5
            
            loginButton.isUserInteractionEnabled = false
            loginButton.backgroundColor = .systemGray5
            
            
        }
        
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        loginButton.isUserInteractionEnabled = !(email.isEmpty && password.isEmpty)
        loginButton.backgroundColor = !(email.isEmpty && password.isEmpty) ? activeColor : .systemGray5
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        !text.isEmpty else { return }
        
        switch textField {
        case emailTextField:
            let isValidEmail = check(email: text)
            
            
            if isValidEmail {
                email = text
                envelopeImageView.tintColor = .systemGray5
                emailLineView.backgroundColor = .systemGray5
                } else {
                email = ""
                makeErrorField(textField: textField)
            }
            
        case passwordTextField:
            let isValidPassword = check(password: text)
            
            
            if isValidPassword {
                password = text
                lockImageView.tintColor = .systemGray5
                passwordLineView.backgroundColor = .systemGray5
            } else {
                password = ""
                makeErrorField(textField: textField)
            }
        default:
            print("unknown textField")
        }
    
    }
    
    private func check(email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
    
    private func check(password: String) -> Bool {
        return password.count >= 4
    }
    
    private func makeErrorField(textField: UITextField) {
        switch textField {
        case emailTextField:
            envelopeImageView.tintColor = activeColor
            emailLineView.backgroundColor = activeColor
        case passwordTextField:
            lockImageView.tintColor = activeColor
            passwordLineView.backgroundColor = activeColor
        default:
            print("unknown textField")
            
        }
        
    }
}
