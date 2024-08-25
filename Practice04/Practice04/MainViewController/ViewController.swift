//
//  ViewController.swift
//  Practice04
//
//  Created by Junior Escoto on 8/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting background to white. Defaults is black
        view.backgroundColor = .white
        
        // actualizar la UI cuando cargue
        setUI()
    }

    func setUI() {
        
        // main variables
        let title: UILabel = {
            let title = UILabel()
            title.text = "Bienvenidos"
            title.textColor = .black
            title.translatesAutoresizingMaskIntoConstraints = false
            title.font = UIFont.boldSystemFont(ofSize: 28)
            title.numberOfLines = 0
            title.textAlignment = .center
            return title
        }()
        
        let subtitle: UILabel = {
            let subtitle = UILabel()
            subtitle.text = "Este es un ejemplo de subtitle"
            subtitle.textAlignment = .center
            subtitle.translatesAutoresizingMaskIntoConstraints = false
            subtitle.font = UIFont.systemFont(ofSize: 20)
            subtitle.numberOfLines = 0
            return subtitle
        }()
        
        let myButton: UIButton = {
            let myButton = UIButton()
            myButton.setTitle("Click", for: .normal)
            myButton.setTitleColor(.white, for: .normal)
            myButton.translatesAutoresizingMaskIntoConstraints = false
            myButton.backgroundColor = .brown
            myButton.layer.cornerRadius = 8
            return myButton
        }()
        // adding UIs to the main view
        view.addSubview(myButton)
        view.addSubview(title)
        view.addSubview(subtitle)
        
        //setting a function to the button to go to the next screen
        myButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        // constraints para la UI
        NSLayoutConstraint.activate([
            // title
            title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            //subtitle
            subtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            
            // button
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 20),
            myButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func buttonPressed() {
        // desplazar a la version segunda
        let secondViewController = SecondViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

