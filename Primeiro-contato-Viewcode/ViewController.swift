//
//  ViewController.swift
//  Primeiro-contato-Viewcode
//
//  Created by Giulia Marinho on 25/04/24.
//

import UIKit

// Classe é o início do seu código, onde voce cria uma UIViewController
class ViewController: UIViewController {
    
    // Ciclo de vida da View (Pai -> ViewController)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Alteração de cores"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupUI()
        setupConstraints()
    }
    
    // Componentes que iremos colocar na View (Pai -> ViewController)
    lazy var myView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Trocar a cor", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButtonOne), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Resetar a cor", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButtonTwo), for: .touchUpInside)
        return button
    }()
    
    // Adicionando a UIView à hierarquia de visualização da ViewController
    func setupUI() {
        view.addSubview(myView)
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
    }
    
    // Definindo as Constraints de layout usando Auto Layout
    func setupConstraints() {
        NSLayoutConstraint.activate([
            myView.widthAnchor.constraint(equalToConstant: 150),
            myView.heightAnchor.constraint(equalToConstant: 150),
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            buttonOne.widthAnchor.constraint(equalToConstant: 150),
            buttonOne.heightAnchor.constraint(equalToConstant: 50),
            buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonOne.topAnchor.constraint(equalTo:myView.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            
            buttonTwo.widthAnchor.constraint(equalToConstant: 150),
            buttonTwo.heightAnchor.constraint(equalToConstant: 50),
            buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTwo.topAnchor.constraint(equalTo:buttonOne.safeAreaLayoutGuide.bottomAnchor, constant: 30),
        ])
    }
    
    // Função para clicar no botão
    @objc func didTapButtonOne() {
         var cores: [UIColor] = [
            UIColor.red,
            UIColor.blue,
            UIColor.green,
            UIColor.yellow,
            UIColor.purple
        ]
        
        myView.backgroundColor = cores.randomElement()
    }
    
    @objc func didTapButtonTwo() {
        myView.backgroundColor = .black
    }
}
