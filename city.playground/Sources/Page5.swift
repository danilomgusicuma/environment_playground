import Foundation

import SwiftUI

/// This is a basic SwiftUI View
public struct Page5: View {
    
    @Binding public var pageController: Int
    
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color(red: 0.61, green: 0.69, blue: 0.80))
                .cornerRadius(4)
                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                .font(Font.body.bold())
        }
    }
    
    // The body property must also be public!
    public var body: some View {
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/){
            Text(" More and more, people are living in slums and we're contributing to climate changes, garbage generation and polution.")
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
            Text("")
            Button("Continue"){
                pageController = 6
            }.buttonStyle(CustomButtonStyle())
        }.frame(width: 400, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
