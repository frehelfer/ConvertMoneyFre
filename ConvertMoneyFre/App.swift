//
//  ConvertMoneyFreApp.swift
//  ConvertMoneyFre
//
//  Created by Frédéric Helfer on 16/08/23.
//

import ComposableArchitecture
import SwiftUI

@main
struct ConvertMoneyFreApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {   
                SplashView(
                    store: Store(initialState: SplashFeature.State()) {
                        SplashFeature()
                    }
                )
            }
        }
    }
}
