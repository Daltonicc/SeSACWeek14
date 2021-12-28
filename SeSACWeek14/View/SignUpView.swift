//
//  SignUpView.swift
//  SeSACWeek14
//
//  Created by 박근보 on 2021/12/27.
//

import Foundation
import SnapKit
import UIKit

class SignUpView: UIView, ViewRepresentable {
    
    let usernameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "아이디를 입력하세요"
        textfield.backgroundColor = .white
        return textfield
    }()
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "이메일을 입력하세요"
        textfield.backgroundColor = .white
        return textfield
    }()
    let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "비밀번호를 입력하세요"
        textfield.backgroundColor = .white
        return textfield
    }()
    let okButton: UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .orange
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
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(okButton)
    }
    
    func setUpConstraints() {
        
        usernameTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
        okButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.height.equalTo(50)
        }
    }
}
