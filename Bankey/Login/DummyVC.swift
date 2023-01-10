//
//  DummyVC.swift
//  Bankey
//
//  Created by Ethan Gonsalves on 2023-01-09.
//

import UIKit

class DummyVC: UIViewController {
    let stackView = UIStackView()
    let dummyLabel = UILabel()
    let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        style()
       
    }
    
    func layout(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(dummyLabel)
        stackView.addArrangedSubview(logoutButton)
        
        NSLayoutConstraint.activate([
        
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            dummyLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            dummyLabel.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
                
            logoutButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            logoutButton.topAnchor.constraint(equalTo: dummyLabel.topAnchor, constant: 50)
          
         
            
          
        ])
       
        
    }
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical
        stackView.spacing = 20
        
        dummyLabel.translatesAutoresizingMaskIntoConstraints = false
        dummyLabel.text = "Dummy text"
        dummyLabel.font = .preferredFont(forTextStyle: .headline)
        dummyLabel.textColor = .black
        dummyLabel.textAlignment = .center
        
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.configuration?.imagePadding = 8
        logoutButton.setTitle("logout", for: .normal)
        
 
        
        
    }
     
}
