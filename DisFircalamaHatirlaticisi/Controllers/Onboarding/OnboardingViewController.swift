//
//  OnboardingViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 26.11.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    var slides :[OnboardingModel] = []
    
    var currentPage = 0 {
        
        didSet {
            pageControl.currentPage = currentPage

            if currentPage == slides.count - 1 {
                
                nextButton.setTitle("Kayıt ol", for: .normal)

            } else {
                
                nextButton.setTitle("Geç", for: .normal)

            }
        }
    }
    
   
    // MARK: - Life Cycle
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        slides = [
        
            OnboardingModel(title: "Dişlerini düzenli fırçalamak ister misin ? ", image: UIImage(named: "tooth4")!),
            OnboardingModel(title: "Dişlerini fırçala o zaman :D ? ", image: UIImage(named: "tooth1")!),
            OnboardingModel(title: "Halledicez bi şekil  ", image: UIImage(named: "tooth2")!)
        
        ]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            
            if Core.shared.isNewUser(){
                Core.shared.setIsNotNewUser()
                
                print("Yeni")
            }
                
            else{
                print("Var olan kullanıcı")
                
                let mainAppViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeTB")
                
                
                
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                    let sceneDelegate = windowScene.delegate as? SceneDelegate,
                    let window = sceneDelegate.window{
                    
                    window.rootViewController = mainAppViewController
                    
                    UIView.transition(with: window,
                                      duration: 0.25,
                                      options: .transitionCrossDissolve,
                                      animations: nil,
                                      completion: nil)
                }
            }
            
        }
    

    // MARK: - Functions
    // MARK: - Actions
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPage == slides.count - 1 {
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeTB") as! UITabBarController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true)
            
            
        } else {
            currentPage += 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        }
        
    }
}

extension OnboardingViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
        
    }
    // MARK: - collection viewın CGSizeını belirledik
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // MARK: - PageControl ayarı burada yaptık
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}


class Core {
    
    static let shared = Core()
    
    func isNewUser () -> Bool {
        
        return !UserDefaults.standard.bool(forKey: "isNewUser")
        
    }
    func setIsNotNewUser() {
        
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
    
}
