//
//  PrimaryButton.swift
//  ConvertMoneyFre
//
//  Created by Frédéric Helfer on 16/08/23.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color.cOrangeDark)
            .overlay {
                Text(title)
                    .font(.custom(Font.sanFrancisco, size: 14))
                    .bold()
                    .foregroundStyle(.white)
            }
    }
}

#Preview {
    PrimaryButton(title: "COMEÇAR")
}
