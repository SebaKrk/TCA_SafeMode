//
//  SafeModeFeature.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

struct SafeModeFeature {

    // MARK: - Dependencies
    @Dependency(\.safeModeService) var safeModeService
    
}


