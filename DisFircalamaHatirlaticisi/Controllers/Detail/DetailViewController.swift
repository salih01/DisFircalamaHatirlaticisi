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
    @IBOutlet weak var doneAnimationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        homeAnimation()
        
    }
    

    func  homeAnimation() {
        let animationView = AnimationView(name: "lottie")
        
        animationView.loopMode = .loop
        animationView.center = self.detailAnimationView.center
        animationView.contentMode = .top
        detailAnimationView.addSubview(animationView)
        animationView.play()
    }
    
  
}
