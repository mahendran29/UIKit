//
//  ViewController.swift
//  AutoLayout
//
//  Created by mahendran-14703 on 19/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    let blueView: UIView = {
        let blueView = UIView()
        blueView.backgroundColor = .link
        blueView.translatesAutoresizingMaskIntoConstraints = false
        return blueView
    }()
    
    let redView: UIView = {
        let redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        return redView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        blueView.addSubview(redView)
        view.addSubview(blueView)
        
        addConstraints()
    }
    
    func addConstraints() {
    
        NSLayoutConstraint.activate([
        
            blueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            blueView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
//            redView.leadingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: 20),
//            redView.trailingAnchor.constraint(equalTo: blueView.trailingAnchor, constant: -20),
//            redView.topAnchor.constraint(equalTo: blueView.topAnchor, constant: 20),
//            redView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor, constant: -20),
            
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor,multiplier: 0.5),
            redView.heightAnchor.constraint(equalTo: blueView.heightAnchor,multiplier: 0.5),
            
          //  redView.centerXAnchor.constraint(equalTo: blueView.centerXAnchor),
            redView.topAnchor.constraint(equalTo: blueView.topAnchor)
            
        
        
        ])
        
    }
}

