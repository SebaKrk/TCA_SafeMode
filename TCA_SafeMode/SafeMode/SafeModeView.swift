//
//  SafeModeView.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import SwiftUI

struct SafeModeView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var store: StoreOf<SafeModeFeature>
    
    var body: some View {
        VStack {
            titleView
            safeMode
            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
    }
    
    var titleView: some View {
        SafeModelTitleView()
    }
    
    var safeMode: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ScrollView {
                if horizontalSizeClass == .compact {
                    VStack(spacing: 15) {
                        Group {
                            createDiagnosticDataButton(with: viewStore)
                            createDeleteDataButton(with: viewStore)
                            createDeleteAndLogoutButton(with: viewStore)
                        }
                        //.disabled(viewModel.isDiagnosticDataSending)
                        safeModeInformationPanel
                    }
                } else {
                    VStack(spacing: 15) {
                        Group {
                            createDiagnosticDataButton(with: viewStore)
                            HStack() {
                                createDeleteDataButton(with: viewStore)
                                createDeleteAndLogoutButton(with: viewStore)
                            }
                        }
                        //.disabled(viewModel.isDiagnosticDataSending)
                        safeModeInformationPanel
                    }
                }
            }
        }
        .alert(
            store: self.store.scope(
                state: \.$alert,
                action: {.alert($0)})
        )
    }
    
    @ViewBuilder
    private func createDiagnosticDataButton(with viewStore:
                                            ViewStore<SafeModeFeature.State,
                                            SafeModeFeature.Action>) -> some View {
    
        SafeModeActionButton(image: "square.and.arrow.up",
                             title: "Wysyłam dane diagnostyczne",
                             color: .blue,
                             isLoading: viewStore.isLoading) {
            viewStore.send(.userTappedDiagnosticDataButton)
        }
                             .disabled(viewStore.isDiagnosticDataSending)
    }
    
    
    @ViewBuilder 
    private func createDeleteDataButton(with viewStore:
                                            ViewStore<SafeModeFeature.State,
                                        SafeModeFeature.Action>) -> some View {
        SafeModeActionButton(image: "trash",
                             title: "Usuń dane",
                             footerText: "Wszystkie dane zgromadzone w aplikacji zostaną usunięte. Po ponownym uruchomieniu konieczna będzie pełna synchronizacja.",
                             color: .red) {
            viewStore.send(.userTappedDeleteDataButton)
        }
    }

    @ViewBuilder
    private func createDeleteAndLogoutButton(with viewStore:
                                             ViewStore<SafeModeFeature.State,
                                         SafeModeFeature.Action>) -> some View {
        SafeModeActionButton(image: "rectangle.portrait.and.arrow.right",
                             title: "Usuń dane i wyloguj",
                             footerText: "Wszystkie dane zgromadzone w aplikacji zostaną usunięte i zostaniesz wylogowany z konta. Po ponownym uruchomieniu, zaloguj się.",
                             color: .red) {
            viewStore.send(.userTappedDeleteAndLogoutButton)
        }
    }
    
    private var safeModeInformationPanel: some View {
        SafeModeInformationPanel(image: "info.circle",
                                 title: "Następne uruchomienie aplikacji odbędzie się w normalnym trybie",
                                 information: "Aby po raz kolejny uruchomić aplikację w trybie awaryjnym / diagnostycznym, przejdź do Ustawień, wybierz pozycję \"FarmaProm\", przejdź do sekcji \"Rozwiązywanie problemów\", a następnie aktywuj \"Tryb awaryjny po następnym uruchomieniu\".")
    }
}

