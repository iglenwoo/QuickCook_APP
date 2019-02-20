//
//  RecipeAddViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 2/19/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit

class RecipeAddViewController: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var yields: UITextField!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var directions: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateTextView(ingredients)
        decorateTextView(directions)
    }

    private func decorateTextView(_ textView: UITextView) {
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor.gray.cgColor
    }

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
