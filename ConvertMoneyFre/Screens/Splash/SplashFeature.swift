//
//  SplashFeature.swift
//  ConvertMoneyFre
//
//  Created by Frédéric Helfer on 16/08/23.
//

import ComposableArchitecture
import Foundation

struct SplashFeature: Reducer {
    
    struct State: Equatable {
        var onboarding: Bool = true
        @PresentationState var showOnboarding: OnboardingFeature.State?
        
        var onboardingFlowFlag: Bool {
            return (ProcessInfo().environment["ONBOARDING_FLOW"] as? NSString)?.boolValue ?? false
        }
    }
    
    enum Action: Equatable {
        case onAppear
        case validData
        
        case showOnboarding(PresentationAction<OnboardingFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                return .run { send in
                    try await Task.sleep(for: .seconds(1))
                    await send(.validData)
                }
                
            case .validData:
                
//                if !state.onboardingFlowFlag && UserDefaults.standard.bool(forKey: "first_viewer") {
                
                if state.onboarding {
                    state.$showOnboarding = .init(wrappedValue: OnboardingFeature.State())
                } else {
                    
                }
                
                return .none
                
            case .showOnboarding(_):
                return .none
            }
        }
        .ifLet(\.$showOnboarding, action: /Action.showOnboarding) {
            OnboardingFeature()
        }
    }
}
