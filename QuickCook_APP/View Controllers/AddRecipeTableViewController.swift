//
//  AddRecipeTableViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 2/26/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddRecipeTableViewController: UITableViewController {

    var ref: DatabaseReference!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var yieldsField: UITextField!
    @IBOutlet weak var prepMinField: UITextField!
    @IBOutlet weak var cookMinField: UITextField!
    @IBOutlet weak var ingredientView: UITextView!
    @IBOutlet weak var directionView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureDatabase()

//        decorateTextField(nameField)
//        decorateTextField(yieldsField)
//        decorateTextField(prepMinField)
//        decorateTextField(cookMinField)
//        decorateTextView(ingredientView)
//        decorateTextView(directionView)
    }

    private func configureDatabase() {
        ref = Database.database().reference()
    }

    private func decorateTextField(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }

    private func decorateTextView(_ textView: UITextView) {
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor.lightGray.cgColor
    }

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        let uploader = Auth.auth().currentUser!.uid
        let name = nameField.text ?? ""
        let desc = descField.text ?? ""
        let yield = Int(yieldsField.text ?? "0") ?? 0
        let prepMin = Int(prepMinField.text ?? "0") ?? 0
        let cookMin = Int(cookMinField.text ?? "0") ?? 0
        let time = Time(prep: prepMin, cook: cookMin).toDictionary()
        let ingredients = ingredientView.text.components(separatedBy: CharacterSet.newlines)
        let directions = directionView.text.components(separatedBy: CharacterSet.newlines)

        let key = ref.child("recipes").childByAutoId().key

        let value = [
            "uploader": uploader,
            "name": name,
            "desc": desc,
            "yield": yield,
            "time": time,
            "ingredients": ingredients,
            "directions": directions,
        ] as [String : Any]

        let childUpdates = [
            "/recipes/\(key)": value,
        ]

        self.ref.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) -> Void in
            if (error != nil) {
                print("Add new recipe: , Failed: \(error?.localizedDescription)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }

}
