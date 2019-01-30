//
//  RecipeCell.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/24/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    // MARK - IBOutlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
