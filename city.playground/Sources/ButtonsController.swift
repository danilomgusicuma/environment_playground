import Foundation
import Combine
import SpriteKit

public class ButtonsController: ObservableObject {
    
    @Published public var badButtons: [(String, String)] = [
        ("🏬", "city1.png"),
        ("🏠" , "houses.png"),
        ("🏬" , "city2.png"),
        ("🏬" , "city3.png"),
        ("🚗" , "road.png"),
        ("🏬" , "bigcity.png"),
    ]
    
    @Published public var goodButtons: [(String, String)] = [
        ("🌬️", "windpower.png"),
        ("🌳" , "trees.png"),
        ("🌳" , "cleancity.png"),
        ("🚲" , "cleancity1.png"),
    ]
}
