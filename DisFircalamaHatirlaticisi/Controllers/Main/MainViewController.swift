//
//  MainViewController.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 27.11.2022.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    
    var mainModels:[MainModels] = []
    
    
    var myDetails:[Details] = []
    var chosenDay : Details?

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        modelsArray()
        
       
       
            let details1 = Details(detailsAnimationView: "5", detailsDayLabel: "1. Gün", detailsTextView: "Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar")
            let details2 = Details(detailsAnimationView: "4", detailsDayLabel: "2. Gün", detailsTextView: "Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylarDetaylar detaylarDetaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylar,Detaylar detaylarLorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")
            let details3 = Details(detailsAnimationView: "2", detailsDayLabel: "3. Gün", detailsTextView: "Detaylar detaylar")
            let details4 = Details(detailsAnimationView: "3", detailsDayLabel: "4. Gün", detailsTextView: "Detaylar detaylar")
            let details5 = Details(detailsAnimationView: "4", detailsDayLabel: "5. Gün", detailsTextView: "Detaylar detaylar")
            let details6 = Details(detailsAnimationView: "5", detailsDayLabel: "6. Gün", detailsTextView: "Detaylar detaylar")
            let details7 = Details(detailsAnimationView: "6", detailsDayLabel: "7. Gün", detailsTextView: "Detaylar detaylar")
            let details8 = Details(detailsAnimationView: "7", detailsDayLabel: "8. Gün", detailsTextView: "Detaylar detaylar")
            let details9 = Details(detailsAnimationView: "8", detailsDayLabel: "9. Gün", detailsTextView: "Detaylar detaylar")
            let details10 = Details(detailsAnimationView: "9", detailsDayLabel: "10. Gün", detailsTextView: "Detaylar detaylar")
            let details11 = Details(detailsAnimationView: "1", detailsDayLabel: "11. Gün", detailsTextView: "Detaylar detaylar")
            let details12 = Details(detailsAnimationView: "1", detailsDayLabel: "12. Gün", detailsTextView: "Detaylar detaylar")
            let details13 = Details(detailsAnimationView: "1", detailsDayLabel: "13. Gün", detailsTextView: "Detaylar detaylar")
            let details14 = Details(detailsAnimationView: "1", detailsDayLabel: "14. Gün", detailsTextView: "Detaylar detaylar")
            let details15 = Details(detailsAnimationView: "1", detailsDayLabel: "15. Gün", detailsTextView: "Detaylar detaylar")
            let details16 = Details(detailsAnimationView: "1", detailsDayLabel: "16. Gün", detailsTextView: "Detaylar detaylar")
            let details17 = Details(detailsAnimationView: "1", detailsDayLabel: "17. Gün", detailsTextView: "Detaylar detaylar")
            let details18 = Details(detailsAnimationView: "1", detailsDayLabel: "18. Gün", detailsTextView: "Detaylar detaylar")
            let details19 = Details(detailsAnimationView: "1", detailsDayLabel: "19. Gün", detailsTextView: "Detaylar detaylar")
            let details20 = Details(detailsAnimationView: "1", detailsDayLabel: "20. Gün", detailsTextView: "Detaylar detaylar")
            let details21 = Details(detailsAnimationView: "1", detailsDayLabel: "21. Gün", detailsTextView: "Detaylar detaylar")
            let details22 = Details(detailsAnimationView: "1", detailsDayLabel: "22. Gün", detailsTextView: "Detaylar detaylar")
            let details23 = Details(detailsAnimationView: "1", detailsDayLabel: "23. Gün", detailsTextView: "Detaylar detaylar")
            let details24 = Details(detailsAnimationView: "1", detailsDayLabel: "24. Gün", detailsTextView: "Detaylar detaylar")
            let details25 = Details(detailsAnimationView: "1", detailsDayLabel: "25. Gün", detailsTextView: "Detaylar detaylar")
            let details26 = Details(detailsAnimationView: "1", detailsDayLabel: "26. Gün", detailsTextView: "Detaylar detaylar")
            let details27 = Details(detailsAnimationView: "1", detailsDayLabel: "27. Gün", detailsTextView: "Detaylar detaylar")
            let details28 = Details(detailsAnimationView: "1", detailsDayLabel: "28. Gün", detailsTextView: "Detaylar detaylar")
            let details29 = Details(detailsAnimationView: "1", detailsDayLabel: "29. Gün", detailsTextView: "Detaylar detaylar")
            let details30 = Details(detailsAnimationView: "1", detailsDayLabel: "30. Gün", detailsTextView: "Detaylar detaylar")
            
        
        myDetails.append(details1)
        myDetails.append(details2)
        myDetails.append(details3)
        myDetails.append(details4)
        myDetails.append(details5)
        myDetails.append(details6)
        myDetails.append(details7)
        myDetails.append(details8)
        myDetails.append(details9)
        myDetails.append(details10)
        myDetails.append(details11)
        myDetails.append(details12)
        myDetails.append(details13)
        myDetails.append(details14)
        myDetails.append(details15)
        myDetails.append(details16)
        myDetails.append(details17)
        myDetails.append(details18)
        myDetails.append(details19)
        myDetails.append(details20)
        myDetails.append(details21)
        myDetails.append(details22)
        myDetails.append(details23)
        myDetails.append(details24)
        myDetails.append(details25)
        myDetails.append(details26)
        myDetails.append(details27)
        myDetails.append(details28)
        myDetails.append(details29)
        myDetails.append(details30)

    }
    
    
    // MARK: - Functions
    
    
   
    
    func modelsArray(){
        
        mainModels = [
        
            MainModels(dayNumber: "1. Gün", backgroundImages: UIImage(named: "1")!),
            MainModels(dayNumber: "2. Gün", backgroundImages: UIImage(named: "2")!),
            MainModels(dayNumber: "3. Gün", backgroundImages: UIImage(named: "3")!),
            MainModels(dayNumber: "4. Gün", backgroundImages: UIImage(named: "4")!),
            MainModels(dayNumber: "5. Gün", backgroundImages: UIImage(named: "5")!),
            MainModels(dayNumber: "6. Gün", backgroundImages: UIImage(named: "6")!),
            MainModels(dayNumber: "7. Gün", backgroundImages: UIImage(named: "7")!),
            MainModels(dayNumber: "8. Gün", backgroundImages: UIImage(named: "8")!),
            MainModels(dayNumber: "9. Gün", backgroundImages: UIImage(named: "9")!),
            MainModels(dayNumber: "10. Gün", backgroundImages: UIImage(named: "10")!),
            MainModels(dayNumber: "11. Gün", backgroundImages: UIImage(named: "1")!),
            MainModels(dayNumber: "12. Gün", backgroundImages: UIImage(named: "2")!),
            MainModels(dayNumber: "13. Gün", backgroundImages: UIImage(named: "3")!),
            MainModels(dayNumber: "14. Gün", backgroundImages: UIImage(named: "4")!),
            MainModels(dayNumber: "15. Gün", backgroundImages: UIImage(named: "5")!),
            MainModels(dayNumber: "16. Gün", backgroundImages: UIImage(named: "6")!),
            MainModels(dayNumber: "17. Gün", backgroundImages: UIImage(named: "7")!),
            MainModels(dayNumber: "18. Gün", backgroundImages: UIImage(named: "8")!),
            MainModels(dayNumber: "19. Gün", backgroundImages: UIImage(named: "9")!),
            MainModels(dayNumber: "20. Gün", backgroundImages: UIImage(named: "10")!),
            MainModels(dayNumber: "21. Gün", backgroundImages: UIImage(named: "1")!),
            MainModels(dayNumber: "22. Gün", backgroundImages: UIImage(named: "2")!),
            MainModels(dayNumber: "23. Gün", backgroundImages: UIImage(named: "3")!),
            MainModels(dayNumber: "24. Gün", backgroundImages: UIImage(named: "4")!),
            MainModels(dayNumber: "25. Gün", backgroundImages: UIImage(named: "5")!),
            MainModels(dayNumber: "26. Gün", backgroundImages: UIImage(named: "6")!),
            MainModels(dayNumber: "27. Gün", backgroundImages: UIImage(named: "7")!),
            MainModels(dayNumber: "28. Gün", backgroundImages: UIImage(named: "8")!),
            MainModels(dayNumber: "29. Gün", backgroundImages: UIImage(named: "9")!),
            MainModels(dayNumber: "30. Gün", backgroundImages: UIImage(named: "10")!)

      
        ]
        
    }
    

    // MARK: - Actions
    
    
    
}

extension MainViewController:UITableViewDelegate,UITableViewDataSource {
    
    // dataSorce
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModels.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        cell.setup(mainModels[indexPath.row])
       
        return cell
        
    }
    
    // delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        let selectCell = cell.setup(mainModels[indexPath.row])
        chosenDay = myDetails[indexPath.row]
        
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            
            let destinationVC = segue.destination as! DetailViewController
            destinationVC.selectedDetails = chosenDay
            
            
            
            if let indexPathh = tableView.indexPathForSelectedRow {
                indexPathh.row
            }
            
        }
    }
    
}

