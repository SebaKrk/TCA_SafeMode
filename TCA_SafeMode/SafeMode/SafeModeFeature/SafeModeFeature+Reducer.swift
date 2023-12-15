//
//  SafeModeFeature+Reducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature: Reducer {
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .userTappedDiagnosticDataButton:
                print("userTappedDiagnosticDataButton")
        
                state.alert = AlertState(title: {
                    TextState("Wyślij dane")
                }, actions: {
                    ButtonState(role: .destructive,
                                action: .sendDiagnosticData) { TextState("Wyślij") }
                    ButtonState(role: .cancel) { TextState("Anuluj") }
                }, message: { TextState("Czy na pewno chcesz wysłać dane diagnostyczne?")
                })
                
                return .none
                
            case .userTappedDeleteDataButton:
                print("userTappedDeleteDataButton")
                
                state.alert = AlertState(title: {
                    TextState("Usuń dane")
                }, actions: {
                    ButtonState(role: .destructive,
                                action: .deleteData) { TextState("Usuń") }
                    ButtonState(role: .cancel) { TextState("Anuluj") }
                }, message: { TextState("Czy na pewno chcesz usunąć dane? (tej operacji nie można cofnąć).")
                })
                
                
                return .none
                
            case .userTappedDeleteAndLogoutButton:
                print("userTappedDeleteAndLogoutButton")
                
                
                state.alert = AlertState(title: {
                    TextState("Usuń dane i wyloguj")
                }, actions: {
                    ButtonState(role: .destructive,
                                action: .deleteAndLogout) { TextState("Usuń") }
                    ButtonState(role: .cancel) { TextState("Anuluj") }
                }, message: {
                    TextState("Czy na pewno chcesz usunąć dane? (tej operacji nie można cofnąć)")
                })
                
                return .none
                
            case .alert:
                return .none
            }
        }
    }
}
