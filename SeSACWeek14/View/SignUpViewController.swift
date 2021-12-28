//
//  SignUpViewController.swift
//  SeSACWeek14
//
//  Created by 박근보 on 2021/12/27.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    let mainView = SignUpView()
    let viewModel = SignUpViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel.username.bind { text in
            self.mainView.usernameTextField.text = text
        }
        viewModel.email.bind { text in
            self.mainView.emailTextField.text = text
        }
        viewModel.password.bind { text in
            self.mainView.passwordTextField.text = text
        }
        
        mainView.usernameTextField.addTarget(self, action: #selector(usernameTextFieldDidChange(_:)), for: .editingChanged)
        mainView.emailTextField.addTarget(self, action: #selector(emailTextFieldDidChange(_:)), for: .editingChanged)
        mainView.passwordTextField.addTarget(self, action: #selector(passwordTextFieldDidChange(_:)), for: .editingChanged)
        mainView.okButton.addTarget(self, action: #selector(okButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func usernameTextFieldDidChange(_ textfield: UITextField) {
        viewModel.username.value = textfield.text ?? ""
    }
    
    @objc func emailTextFieldDidChange(_ textfield: UITextField) {
        viewModel.email.value = textfield.text ?? ""
    }
    
    @objc func passwordTextFieldDidChange(_ textfield: UITextField) {
        viewModel.password.value = textfield.text ?? ""
    }
    
    @objc func okButtonClicked() {
        viewModel.postUserRegister {
            DispatchQueue.main.async {
                
                
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: BoardViewController())
                windowScene.windows.first?.makeKeyAndVisible()
            }
        }
    }
    
    func errorAlert(viewController: UIViewController) {
        
        let alert = UIAlertController(title: "이미 존재하는 아이디이거나 이메일입니다.", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
        
    }
}
