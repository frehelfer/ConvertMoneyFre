//
//  SplashView.swift
//  ConvertMoneyFre
//
//  Created by Frédéric Helfer on 16/08/23.
//

import ComposableArchitecture
import SwiftUI

struct SplashView: View {
    let store: StoreOf<SplashFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.cGreenDark.ignoresSafeArea()
                
                VStack(spacing: 10) {
                    
                    ProgressView()
                        .tint(.cBrown)
                        .controlSize(.extraLarge)
                    
                    Text("Carregando...")
                        .font(.custom(Font.sanFrancisco, size: 22))
                        .foregroundStyle(.cLight)
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .fullScreenCover(store: self.store.scope(state: \.$showOnboarding, action: { .showOnboarding($0) })) { store in
                    OnboardingView(store: store)
            }
        }
    }
}

#Preview {
    SplashView(
        store: Store(initialState: SplashFeature.State()) {
            SplashFeature()
        }
    )
}
