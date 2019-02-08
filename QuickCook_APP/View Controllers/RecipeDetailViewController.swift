//
//  RecipeDetailViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/30/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITextViewDelegate {

    // TODO: add Edit feature
    var index: Int!
    var recipe: Recipe!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var min: UILabel!
    @IBOutlet weak var yield: UILabel!

    @IBOutlet weak var stackView: UIStackView!

    var ingredientTitle: UILabel!
    var ingredientTextView: UITextView!
    var directionTitle: UILabel!
    var directionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setBasicRecipeInfo()

        ingredientTitle = createTitle(content: "Ingredients")
        stackView.addArrangedSubview(ingredientTitle)

        let ingredients = recipe.ingredients.joined(separator: "\n")
        ingredientTextView = createTextView(content: ingredients)
        stackView.addArrangedSubview(ingredientTextView)

        directionTitle = createTitle(content: "Directions")
        stackView.addArrangedSubview(directionTitle)

        let directions = recipe.directions.joined(separator: "\n")
        directionTextView = createTextView(content: directions)
        stackView.addArrangedSubview(directionTextView)
    }

    private func setBasicRecipeInfo() {
        name.text = recipe.name
        min.text = "\(String(recipe.time.prep + recipe.time.cook)) min"
        yield.text = "\(String(recipe.yield)) yield"
    }

    private func createTitle(content: String) -> UILabel {
        let title = UILabel()
        title.textColor = .darkGray
        title.text = content
        title.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        return title

    }

    private func createTextView(content: String) -> UITextView {
        let textView = UITextView()
        textView.text = content
        textView.textContainerInset = UIEdgeInsets(top: 4, left: 8, bottom: 8, right: 8)
        textView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: 20.0).isActive = true
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 8
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.isEditable = false

        adjustUITextViewHeight(arg: textView)

        return textView
    }

    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
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
