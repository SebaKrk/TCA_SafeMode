//
//  SafeModeFeature+Action.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import Foundation

extension SafeModeFeature {
    
    enum Action: Equatable {
        
        case userTappedDiagnosticDataButton
        
        case userTappedDeleteDataButton
        
        case userTappedDeleteAndLogoutButton
        
    }
}
