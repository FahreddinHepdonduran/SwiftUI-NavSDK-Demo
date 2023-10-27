//
//  View1.swift
//  NavStackDemo
//
//  Created by Fahreddin Hepdonduran on 4.10.2023.
//

import SwiftUI
import SwiftUINavigation

struct HomeView: View {

    @ObservedObject private var homeVM: HomeVM
    
    private var dismissClosure: (() -> Void)?
    
    init(homeVM: HomeVM, dismissClosure: (() -> Void)? = nil) {
        self.homeVM = homeVM
        self.dismissClosure = dismissClosure
        print("View 1 init")
    }
    
    var body: some View {
        VStack(spacing: 20.0) {
            VStack {
                Text("Welcome")
                Text(homeVM.fullName)
            }
            
            VStack {
                Text("Count: \(homeVM.count)")
                Button("Update Count") {
                    homeVM.updateCount()
                }
            }
            
            Button("Dismiss", action: dismissSelf)
            Button("Score", action: scoreAction)
        }
        .navigationDestination(unwrapping: $homeVM.route) { $home in
            ScoreView(home: $home.wrappedValue, dismissClosure: dismissScore)
        }
    }
    
    private func dismissSelf() {
        dismissClosure?()
    }
    
    private func dismissScore() {
        homeVM.setRoute(false)
    }
    
    private func scoreAction() {
        homeVM.setRoute(true)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(homeVM: HomeVM(user: .init(firsName: "Ali", lastName: "Veli")))
    }
}
