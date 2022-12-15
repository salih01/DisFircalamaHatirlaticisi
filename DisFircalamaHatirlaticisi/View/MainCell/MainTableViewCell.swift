//
//  MainTableViewCell.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 28.11.2022.
//

import UIKit
import Lottie
import CoreData



class MainTableViewCell: UITableViewCell ,UINavigationControllerDelegate{

    
    
    @IBOutlet weak var cellDayLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIImageView!
    @IBOutlet weak var completeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        MainViewController.shared.loadItems()
    
    }

 
    
    func setup(_ tableModel:MainModels){
        cellDayLabel.text = String(tableModel.dayNumber)
        cellBackgroundView.image = tableModel.backgroundImages
 
    }
    
    


}
