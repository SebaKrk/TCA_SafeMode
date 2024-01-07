//
//  SafeModeFeature+Reducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 07/01/2024.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature {
    
    var body: some Reducer<State, Action> {
        CombineReducers {
            
            ///
            buttonsReducer
            
            ///
            executeReducer
            
            ///
            alertReducer
            
            ///
            diagnosticAlertReducer
        }
    }
    
}

extension SafeModeFeature {

    func executeSendDiagnosticData() {
        safeModeService.sendDiagnosticData()
    }

    func executeDeleteAndLogout() {
        safeModeService.removeAllDataFromUserDefaults()
        safeModeService.removeAllDataFromKeyChain()
        safeModeService.removeAllDataFromDocuments()
    }

    func executeDeleteData() {
        safeModeService.clearUserDefaultsExceptLoggedIn()
        safeModeService.removeDataFromKeychainWithoutTheGenericPassword()
        safeModeService.removeAllDataFromDocuments()
    }
}








