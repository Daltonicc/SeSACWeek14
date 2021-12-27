//
//  SignInView.swift
//  SeSACWeek14
//
//  Created by 박근보 on 2021/12/27.
//

import Foundation
import UIKit
import SnapKit

protocol ViewRepresentable {
    func setUpView()
    func setUpConstraints()
}

class SignInView: UIView, ViewRepresentable {
 
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.tintColor = .white
        return button
    }()
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입하기", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUpView() {
        
        addSubview(usernameTextField)
        usernameTextField.backgroundColor = .white
        addSubview(passwordTextField)
        passwordTextField.backgroundColor = .white
        addSubview(signInButton)
        signInButton.backgroundColor = .orange
        addSubview(signUpButton)
        signUpButton.backgroundColor = .orange
        
    }
    
    func setUpConstraints() {
        
        usernameTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        
    }
}
