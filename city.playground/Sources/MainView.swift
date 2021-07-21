import Foundation
import SwiftUI

public struct MainView: View {
    
    @State public var page:Int = 1
    
    public init () {
        
    }
    
    public var body: some View {
        switch page {
        case 1:
            Page1(pageController: $page)
        case 2:
            Page2(pageController: $page)
        case 3:
            Page3(pageController: $page)
        case 4:
            Page4(pageController: $page)
        case 5:
            Page5(pageController: $page)
        case 6:
            Page6(pageController: $page)
        default:
            Page4(pageController: $page)
        }
    }
}
