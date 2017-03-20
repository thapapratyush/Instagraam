//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Sudheesh Bhattarai on 3/12/17.
//  Copyright © 2017 Sudheesh Bhattarai. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var workingImageView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
