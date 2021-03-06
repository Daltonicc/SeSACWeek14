//
//  SignUpViewModel.swift
//  SeSACWeek14
//
//  Created by 박근보 on 2021/12/28.
//

import Foundation
import UIKit

class SignUpViewModel {
    
    var username: Observable<String> = Observable("")
    var email: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    func postUserRegister(completion: @escaping () -> Void) {
        
        APIService.signUp(username: username.value, email: email.value, password: password.value) { userData, error in
            
            guard let userData = userData else {

                return
            }
            
            completion()
        }
        
    }
    
    
}
