//
//  SafeModeFeature+Action.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    enum Action: Equatable {
        
        case userTappedDiagnosticDataButton
        
        case userTappedDeleteDataButton
        
        case userTappedDeleteAndLogoutButton
        
        case executeSendDiagnosticData
        
        case executeDeleteData
        
        case executeDeleteAndLogout
        
        case alert(PresentationAction<SafeModeAlert>)
    
        enum SafeModeAlert:Equatable {
            case sendDiagnosticData
            case deleteData
            case deleteAndLogout
        }
        
        case diagnosticAlert(PresentationAction<DiagnosticAlertState>)
        
        enum DiagnosticAlertState {
            case done
            case retry
            case failed
        }
    }
}
