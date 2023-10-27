//
//  ContentView.swift
//  NavStackDemo
//
//  Created by Fahreddin Hepdonduran on 13.09.2023.
//

import SwiftUI
import SwiftUINavigation

struct LoginView: View {
    
    @StateObject private var loginVM: LoginVM = .init()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40.0) {
                VStack(spacing: 20.0) {
                    TextField("firstname", text: $loginVM.firstName)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color.black, lineWidth: 1.0)
                                .frame(height: 40.0)
                                .padding()
                        }
                    
                    TextField("secondname", text: $loginVM.secondName)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(Color.black, lineWidth: 1.0)
                                .frame(height: 40.0)
                                .padding()
                        }
                }
                
                Button("Home", action: homeAction)
            }
            .padding()
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(unwrapping: $loginVM.route) { $user in
                HomeView(homeVM: .init(user: $user.wrappedValue), dismissClosure: dismissHome)
            }
        }
        .environmentObject(loginVM)
    }
    
    private func dismissHome() {
        loginVM.setRoute(false)
    }
    
    private func homeAction() {
        loginVM.setRoute(true)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
