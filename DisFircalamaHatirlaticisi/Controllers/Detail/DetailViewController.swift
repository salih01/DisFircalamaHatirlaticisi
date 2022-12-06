//
//  DetailViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 30.11.2022.
//

import UIKit
import Lottie

class DetailViewController: UIViewController {

    @IBOutlet weak var detailAnimationView: LottieAnimationView!
    @IBOutlet weak var detailDayLabel: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var doneParticle: LottieAnimationView!
    
    @IBOutlet weak var lablab: UILabel!
    
    var selectedDetails : Details?
    var models : MainModels?
    
    
    
    // MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        let animationIn = selectedDetails?.detailsAnimationView.description
        
        detailDayLabel.text = selectedDetails?.detailsDayLabel
        detailText.text = selectedDetails?.detailsTextView
        homeAnimation(animationIn: animationIn?.description ?? "ok")
        
   
    }
    
   // MARK: - Function

    
    func  homeAnimation(animationIn:String) {
      
        
        let animationView = AnimationView(name: animationIn)
        
        animationView.loopMode = .loop
        animationView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        animationView.center = self.detailAnimationView.center
        //animationView.contentMode = .scaleAspectFit
        detailAnimationView.addSubview(animationView)
       
        animationView.play()
    }
    
    

    
   // MARK: - Actions
    
    @IBAction func doneButton(_ sender: Any) {
        
        let animationView = AnimationView(name: "done")
        animationView.loopMode = .playOnce
        animationView.center = self.doneParticle.center
        animationView.contentMode = .center
        doneParticle.addSubview(animationView)
        animationView.play()
        
        
        // User defaults tanımı
        let userDefaults = UserDefaults.standard
        // user defaults kaydı
        userDefaults.string(forKey: "tiklandimi")
        // user defaults veri okuma
        
      
    
    }
    
}
