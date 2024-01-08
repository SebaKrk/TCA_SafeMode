//
//  SafeModeFeature.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 05/12/2023.
//

import ComposableArchitecture
import Foundation

@Reducer
struct SafeModeFeature {
    
    // MARK: - Typealiases
    
    typealias FeatureState = SafeModeFeature.State
    typealias FeatureAction = SafeModeFeature.Action

    // MARK: - Dependencies
    
    @Dependency(\.safeModeService) var safeModeService
    
}
