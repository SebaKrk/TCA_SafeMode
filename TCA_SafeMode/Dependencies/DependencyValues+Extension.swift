//
//  DependencyValues+Extension.swift
//  TCA_SafeMode
//
//  Created by Sebastian Ściuba on 20/12/2023.
//

import ComposableArchitecture
import Foundation

extension DependencyValues {
    var safeModeService: SafeModeService {
        get { self[SafeModeService.self] }
        set { self[SafeModeService.self] = newValue }
    }
}
