//
//  SafeModeFeature+State.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    struct State: Equatable {
        
        @PresentationState var alert: AlertState<SafeModeFeature.Action.SafeModeAlert>?
        
        var isLoading: Bool = false
        var isDiagnosticDataSending: Bool = false
        var dataAreRemoving: Bool = false
    }
    
}
