//
//  RecipeDetailViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/30/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    var index: Int!
    var recipe: Recipe!
    
//    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        desc.text = (recipe.desc)
        name.text = (recipe.name)
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
