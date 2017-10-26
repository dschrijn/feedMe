//
//  customTVCell.swift
//  secondFeedrReader
//
//  Created by David A. Schrijn on 3/20/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

class customTVCell: UITableViewCell {

    // MARK: - Variables
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageReview: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    
    // MARK: - App Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
        
        backView.layer.borderWidth = 5
        backView.layer.cornerRadius = 7
        backView.layer.borderColor = UIColor.clear.cgColor
        backView.layer.masksToBounds = true
        
        layer.shadowOpacity = 0.45
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        layer.masksToBounds = false
        
        imageReview.layer.cornerRadius = 4.0
        imageReview.layer.masksToBounds = true
    }
    
    // MARK: - Functions

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}




