//
//  WelcomeViewController.swift
//  platzitweets
//
//  Created by Omar Flores on 10/10/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        loginButton.layer.cornerRadius = 25
    }

}
