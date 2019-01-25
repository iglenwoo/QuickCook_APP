//
//  ViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/9/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import Firebase

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func signOutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            debugPrint("[AccountViewController] Signing out succeeded")

        } catch let signOutError as NSError {
            debugPrint("[AccountViewController] Error signing out: \(signOutError.localizedDescription)")
        }
    }
}
