//
//  DeleteDataFeature+Reducer.swift
//  TCA_SafeMode
//
//  Created by Sebastian Sciuba on 11/12/2023.
//

import ComposableArchitecture
import Foundation

extension DeleteDataFeature: Reducer {
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .userTappedDeleteDataButton:
                
                return .none
            }
        }
    }
}
