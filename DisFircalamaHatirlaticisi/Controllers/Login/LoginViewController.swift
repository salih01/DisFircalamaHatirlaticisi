//
//  LoginViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 9.12.2022.
//

import UIKit
import Lottie
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var loginAnimation: LottieAnimationView!
    @IBOutlet weak var kullanıcıAdıTF: UITextField!
    @IBOutlet weak var sifreTF: UITextField!
    
    // MARK: - Properties
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        animationLottie()
    }

    
    // MARK: - Functions
    func animationLottie(){
        
        let animationView = AnimationView(name: "login")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        loginAnimation.addSubview(animationView)
        animationView.play()
    }
    
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
    

    
    
    
    // MARK: - Actions
    
    @IBAction func loginButton(_ sender: UIButton) {
    
        if let email = kullanıcıAdıTF.text ,let password = sifreTF.text {
            
            if email != "" && password != "" {
                
                Auth.auth().signIn(withEmail: email, password: password) {  authResult, error in
                    
                    if error != nil {
                        self.makeAlert(title: "Error", message: error?.localizedDescription ?? "error")
                    }
                    else {
                        self.performSegue(withIdentifier: "loginToMainVC", sender: self)
                    }
                  
                    
                    
                }
            }
            else {
                makeAlert(title: "Hata", message: "Boş bırakmayınız !")

            }
            
         
            
        }
        
        
        
    }
    
}
