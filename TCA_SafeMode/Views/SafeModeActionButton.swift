//
//  SafeModeActionButton.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import SwiftUI

struct SafeModeActionButton: View {
    
    // MARK: - Properties
    
    private let image: String
    private let title: String
    private let footerText: String?
    private let color: Color
    private var isLoading: Bool?
    
    let action: () -> Void
    
    // MARK: - Lifecycle
    
    init(image: String,
         title: String,
         footerText: String? = nil,
         color: Color,
         isLoading: Bool = false,
         action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.footerText = footerText
        self.color = color
        self.isLoading = isLoading
        self.action = action
    }
    
    // MARK: - View
    
    var body: some View {
        VStack(spacing: 10){
            Button(action: action) {
                HStack {
                    Image(systemName: image)
                    Text(title)
                    Spacer()
                    if isLoading == true {
                        ProgressView()
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .foregroundColor(color)
                .contentShape(Rectangle())
            }
            if let footer = footerText {
                Text(footer)
                    .font(.system(size: 14))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
            }
        }
    }
    
}
