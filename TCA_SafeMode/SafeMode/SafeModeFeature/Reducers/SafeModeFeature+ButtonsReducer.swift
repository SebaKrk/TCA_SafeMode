//
//  SafeModeFeature+ButtonsReducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 07/01/2024.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    var buttonsReducer: Reduce<FeatureState, FeatureAction> {
        Reduce { state, action in
            switch action {
            case .userTappedDiagnosticDataButton:
                print("userTappedDiagnosticDataButton")
                state.alert = AlertState(
                    title:  TextState("Wyślij dane"),
                    message: TextState("Czy na pewno chcesz wysłać dane diagnostyczne?"),
                    buttons: [
                        .destructive(TextState("Wyślij"), action: .send(.sendDiagnosticData)),
                        .cancel(TextState("Anuluj"))
                    ])
                return .none
                
            case .userTappedDeleteDataButton:
                print("userTappedDeleteDataButton")
                
                state.alert = AlertState(
                    title:  TextState("Usuń dane"),
                    message: TextState("Czy na pewno chcesz usunąć dane? (tej operacji nie można cofnąć)."),
                    buttons: [
                        .destructive(TextState("Usuń"),
                                     action: .send(.deleteData)),
                        .cancel(TextState("Anuluj"))
                    ])
                return .none
                
            case .userTappedDeleteAndLogoutButton:
                print("userTappedDeleteAndLogoutButton")
                
                state.alert = AlertState(
                    title:  TextState("Usuń dane i wyloguj"),
                    message: TextState("Czy na pewno chcesz usunąć dane? (tej operacji nie można cofnąć)."),
                    buttons: [
                        .destructive(TextState("Usuń"),
                                     action: .send(.deleteAndLogout)),
                        .cancel(TextState("Anuluj"))
                    ])
                return .none
                
            default:
                return .none
            }
        }
    }
    
}
