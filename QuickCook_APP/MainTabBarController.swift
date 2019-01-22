//
//  MainTabBarController.swift
//  QuickCook_APP
//
//  Created by Ingyu Woo on 1/22/19.
//  Copyright © 2019 Ingyu Woo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class MainTabBarController: UITabBarController {

    /** @var handle
     @brief The handle for the auth state listener, to allow cancelling later.
     */
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        // NOTE: temporary signout...
        //try! Auth.auth().signOut()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // TODO: handle user session correctly
        if Auth.auth().currentUser != nil {
            print("Current user is \"\(Auth.auth().currentUser.debugDescription)\"")
        } else {
            openLoginView()
        }
    }

    /* Listen for authentication state
     Attach a listener to the FIRAuth object.
     This listener gets called whenever the users' sign-in state changes
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            print(user ?? "addStateDidChangeListener called");
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        Auth.auth().removeStateDidChangeListener(handle!)
        print("removeStateDidChangeListener called")
    }


    @IBAction func signOutTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            print("Signing out succeeded")
            openLoginView()
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }

    }
}

extension MainTabBarController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            print(error?.localizedDescription ?? "error?")
            return
        }

        let pid = authDataResult!.user.providerID
        print("providerID is \"\(pid)\"")
    }
}

extension MainTabBarController {
    func openLoginView() {
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth()]

        authUI?.providers = providers
        let authViewController = authUI!.authViewController()
        self.present(authViewController, animated: true, completion: nil)
    }
}
