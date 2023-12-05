//
//  TCA_SafeModeApp.swift
//  TCA_SafeMode
//
//  Created by Sebastian Sciuba on 05/12/2023.
//
import ComposableArchitecture
import SwiftUI

@main
struct TCA_SafeModeApp: App {
    
    var body: some Scene {
        WindowGroup {
            SafeModeView(store: Store(
                initialState: SafeModeFeature.State(),
                reducer: { SafeModeFeature() })
            )
        }
    }
    
}
