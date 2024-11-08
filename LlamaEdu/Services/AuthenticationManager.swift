//
//  AuthenticationManager.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 07/11/24.
//

import SwiftUI

class AuthenticationManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var user: User?
    
    init() {
        signIn()
    }
    
    func signIn() {
        self.user = User(firstName: "Giovanna", lastName: "Moeller", email: "giovannamoeller18@gmail.com")
        self.isAuthenticated = true
    }
    
    func signOut() {
        self.user = nil
        self.isAuthenticated = false
    }
    
}
