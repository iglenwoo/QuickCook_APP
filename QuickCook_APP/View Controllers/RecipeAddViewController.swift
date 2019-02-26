//
//  RecipeAddViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 2/19/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class RecipeAddViewController: UIViewController {

    var ref: DatabaseReference!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var minutesField: UITextField!
    @IBOutlet weak var yieldsField: UITextField!
    @IBOutlet weak var ingredientView: UITextView!
    @IBOutlet weak var directionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDatabase()

        decorateTextField(nameField)
        decorateTextField(minutesField)
        decorateTextField(yieldsField)
        decorateTextView(ingredientView)
        decorateTextView(directionView)

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
        let uuid = UUID().uuidString
        let uploader = Auth.auth().currentUser!.uid
        let name = nameField.text ?? "Empty"
        let desc = "add desc text field" //TODO
        let time = Time(prep: 10, cook: 20) //TODO
        let yield = Int(yieldsField.text ?? "0") ?? 0
        let ingredients = ingredientView.text.components(separatedBy: CharacterSet.newlines)
        let directions = directionView.text.components(separatedBy: CharacterSet.newlines)

        let value = [
            "uploader": uploader,
            "name": name,
            "desc": desc,
            "ingredients": ingredients,
            "time": time.toDictionary(),
            "yield": yield,
            "directions": directions,
        ] as [String : Any]

        self.ref.child("recipes/\(uuid)").setValue(value)

        // TODO: catch result of setValue -> close view
    }

}
