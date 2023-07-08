//
//  AutorizationViewController.swift
//  homework22
//
//  Created by karim on 07.07.2023.
//

import UIKit
class AutorizationViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var addNameLabel: UILabel!
    
    @IBOutlet weak var addNumberLabel: UILabel!
    @IBOutlet weak var addPasswordLabel: UILabel!
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addNumberTextField: UITextField!
    @IBOutlet weak var addPasswordTextField: UITextField!
    @IBOutlet weak var addContactButton: UIButton!
    
    let password = "1234" // Заданный пароль
    override func viewDidLoad() {
        super.viewDidLoad()
        addNumberTextField.delegate = self
        addPasswordTextField.delegate = self
        
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let Number = addNumberTextField.text,
              Number.hasPrefix("8908"),
              addPasswordTextField.text == password else {
            showErrorScreen()
            return
        }
        
        showContactsScreen()
    }
    
    func showErrorScreen() {
        let alertController = UIAlertController(title: "Ошибка", message: "Неверный номер телефона или пароль", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        guard let number = addNumberTextField.text, !number.isEmpty else {
            present(alertController, animated: true)
            return
        }
        guard let password = addPasswordTextField.text, !password.isEmpty else {
            present(alertController, animated: true)
            return
        }
        guard let name = addNameTextField.text, !name.isEmpty else {
            present(alertController, animated: true)
            return
        }
    }
    
    
    func showContactsScreen() {
        let ViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: ViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
        
    }
}

