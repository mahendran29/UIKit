//
//  ViewController.swift
//  NavigationController
//
//  Created by mahendran-14703 on 19/10/22.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBlue
        
        button.setTitle("Go to Nav Controller", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton() {
        let homePage = HomePageViewController()
        let navVC = UINavigationController(rootViewController: homePage)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

class HomePageViewController: UIViewController {
    
    let button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Welcome"
        button.setTitle("Go to another Nav Controller", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)
        
        button.addTarget(self, action: #selector(pushAnotherController), for: .touchUpInside)
        
    }
    
    @objc
    func pushAnotherController() {
        let profilePage = ProfileViewController()
        let navVC = UINavigationController(rootViewController: profilePage)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
}

class ProfileViewController: UIViewController {
    
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("Go to New", for: .normal)
        
        view.addSubview(button)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 52)

        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "DISMISS",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(goBack))
    }
    
    @objc
    func goBack() {
        dismiss(animated: true)
    }
}

