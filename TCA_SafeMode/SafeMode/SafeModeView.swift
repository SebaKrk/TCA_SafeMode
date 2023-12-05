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
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                titleView
                //safeMode
                VStack(spacing: 15) {
                    Group {
                        Button {
                            viewStore.send(.userTappedDiagnosticDataButton)
                        } label: {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Wysyłam dane diagnostyczne")
                                Spacer()
                            }
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundColor(.blue)
                            .contentShape(Rectangle())
                        }
                        
                        deleteDataButton
                        deleteAndLogoutButton
                    }
                    safeModeInformationPanel
                }
                Spacer()
            }
            .padding()
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    
    var titleView: some View {
        SafeModelTitleView()
    }
    
    var safeMode: some View {
        ScrollView {
            if horizontalSizeClass == .compact {
                VStack(spacing: 15) {
                    Group {
                        diagnosticDataButton
                        deleteDataButton
                        deleteAndLogoutButton
                    }
                    //.disabled(viewModel.isDiagnosticDataSending)
                    safeModeInformationPanel
                }
            } else {
                VStack(spacing: 15) {
                    Group {
                        diagnosticDataButton
                        HStack() {
                            deleteDataButton
                            deleteAndLogoutButton
                        }
                    }
                    //.disabled(viewModel.isDiagnosticDataSending)
                    safeModeInformationPanel
                }
            }
        }
    }
    
    private var diagnosticDataButton: some View {
        SafeModeActionButton(image: "square.and.arrow.up",
                             title: "Wysyłam dane diagnostyczne",
                             color: .blue) {
            // action
        }
    }
    
    private var deleteDataButton: some View {
        SafeModeActionButton(image: "trash",
                             title: "Usuń dane",
                             footerText: "Wszystkie dane zgromadzone w aplikacji zostaną usunięte. Po ponownym uruchomieniu konieczna będzie pełna synchronizacja.",
                             color: .red) {
            // action
        }
    }
    
    private var deleteAndLogoutButton: some View {
        SafeModeActionButton(image: "rectangle.portrait.and.arrow.right",
                             title: "Usuń dane i wyloguj",
                             footerText: "Wszystkie dane zgromadzone w aplikacji zostaną usunięte i zostaniesz wylogowany z konta. Po ponownym uruchomieniu, zaloguj się.",
                             color: .red) {
            // action
        }
    }
    
    private var safeModeInformationPanel: some View {
        SafeModeInformationPanel(image: "info.circle",
                                 title: "Następne uruchomienie aplikacji odbędzie się w normalnym trybie",
                                 information: "Aby po raz kolejny uruchomić aplikację w trybie awaryjnym / diagnostycznym, przejdź do Ustawień, wybierz pozycję \"FarmaProm\", przejdź do sekcji \"Rozwiązywanie problemów\", a następnie aktywuj \"Tryb awaryjny po następnym uruchomieniu\".")
    }
}
