//
//  MainTableViewCell.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 28.11.2022.
//

import UIKit
import Lottie

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellDayLabel: UILabel!

    @IBOutlet weak var cellBackgroundView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func setup(_ tableModel:MainModels){
        cellDayLabel.text = String(tableModel.dayNumber)
        cellBackgroundView.image = tableModel.backgroundImages
        
 
    }

}
