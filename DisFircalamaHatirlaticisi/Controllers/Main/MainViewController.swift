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
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        modelsArray()
        
    
    
    }
    
    
    
    
    // MARK: - Functions
    
    func modelsArray(){
        
        mainModels = [
        
            MainModels(dayNumber: "1. Gün", backgroundImages: UIImage(imageLiteralResourceName: "1")),
            MainModels(dayNumber: "2. Gün", backgroundImages: UIImage(imageLiteralResourceName: "2")),
            MainModels(dayNumber: "3. Gün", backgroundImages: UIImage(imageLiteralResourceName: "3")),
            MainModels(dayNumber: "4. Gün", backgroundImages: UIImage(imageLiteralResourceName: "4")),
            MainModels(dayNumber: "5. Gün", backgroundImages: UIImage(imageLiteralResourceName: "5")),
            MainModels(dayNumber: "6. Gün", backgroundImages: UIImage(imageLiteralResourceName: "6")),
            MainModels(dayNumber: "7. Gün", backgroundImages: UIImage(imageLiteralResourceName: "7")),
            MainModels(dayNumber: "8. Gün", backgroundImages: UIImage(imageLiteralResourceName: "8")),
            MainModels(dayNumber: "9. Gün", backgroundImages: UIImage(imageLiteralResourceName: "9")),
            MainModels(dayNumber: "10. Gün", backgroundImages: UIImage(imageLiteralResourceName: "10")),
            MainModels(dayNumber: "11. Gün", backgroundImages: UIImage(imageLiteralResourceName: "1")),
            MainModels(dayNumber: "12. Gün", backgroundImages: UIImage(imageLiteralResourceName: "2")),
            MainModels(dayNumber: "13. Gün", backgroundImages: UIImage(imageLiteralResourceName: "3")),
            MainModels(dayNumber: "14. Gün", backgroundImages: UIImage(imageLiteralResourceName: "4")),
            MainModels(dayNumber: "15. Gün", backgroundImages: UIImage(imageLiteralResourceName: "5")),
            MainModels(dayNumber: "16. Gün", backgroundImages: UIImage(imageLiteralResourceName: "6")),
            MainModels(dayNumber: "17. Gün", backgroundImages: UIImage(imageLiteralResourceName: "7")),
            MainModels(dayNumber: "18. Gün", backgroundImages: UIImage(imageLiteralResourceName: "8")),
            MainModels(dayNumber: "19. Gün", backgroundImages: UIImage(imageLiteralResourceName: "9")),
            MainModels(dayNumber: "20. Gün", backgroundImages: UIImage(imageLiteralResourceName: "10")),
            MainModels(dayNumber: "21. Gün", backgroundImages: UIImage(imageLiteralResourceName: "1")),
            MainModels(dayNumber: "22. Gün", backgroundImages: UIImage(imageLiteralResourceName: "2")),
            MainModels(dayNumber: "23. Gün", backgroundImages: UIImage(imageLiteralResourceName: "3")),
            MainModels(dayNumber: "24. Gün", backgroundImages: UIImage(imageLiteralResourceName: "4")),
            MainModels(dayNumber: "25. Gün", backgroundImages: UIImage(imageLiteralResourceName: "5")),
            MainModels(dayNumber: "26. Gün", backgroundImages: UIImage(imageLiteralResourceName: "6")),
            MainModels(dayNumber: "27. Gün", backgroundImages: UIImage(imageLiteralResourceName: "7")),
            MainModels(dayNumber: "28. Gün", backgroundImages: UIImage(imageLiteralResourceName: "8")),
            MainModels(dayNumber: "29. Gün", backgroundImages: UIImage(imageLiteralResourceName: "9")),
            MainModels(dayNumber: "30. Gün", backgroundImages: UIImage(imageLiteralResourceName: "10")),





            
            
         
            
        
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
    }
    
    
    
}

