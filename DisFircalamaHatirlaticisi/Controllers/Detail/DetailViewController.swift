//
//  DetailViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 30.11.2022.
//

import UIKit
import Lottie
import CoreData



class DetailViewController: UIViewController {
   
    @IBOutlet weak var detailAnimationView: LottieAnimationView!
    @IBOutlet weak var detailDayLabel: UILabel!
    @IBOutlet weak var detailText: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var doneParticle: LottieAnimationView!
    @IBOutlet weak var complete: UIImageView!
    
    
    var selectedDetails : Details?
    var models : MainModels?
    
    var getIndexPathRow = Int()
 
    
    // MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        let animationIn = selectedDetails?.detailsAnimationView.description
        
        detailDayLabel.text = selectedDetails?.detailsDayLabel
        detailText.text = selectedDetails?.detailsTextView
        homeAnimation(animationIn: animationIn?.description ?? "ok")
        
        
        isSaved()
   
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
    
    
    
    func isSaved() {
        print(getIndexPathRow)
        if MainViewController.shared.itemCD[getIndexPathRow].done{
            doneButton.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        } else {
            doneButton.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal)
        }
    }
    

    
   // MARK: - Actions
    
    @IBAction func doneButton(_ sender: Any) {
        
        let animationView = AnimationView(name: "done")
        animationView.loopMode = .playOnce
        animationView.center = self.doneParticle.center
        animationView.contentMode = .center
        doneParticle.addSubview(animationView)
        animationView.play()
 
        
        if doneButton.currentImage == UIImage(systemName: "checkmark.seal.fill"){
            doneButton.setImage(UIImage(systemName: "checkmark.seal"), for: .normal)
        } else {
            doneButton.setImage(UIImage(systemName: "checkmark.seal.fill"), for: .normal)
        }
        
        
        
        MainViewController.shared.itemCD[getIndexPathRow].done = !MainViewController.shared.itemCD[getIndexPathRow].done
        
        MainViewController.shared.saveItems()

        
    }
    
}
