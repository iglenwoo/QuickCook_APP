//
//  RecipeTableViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/22/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseUI

class RecipeTableViewController: UITableViewController {

    // MARK - Properties
    var recipes = [Recipe]()

    var ref: DatabaseReference!
    var recipesRef: DatabaseReference!
    var refHandle: DatabaseHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView.allowsSelection = true

        debugPrint("[RecipeTableViewController] viewDidLoad called")

        configureDatabase()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func configureDatabase() {
        ref = Database.database().reference()

        let identifier = "recipes"
        recipesRef = ref.child(identifier);

        recipesRef.observe(DataEventType.value, with: { snapshot in
            self.recipes.removeAll()

            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot {
                    self.recipes.append(Recipe(snapshot: snapshot)!)
                }
            }

            self.tableView.reloadData()
        })
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell

        // Configure the cell...
        let recipe = recipes[indexPath.row]
        cell.name.text = recipe.name

        let time = String(recipe.time.prep + recipe.time.cook)
        cell.time.text = "\(time) m"

        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let currentUser = Auth.auth().currentUser else {
            print("currentUser is nil")
            return
        }

        if editingStyle == .delete {
            let recipe = recipes[indexPath.row]
            if (recipe.uploader == currentUser.uid) {
                guard let key = recipe.key else {
                    let alert = UIAlertController(title: "Alert", message: "This recipe cannot be removed", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                let identifier = "recipes/\(key)"
                ref.child(identifier).removeValue();

                recipes.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .bottom)
            } else {
                let alert = UIAlertController(title: "Alert", message: "You can only remove your recipes", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "AddRecipe":
            print("Add Recipe")
        case "GoDetails":
            print("Go Details")
            let indexPath = tableView.indexPathForSelectedRow
            let index = indexPath?.row
            let detailVC = segue.destination as! DetailRecipeTableViewController
            detailVC.index = index
            detailVC.recipe = recipes[index!]
        default:
            print("???")
        }
    }

}
