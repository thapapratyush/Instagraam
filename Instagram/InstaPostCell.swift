//
//  InstaPostCell.swift
//  Instagram
//
//  Created by Pratyush Thapa on 3/5/17.
//  Copyright © 2017 Pratyush Thapa. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstaPostCell: UITableViewCell {

    @IBOutlet weak var postImageView: PFImageView!
    @IBOutlet weak var captionLabel: UILabel!

    
    var post: PFObject! {
        didSet {
            self.postImageView.file = post?["media"] as? PFFile
            self.postImageView.loadInBackground()
            self.captionLabel.text = post?["caption"] as? String
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
