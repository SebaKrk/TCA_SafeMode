//
//  SafeModeServiceProtocol.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 20/12/2023.
//

import Foundation

protocol SafeModeProtocol {
    
    ///
    func sendDiagnosticData() -> Void
    
    ///
    func removeAllDataFromUserDefaults() -> Void
    
    ///
    func clearUserDefaultsExceptLoggedIn() -> Void
    
    ///
    func removeAllDataFromKeyChain() -> Void
    
    ///
    func removeDataFromKeychainWithoutTheGenericPassword() -> Void
    
    ///
    func  deleteItems(withClassType kSecClassType: CFString) -> OSStatus
    
    ///
    func removeAllDataFromDocuments() -> Void
    
}
