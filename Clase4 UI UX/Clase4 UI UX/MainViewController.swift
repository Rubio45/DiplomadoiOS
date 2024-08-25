//
//  MainViewController.swift
//  Clase4 UI UX
//
//  Created by Alex Diaz on 24/8/24.
//

import UIKit

class MainViewController: UIViewController {

    
    var myLabel: UILabel = {
       let label = UILabel()
       label.text = "Bienvenido a la app"
       label.textAlignment = .center
       label.font = .systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 1
       return label
    }()
    
    var mySubtitle: UILabel = {
       let label = UILabel()
       label.text = "Reserve su viaje"
       label.textAlignment = .center
       label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 1
       return label
    }()
    
    var myButton: UIButton = {
        var button = UIButton()
        button.setTitle("Reserve", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    var isButtonPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)

        view.backgroundColor = .white
        updateUI()
    }
    
    @objc func ButtonPressed() {
        let secondViewController = SecondViewController()
        navigationController?.pushViewController(secondViewController, animated: true)
        
        isButtonPressed.toggle()
        myButton.setTitle(isButtonPressed ? "Cancelar" : "Reservar", for: .normal)
        mySubtitle.text =  isButtonPressed ? "Reservado" : "Cancelado"
        updateUI()
    }
    
    private func updateUI() {
        
        // Anadir a la vista y darle constraints
        view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mySubtitle)
        mySubtitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myButton)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        //dale las constraints
        NSLayoutConstraint.activate([
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            //constraints al subtitulos
            mySubtitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySubtitle.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 10),
            
            //button
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.topAnchor.constraint(equalTo: mySubtitle.bottomAnchor, constant: 20),
            myButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

}
