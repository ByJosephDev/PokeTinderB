//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by MAC32 on 10/06/22.
//

import Foundation
import FirebaseAuth

class LauchViewModel : ObservableObject {
    
    let appState: AppState = AppState.shared
    
    init () {
        
        appState.currentScreen = Auth.auth().currentUser != nil ? .main : .signIn
        
    }
    
    
}
