//
//  SafeModeService+DependencyKey.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 20/12/2023.
//

import ComposableArchitecture
import Foundation

extension SafeModeService: DependencyKey {
    
    private static var safeModeService = DefaultSafeModeService()
    
    static var liveValue: SafeModeService {
        
        Self(
            sendDiagnosticData: safeModeService.sendDiagnosticData,
            removeAllDataFromUserDefaults: safeModeService.removeAllDataFromDocuments,
            clearUserDefaultsExceptLoggedIn: safeModeService.clearUserDefaultsExceptLoggedIn,
            removeAllDataFromKeyChain: safeModeService.removeAllDataFromKeyChain,
            removeDataFromKeychainWithoutTheGenericPassword: safeModeService.removeDataFromKeychainWithoutTheGenericPassword,
            deleteItems: safeModeService.deleteItems(withClassType:),
            removeAllDataFromDocuments: safeModeService.removeAllDataFromDocuments
        )
    }
    
}
