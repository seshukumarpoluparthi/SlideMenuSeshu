//
//  MenuTableViewCell.swift
//  SlideMenuSeshu
//
//  Created by apple on 11/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_Title: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
