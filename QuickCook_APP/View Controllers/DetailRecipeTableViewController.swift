//
//  DetailRecipeTableViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 3/12/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class DetailRecipeTableViewController: UITableViewController {

    var index: Int!
    var recipe: Recipe!
    
//    var ref: DatabaseReference!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var yieldsField: UITextField!
    @IBOutlet weak var prepMinField: UITextField!
    @IBOutlet weak var cookMinField: UITextField!
    @IBOutlet weak var ingredientView: UITextView!
    @IBOutlet weak var directionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        configureDatabase()
        
        setRecipe()
        adjustUITextViewHeight(arg: ingredientView)
        adjustUITextViewHeight(arg: directionView)
        setNumberOnly()

//        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing))
//        navigationItem.rightBarButtonItem = editButton

        setEditable(to: self.tableView.isEditing)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    private func configureDatabase() {
//        ref = Database.database().reference()
//    }

    @objc private func toggleEditing() {
        self.tableView.setEditing(!self.tableView.isEditing, animated: true)

        setEditable(to: self.tableView.isEditing)
        
        if !self.tableView.isEditing {
            // update DB
        }

        navigationItem.rightBarButtonItem?.title = self.tableView.isEditing ? "Done" : "Edit"
    }

    private func setRecipe() {
        nameField.text = recipe.name
        descField.text = recipe.desc
        yieldsField.text = String(recipe.yield)
        prepMinField.text = String(recipe.time.prep)
        cookMinField.text = String(recipe.time.cook)
        ingredientView.text = recipe.ingredients.joined(separator: "\n")
        directionView.text = recipe.directions.joined(separator: "\n")
    }
    
    private func setNumberOnly() {
        yieldsField.delegate = self
        prepMinField.delegate = self
        cookMinField.delegate = self
    }
    
    private func setEditable(to: Bool) {
        nameField.isEnabled = to
        descField.isEnabled = to
        yieldsField.isEnabled = to
        prepMinField.isEnabled = to
        cookMinField.isEnabled = to
        ingredientView.isEditable = to
        directionView.isEditable = to
    }
    
    private func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

}

extension DetailRecipeTableViewController {
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
}

extension DetailRecipeTableViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard NSCharacterSet(charactersIn: "0123456789").isSuperset(of: NSCharacterSet(charactersIn: string) as CharacterSet) else {
            return false
        }
        return true
    }
    
}
