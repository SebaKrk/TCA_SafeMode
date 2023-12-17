//
//  SafeModeFeature+Reducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

extension SafeModeFeature: Reducer {
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .userTappedDiagnosticDataButton:
                print("userTappedDiagnosticDataButton")
                
                state.alert = AlertState(
                    title:  TextState("Wyślij dane"),
                    message: TextState("Czy na pewno chcesz wysłać dane diagnostyczne?"),
                    buttons: [
                        .destructive(TextState("Wyślij"), action: .send(.sendDiagnosticData)),
                        .cancel(TextState("Anuluj"))
                    ])
                return .none

            case .executeSendDiagnosticData:
                print("send diagnostic data")
                state.isDiagnosticDataSending = false
                return .none
                
            case .userTappedDeleteDataButton:
                print("userTappedDeleteDataButton")
                
                state.alert = AlertState(
                    title:  TextState("Usuń dane"),
                    message: TextState("Czy na pewno chcesz usunąć dane? (tej operacji nie można cofnąć)."),
                    buttons: [
                        .destructive(TextState("Usuń"),
                                     action: .send(.deleteData)),
                        .cancel(TextState("Anuluj"))
                    ])
                return .none
                
            case .executeDeleteData:
                print("DeleteData")
                state.isDataRemoving = false
                
                return .none
                
            case .userTappedDeleteAndLogoutButton:
                print("userTappedDeleteAndLogoutButton")
                
                state.alert = AlertState(
                    title:  TextState("Usuń dane i wyloguj"),
                    message: TextState("Czy na pewno chcesz usunąć dane? (tej operacji nie można cofnąć)."),
                    buttons: [
                        .destructive(TextState("Usuń"),
                                     action: .send(.deleteAndLogout)),
                        .cancel(TextState("Anuluj"))
                    ])
                return .none
                
            case .executeDeleteAndLogout:
                print("DeleteAndLogout")
                state.isDataRemoving = false
                return .none
            
            case .alert(.presented(.sendDiagnosticData)):
                print("executeDiagnosticDataAlertButton")
                state.alert = nil
                state.isDiagnosticDataSending = true
                if state.isDiagnosticDataSending {
                    return .run { send in
                        try await Task.sleep(for: .seconds(5))
                        await send(.executeSendDiagnosticData)
                    }
                }
                return .none
                //return .run { send in
                //    await send(.executeSendDiagnosticData)
                //}
                
            case .alert(.presented(.deleteData)):
                print("executeDeleteDataAlertButton")
                state.isDataRemoving = true
                state.alert = nil
                return .run { send in
                    await send(.executeDeleteData)
                }
                
            case .alert(.presented(.deleteAndLogout)):
                print("executeDeleteAndLogoutAlertButton")
                state.isDataRemoving = true
                state.alert = nil
                return .run { send in
                    await send(.executeDeleteAndLogout)
                }
                
            case .alert(.dismiss):
                print("dismissButton")
                state.alert = nil
                return .none
            }
        }
    }
}
