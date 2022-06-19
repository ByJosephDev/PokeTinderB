//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by MAC32 on 10/06/22.
//

import Foundation

class LauchViewModel : ObservableObject {
    
    let appState: AppState = AppState.shared
    
    init () {
        
        appState.currentScreen = .main
        
    }
    
    
}
