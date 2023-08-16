//
//  OnboardingView.swift
//  ConvertMoneyFre
//
//  Created by Frédéric Helfer on 16/08/23.
//

import ComposableArchitecture
import SwiftUI

struct OnboardingView: View {
    let store: StoreOf<OnboardingFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.cGreenDark.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    imageAndTitle
                    
                    Spacer()
                    
                    bottomSheet(store: viewStore)
                }
                .ignoresSafeArea(edges: .bottom)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            .toolbarColorScheme(.light, for: .navigationBar)
        }
    }
}

#Preview {
    OnboardingView(
        store: Store(initialState: OnboardingFeature.State()) {
            OnboardingFeature()
        }
    )
}

private extension OnboardingView {
    
    var imageAndTitle: some View {
        VStack {
            Image(.onboardingImg)
                .resizable()
                .scaledToFit()
            
            Text("Convert \n Money")
                .font(.custom(Font.sanFrancisco, size: 42))
                .bold()
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 12)
    }
    
    func bottomSheet(store viewStore: ViewStoreOf<OnboardingFeature>) -> some View {
        VStack(alignment: .leading, spacing: 22) {
            Text("Olá, \n vamos economizar?")
                .font(.custom(Font.sanFrancisco, size: 32))
                .bold()
                .foregroundStyle(.black)
            
            Text("Nunca foi tão fácil saber o seu saldo e se você consegue comprar aquele produto desejado")
                .font(.custom(Font.sanFrancisco, size: 16))
                .foregroundStyle(.black)
            
            Button {
                viewStore.send(.startButtonTapped)
            } label: {
                PrimaryButton(title: "COMEÇAR")
            }

        }
        .frame(maxWidth: .infinity)
        .padding(EdgeInsets(top: 42, leading: 32, bottom: 50, trailing: 32))
        .background(Color.cLight)
        .clipShape(
            .rect(
                topLeadingRadius: 32,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 32
            )
        )
    }
}
