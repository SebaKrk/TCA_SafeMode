//
//  SafeModeInformationPanel.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import SwiftUI

struct SafeModeInformationPanel: View {
    
    // MARK: - Properties
    
    private let image: String
    private let title: String
    private let information: String
    
    // MARK: - Lifecycle
    
    init(image: String, title: String, information: String) {
        self.image = image
        self.title = title
        self.information = information
    }
    
    // MARK: - View
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: image)
                Text(title)
            }
            .padding(.bottom, 5)
            Text(information)
                .font(.system(size: 14))
                .padding(.leading, 15)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.white)
        .cornerRadius(10)
        .foregroundColor(.black)
    }
    
}
