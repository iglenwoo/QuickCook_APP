//
//  ViewController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/9/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        try! Auth.auth().signOut()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Auth.auth().currentUser != nil {
            //do something :D
            performSegue(withIdentifier: "goHome", sender: self)
        } else {
            let authUI = FUIAuth.defaultAuthUI()
            authUI?.delegate = self
            let providers: [FUIAuthProvider] = [
                FUIGoogleAuth()]
            
            authUI?.providers = providers
            let authViewController = authUI!.authViewController()
            self.present(authViewController, animated: true, completion: nil)
        }
    }

    @IBAction func loginButton(_ sender: UIButton) {
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        
        let authViewControll = authUI!.authViewController()
        
        present(authViewControll, animated: true, completion: nil)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            return
        }
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
