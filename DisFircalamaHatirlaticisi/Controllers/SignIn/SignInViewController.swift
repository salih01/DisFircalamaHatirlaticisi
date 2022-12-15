//
//  SignInViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 10.12.2022.
//

import UIKit
import Lottie
import Firebase

class SignInViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var kullaniciAdiTF: UITextField!
    @IBOutlet weak var sifreTF: UITextField!
    @IBOutlet weak var signAnimationView: LottieAnimationView!
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animationLottie()
    }

    // MARK: - Functions
    
    func animationLottie(){
        
        let animationView = AnimationView(name: "sign")
        
        animationView.frame = CGRect(x: 30, y: 0, width: 350, height: 350)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit

        signAnimationView.addSubview(animationView)
       
        animationView.play()
    }
    
    
    func makeAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
    // MARK: - Actions
    
 
    
    @IBAction func signInButton(_ sender: Any) {
        
        if kullaniciAdiTF.text != "" && sifreTF.text != "" {
            
            Auth.auth().createUser(withEmail: kullaniciAdiTF.text!, password: sifreTF.text!) { (authdata,error) in
                
                if error != nil {
                    self.makeAlert(title: "Error!", message: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "signToMainVC", sender: nil)
                }
                
            }
            
        } else {
            makeAlert(title: "Error", message: "Kullanıcı Ve Şifre hatalı !")
        }
        
        
    }
    
    
    
    
    
    
    

}
