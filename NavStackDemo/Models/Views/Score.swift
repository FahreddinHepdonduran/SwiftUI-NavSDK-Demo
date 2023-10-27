//
//  View2.swift
//  NavStackDemo
//
//  Created by Fahreddin Hepdonduran on 4.10.2023.
//

import SwiftUI

struct ScoreView: View {
    
    @EnvironmentObject private var loginVM: LoginVM
    
    private var dismissClosure: (() -> Void)?
    private var home: Home
    
    init(home: Home, dismissClosure: (() -> Void)? = nil) {
        self.home = home
        self.dismissClosure = dismissClosure
        print("View 2 init")
    }
    
    var body: some View {
        VStack(spacing: 20.0) {
            VStack {
                Text(home.user.firsName + " " + home.user.lastName)
                Text("Score: \(home.count)")
            }
            
            Button("Dismiss", action: dismissSelf)
            Button("Pop To Root", action: popToRoot)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func dismissSelf() {
        dismissClosure?()
    }
    
    func popToRoot() {
        loginVM.setRoute(false)
    }
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(home: .init(count: 10, user: .init(firsName: "Ali", lastName: "Veli")))
    }
}
