//
//  WelcomeHeader.swift
//  StocksApp
//
//  Created by Andrei Avram on 12.02.2023.
//

import SwiftUI

struct WelcomeHeader: View {
    var username: String
    var body: some View {
        VStack (alignment : .leading) {
                Text(R.string.localizable.homeScreenWelcomeHeaderHelloUser(username))
                    .font(UIStyles.BodySmall.font)
                    .foregroundColor(UIStyles.BodySmall.color)

                Text(R.string.localizable.homeScreenWelcomeHeaderWelcome())
                    .font(UIStyles.Headline.font)
                    .foregroundColor(UIStyles.Headline.color)

        }
    }
}

struct WelcomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHeader(username : "Andrei Avram")
    }
}
