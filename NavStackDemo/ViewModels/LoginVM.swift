//
//  LoginVM.swift
//  NavStackDemo
//
//  Created by Fahreddin Hepdonduran on 10.10.2023.
//

import Foundation

final class LoginVM: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var secondName: String = ""
    
    @Published var route: User? = nil
    
    func setRoute(_ isActive: Bool) {
        route = isActive ? getUserModel() : nil
    }
    
    private func getUserModel() -> User {
        return .init(firsName: firstName, lastName: secondName)
    }
    
}
