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
        
        yieldsField.delegate = self
        prepMinField.delegate = self
        cookMinField.delegate = self
    }

    private func configureDatabase() {
        ref = Database.database().reference()
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

        guard let key = ref.child("recipes").childByAutoId().key else {
            print("Failed: childByAutoId")
            self.dismiss(animated: true, completion: nil)
            return
        }

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
                print("Add new recipe: , Failed: \(error.debugDescription)")
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }

}

extension AddRecipeTableViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard NSCharacterSet(charactersIn: "0123456789").isSuperset(of: NSCharacterSet(charactersIn: string) as CharacterSet) else {
            return false
        }
        return true
    }
    
}
