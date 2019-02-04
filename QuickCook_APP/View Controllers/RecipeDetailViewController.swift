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
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var yield: UILabel!
    
    @IBOutlet weak var ingredients: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = recipe.name
        min.text = "\(String(recipe.time.prep + recipe.time.cook)) min"
        yield.text = "\(String(recipe.yield)) yield"

        ingredients.text = recipe.ingredients.joined(separator: "\n")
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
