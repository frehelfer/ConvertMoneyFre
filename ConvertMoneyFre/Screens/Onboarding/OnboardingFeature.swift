//
//  OnboardingFeature.swift
//  ConvertMoneyFre
//
//  Created by Frédéric Helfer on 16/08/23.
//

import ComposableArchitecture
import Foundation

struct OnboardingFeature: Reducer {
    
    struct State: Equatable {
    }
    
    enum Action: Equatable {
        case onAppear
        case startButtonTapped
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                UserDefaults.standard.set(true, forKey: "first_viewer")
                return .none
                
            case .startButtonTapped:
                // show start
                return .none
            }
        }
    }
}
