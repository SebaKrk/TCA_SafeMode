//
//  SafeModeService.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 20/12/2023.
//

import Foundation

struct SafeModeService {
    
    ///
    var sendDiagnosticData: () -> Void

    ///
    var removeAllDataFromUserDefaults: () -> Void
    
    ///
    var clearUserDefaultsExceptLoggedIn: () -> Void
    
    ///
    var removeAllDataFromKeyChain: () -> Void
    
    ///
    var removeDataFromKeychainWithoutTheGenericPassword: () -> Void
    
    /// withClassType kSecClassType
    var deleteItems: (_ withClassType: CFString) -> OSStatus
    
    ///
    var removeAllDataFromDocuments: () -> Void
    
}

