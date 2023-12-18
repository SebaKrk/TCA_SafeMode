//
//  File.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 18/12/2023.
//

import Foundation
import SwiftUI
//import FPLog

/// Diagnostic alert message state
enum DiagnosticAlertState {
    
    /// Show message to confirm sending diagnostic data
    case confirmation
    
    /// Result message that shows if data were sent successfully
    case result
    
}

/// SafeMode view model
@MainActor
final class SafeModeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var showDiagnosticAlert = false
    @Published var diagnosticDataAlertMessage: String = ""
    @Published var isDiagnosticDataSending = false
    @Published var diagnosticAlertState: DiagnosticAlertState = .confirmation
    @Published var deleteDataAction = false
    @Published var deleteAndLogoutAction = false
    
    //  MARK: - API
    
    /// change DiagnosticAlertState and toggle showDiagnosticAlert
    func showAndSendDiagnosticAlert() {
        diagnosticAlertState = .confirmation
        showDiagnosticAlert.toggle()
    }
    
    /// toggle diagnostic button and send diagnostic data
    func toggleDiagnosticButtonAndSendData() {
        self.isDiagnosticDataSending.toggle()
        self.sendDiagnosticData()
    }
    
    /// send diagnostics data
    func sendDiagnosticData() {
//        guard !FPLog.isDiagnosticZipSending() else { return }
//        
//        let completion: FPLog.FPLogCompletionAction = { [weak self] error in
//            Task { @MainActor in
//                guard let self else { return }
//                if let error = error as NSError? {
//                    print("Error: \(error.description)")
//                    self.diagnosticDataAlertMessage = "Dane nie zostały wysłane".localized
//                } else {
//                    self.diagnosticDataAlertMessage = "Wysyłanie danych przebiegło poprawnie".localized
//                }
//            }
//        }
//        
//        let progressAction: FPLog.FPLogProgressAction = { [weak self] (progress) in
//            Task { @MainActor in
//                guard let self else { return }
//                if progress >= 1.0 {
//                    self.isDiagnosticDataSending.toggle()
//                    self.diagnosticAlertState = .result
//                    self.showDiagnosticAlert = true
//                }
//            }
//        }
//        
//        if !FPLog.isDiagnosticZipExisted() {
//            FPLog.archiveDignosticFilesAndSend(completion, progressAction: progressAction)
//        } else {
//            FPLog.sendExistedDiagnosticFiles(completion, progressAction: progressAction)
//        }
        
    }
    
    /// remove all data from UserDefaults
    func removeAllDataFromUserDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
            UserDefaults.standard.synchronize()
        }
    }
    
    /// remove all data from UserDefaults except LoggedIn key
    func clearUserDefaultsExceptLoggedIn() {
        let keysToKeep = ["isLoggedIn"]
        
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            if !keysToKeep.contains(key) {
                UserDefaults.standard.removeObject(forKey: key)
            }
        }
        
        UserDefaults.standard.synchronize()
    }
    
    /// remove all data form KeyChain
    func removeAllDataFromKeyChain() {
        let keychainClasses = [kSecClassGenericPassword, kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for kSecClassType in keychainClasses {
            let status = deleteItems(withClassType: kSecClassType)
            if status == errSecSuccess {
                print("Successfully deleted items for class \(kSecClassType)")
            } else {
                print("Failed to delete items for class \(kSecClassType)")
            }
        }
    }
    
    /// remove all data form KeyChain except kSecClassGenericPassword
    func removeDataFromKeychainWithoutTheGenericPassword() {
        let keychainClasses = [kSecClassInternetPassword, kSecClassCertificate, kSecClassKey, kSecClassIdentity]
        for kSecClassType in keychainClasses {
            let status = deleteItems(withClassType: kSecClassType)
            if status == errSecSuccess {
                print("Successfully deleted items for class \(kSecClassType)")
            } else {
                print("Failed to delete items for class \(kSecClassType)")
            }
        }
    }
    
    func deleteItems(withClassType kSecClassType: CFString) -> OSStatus {
        SecItemDelete([kSecClass as String: kSecClassType] as CFDictionary)
    }
    
    /// remove all data from  documents file
    func removeAllDataFromDocuments() {
        do {
            if let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let filesInDocuments = try FileManager.default.contentsOfDirectory(atPath: documentsURL.path)
                for file in filesInDocuments {
                    let filePath = documentsURL.appendingPathComponent(file).path
                    try FileManager.default.removeItem(atPath: filePath)
                    print("Deleted file: \(file)")
                }
            }
        } catch {
            print("An error occurred while removing files: \(error.localizedDescription)")
        }
    }
    
}
