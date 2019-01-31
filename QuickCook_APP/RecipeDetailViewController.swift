//
//  RecipeDetailViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/30/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var data: UILabel!
    var index: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        data.text = ("You tapped the cell at index \(index ?? -1)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
