//
//  SafeModeFeature+Reducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature: Reducer {


    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .userTappedDiagnosticDataButton:
            print("userTappedDiagnosticDataButton")
            return .none
            
        case .userTappedDeleteDataButton:
            print("userTappedDeleteDataButton")
            return .none
            
        case .userTappedDeleteAndLogoutButton:
            print("userTappedDeleteAndLogoutButton")
            return .none
        }
    }

}
