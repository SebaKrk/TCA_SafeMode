//
//  DefaultSafeModeService.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 20/12/2023.
//

import Foundation

class DefaultSafeModeService: SafeModeProtocol {
    
    
    /// DiagnosticData
    func sendDiagnosticData() -> Void {
        print("sendDiagnosticData")
    }
    
    /// Remove All Data
    func removeAllDataFromUserDefaults() -> Void {
      print("removeAllDataFromUserDefaults")
    }

    /// remove all data from UserDefaults except LoggedIn key
    func clearUserDefaultsExceptLoggedIn() -> Void {
        print("clearUserDefaultsExceptLoggedIn")
    }
    
    /// remove all data form KeyChain
    func removeAllDataFromKeyChain() -> Void {
        print("removeAllDataFromKeyChain")
    }
    
    /// remove all data form KeyChain except kSecClassGenericPassword
    func removeDataFromKeychainWithoutTheGenericPassword() -> Void {
        print("removeDataFromKeychainWithoutTheGenericPassword")
    }
    
    func deleteItems(withClassType kSecClassType: CFString) -> OSStatus {
        print("deleteItems")
        return SecItemDelete([kSecClass as String: kSecClassType] as CFDictionary)
    }
    
    /// remove all data from  documents file
    func removeAllDataFromDocuments() -> Void {
        print("removeAllDataFromDocuments")
    }
    
}


