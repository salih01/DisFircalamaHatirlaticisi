//
//  OnboardingCollectionViewCell.swift
//  DisFircalamaHatirlaticisi
//
//  Created by ALFA on 26.11.2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    
    
    func setup(_ slide:OnboardingModel){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        
    }
}

