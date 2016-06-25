//
//  FeedCell.swift
//  Parsegram
//
//  Created by Kenya Gordon on 6/23/16.
//  Copyright © 2016 Kenya Gordon. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FeedCell: UITableViewCell{

   
    @IBOutlet weak var photoView: PFImageView!
    @IBOutlet weak var captionLabel: UITextField!
    
    var instagramPost: PFObject! {
        didSet {
            self.photoView.file = instagramPost["media"] as? PFFile
            self.photoView.loadInBackground()
            self.captionLabel.text = instagramPost["caption"] as? String
      
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected stat
    }

}
