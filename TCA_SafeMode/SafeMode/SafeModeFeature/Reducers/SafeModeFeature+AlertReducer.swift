//
//  SafeModeFeature+AlertReducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 07/01/2024.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    var alertReducer: Reduce<FeatureState, FeatureAction> {
        Reduce { state, action in
            
            switch action {
            case .alert(.presented(.sendDiagnosticData)):
                print("executeDiagnosticDataAlertButton")
                state.alert = nil
                state.isDiagnosticDataSending = true
                if state.isDiagnosticDataSending {
                    return .run { send in
                        //executeSendDiagnosticData()
                        try await Task.sleep(for: .seconds(5))
                        await send(.executeSendDiagnosticData)
                    }
                }
                return .none
                
            case .alert(.presented(.deleteData)):
                print("executeDeleteDataAlertButton")
                state.isDataRemoving = true
                state.alert = nil
                return .run { send in
                    await send(.executeDeleteData)
                }
                
            case .alert(.presented(.deleteAndLogout)):
                print("executeDeleteAndLogoutAlertButton")
                state.isDataRemoving = true
                state.alert = nil
                return .run { send in
                    await send(.executeDeleteAndLogout)
                }
                
            case .alert(.dismiss):
                print("dismissButton")
                state.alert = nil
                return .none
                
            default:
                return .none
            }
        }
    }
    
}
