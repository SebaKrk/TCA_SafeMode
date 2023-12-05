//
//  SafeModelTitleView.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import SwiftUI

struct SafeModelTitleView: View {
    
    var compactLogoWidth: CGFloat = 150
    var compactLogoHeight: CGFloat = 36

    var regularLogoWidth: CGFloat = 225
    var regularLogoHeight: CGFloat = 54
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var deviceLogoWidth: CGFloat { horizontalSizeClass == .compact ? compactLogoWidth : regularLogoWidth }
    var deviceLogoHeight: CGFloat { horizontalSizeClass == .compact ? compactLogoHeight : regularLogoHeight }

    var body: some View {
        VStack {
            Image("FarmaPromLogoWithText")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: deviceLogoWidth, height: deviceLogoHeight)
            
            Text("Tryb awaryjny")
                .font(.title.bold())
                .accessibilityAddTraits(.isHeader)
        }
    }
    
}
