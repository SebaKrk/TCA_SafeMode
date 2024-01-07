//
//  SafeModeFeature+DiagnosticAlertReducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 07/01/2024.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    var diagnosticAlertReducer: Reduce<FeatureState, FeatureAction> {
        Reduce { state, action in
            switch action {
            case .diagnosticAlert(.presented(.done)):
                print("done")
                state.diagnosticAlert = AlertState(
                    title: TextState("Wysyłanie danych przebiegło poprawnie"),
                    dismissButton: .cancel(TextState("OK"))
                )
                
                return .none
                
            case .diagnosticAlert(.presented(.failed)):
                print("failed")
                state.diagnosticAlert =  AlertState(
                    title: TextState("Dane nie zostały wysłane"),
                    buttons: [
                        .destructive(TextState("Ponów"), action: .send(.retry)),
                        .cancel(TextState("Anuluj"))
                    ]
                )
                return .none
                
            case .diagnosticAlert(.presented(.retry)):
                print("retry")
                
                state.isDiagnosticDataSending = true
                if state.isDiagnosticDataSending {
                    return .run { send in
                        try await Task.sleep(for: .seconds(5))
                        await send(.executeSendDiagnosticData)
                    }
                }
                
                return .none
                
            case .diagnosticAlert(.dismiss):
                state.diagnosticAlert = nil
                return .none
                
            default:
                return .none
            }
        }
    }
    
}
