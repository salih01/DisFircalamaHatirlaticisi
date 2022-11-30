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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setup(_ tableModel:MainModels){
        cellDayLabel.text = String(tableModel.dayNumber)
        cellBackgroundView.image = tableModel.backgroundImages
       
 
    }

}
