//
//  SafeModeFeature+ExecuteReducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 07/01/2024.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    var executeReducer: Reduce<FeatureState, FeatureAction> {
        Reduce { state, action in
            switch action {
            case .executeSendDiagnosticData:
                print("send diagnostic data")
                state.isDiagnosticDataSending = false
                
                return .run { send in
                    if true {
                        await send(.diagnosticAlert(.presented(.done)))
                    } else {
                        await send(.diagnosticAlert(.presented(.failed)))
                    }
                }
                
            case .executeDeleteAndLogout:
                print("DeleteAndLogout")
                state.isDataRemoving = false
                executeDeleteAndLogout()
                return .none
                
            case .executeDeleteData:
                print("DeleteData")
                state.isDataRemoving = false
                //executeDeleteData()
                
                return .none
                
            default:
                return .none
            }
        }
    }
    
}
