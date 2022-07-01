//
//  AuthViewModel.swift
//  iOSAppTemplate
//
//  Created by Joseph Puma on 19/06/2022.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @StateObject var appState: AppState = .shared
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResponse, error in
            
            if error != nil {
                self.showError = true
                self.errorMessage = error!.localizedDescription
                return
            }
        
            self.appState.currentScreen = .main
            
        }
    }
    
    func register(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResponse, error in
            
            if error != nil {
                self.showError = true
                self.errorMessage = error!.localizedDescription
                return
            }
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = name
            changeRequest?.commitChanges()
            self.appState.currentScreen = .main
            
        }
    }
}
