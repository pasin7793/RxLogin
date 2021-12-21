//
//  LoginViewModel.swift
//  RxLogin
//
//  Created by 임준화 on 2021/12/21.
//

import RxSwift
import RxRelay
import UIKit

class LoginViewModel{
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool>{
        return Observable.combineLatest(emailObserver,passwordObserver)
            .map{email, password in
                print("Email: \(email), Password: \(password)")
                return !email.isEmpty && email.contains("@") && email.contains(".") && password.count > 0
            }
    }
}
