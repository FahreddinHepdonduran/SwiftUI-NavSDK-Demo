//
//  HomeVM.swift
//  NavStackDemo
//
//  Created by Fahreddin Hepdonduran on 10.10.2023.
//

import Foundation

final class HomeVM: ObservableObject {
    
    @Published var count: Int = 0
    @Published var route: Home? = nil
    
    private let user: User
    
    var fullName: String {
        return user.firsName + " " + user.lastName
    }
    
    init(user: User) {
        self.user = user
    }
    
    func setRoute(_ isActive: Bool) {
        route = isActive ? getHomeModel() : nil
    }
    
    func updateCount() {
        count += 1
    }
    
    private func getHomeModel() -> Home {
        .init(count: count, user: user)
    }
    
}
