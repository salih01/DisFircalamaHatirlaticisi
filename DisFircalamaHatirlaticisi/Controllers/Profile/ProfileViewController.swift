//
//  ProfileViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 11.12.2022.
//

import UIKit
import Firebase
import UserNotifications
import Lottie
import GoogleMobileAds


class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var animationView: LottieAnimationView!
    private var interstitial: GADInterstitialAd?
    
    @IBOutlet weak var dateField: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        animationLottie()
        
        
        let request = GADRequest()
           GADInterstitialAd.load(withAdUnitID:"ca-app-pub-8604883118823285/3985930200",
                                       request: request,
                             completionHandler: { [self] ad, error in
                               if let error = error {
                                 print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                 return
                               }
                               interstitial = ad
                             }
           )
       
    }
    
    func animationLottie(){
        
        let animationViews = AnimationView(name: "time")
        animationViews.frame = CGRect(x: 0, y: -90, width: 400, height: 400)
        animationViews.contentMode = .scaleAspectFit
        animationViews.loopMode = .loop
        animationView.addSubview(animationViews)
        animationViews.backgroundBehavior = .pauseAndRestore
        animationViews.play()
    }
    
  
    
    @IBAction func setNotification(_ sender: Any) {
        
        let targetDate = dateField.date
        
        let content = UNMutableNotificationContent()
        content.title = "Diş Fırçalama Hatırlatıcısı"
        content.body = "Hatırlat Demiştin ! İşte hatırlatıyorum . Dişlerini fırçalama vakti .. 🦷"
        content.badge = 1
        content.sound = UNNotificationSound(named: UNNotificationSoundName("ses.mp3"))
        
        let getDate = targetDate.addingTimeInterval(1)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour,.minute,.second], from: getDate), repeats: true)
        
        let request = UNNotificationRequest(identifier: "id_\(content.title)", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if error != nil {
                print("Hata var")
            }
        }
        
     
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
        } else {
          print("Ad wasn't ready")
        }
        
        
        
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        
        do {
            
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toLogin", sender: nil)
            
        } catch {
            
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        
        }
    }
    
}
