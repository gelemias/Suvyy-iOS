//
//  ViewController.swift
//  Survyy
//
//  Created by Guillermo Delgado on 03/08/2017.
//  Copyright © 2017 Survyy Sp z.o.o. All rights reserved.
//

import UIKit

class SVRootViewController: SVBaseViewController {

    let kShowLoginSegue = "ShowLoginSegue"
    let kShowHomeSegue = "ShowHomeSegue"
    let kShowIntroSegue = "ShowIntroSegue"
    let kShowFillUpSegue = "ShowFillUpSegue"

    override func viewWillAppear(_ animated: Bool) {

        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {

        super.viewWillDisappear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        var shouldSkipIntro = false
        if let shouldSkipIntroStoredVal = UserDefaults.standard.value(forKey: SVConstants.shouldSkipIntroKey) as? Bool {
            shouldSkipIntro = shouldSkipIntroStoredVal
        }

        // Login
        if !SVLoginManager.shared.isUserAuthorized() {
            self.performSegue(withIdentifier: kShowLoginSegue, sender: self)
        }
        // Intro
        else if !shouldSkipIntro {
            self.performSegue(withIdentifier: kShowIntroSegue, sender: self)
            UserDefaults.standard.setValue(true, forKey: SVConstants.shouldSkipIntroKey)
        }
        // Home
        else {
            self.performSegue(withIdentifier: kShowHomeSegue, sender: self)
        }
    }
}
