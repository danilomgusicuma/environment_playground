import Foundation
import Combine
import SpriteKit

public class SceneController: ObservableObject {
    @Published public var images: [(String, CGPoint, CGFloat)]
    
    @Published public var badImages: [(String, CGPoint, CGFloat)]
    
    internal init() {
        self.images = [( "mountain1.png", CGPoint(x: 450, y: 60), 8 )
                        ,( "mountain2.png", CGPoint(x: 50, y: 60), 8 )
                        ,( "water.png", CGPoint(x: 250, y: 25), 7 )
                        ,( "mountain3.png", CGPoint(x: 250, y: 80), 5 )
                        ,( "mountain4.png", CGPoint(x: 250, y: 150), 2 )
                        ,( "mountain5.png", CGPoint(x: 420, y: 190), 2 )
                        ,( "mountain6.png", CGPoint(x: 80, y: 220), 2 )
                        ,( "sun.png", CGPoint(x: 370, y: 290), 1 )]
        
        self.badImages = [( "mountain1.png", CGPoint(x: 450, y: 60), 8 )
                          ,( "mountain2.png", CGPoint(x: 50, y: 60), 8 )
                          ,( "water.png", CGPoint(x: 250, y: 25), 7 )
                          ,( "mountain3.png", CGPoint(x: 250, y: 80), 5 )
                          ,( "mountain4.png", CGPoint(x: 250, y: 150), 2 )
                          ,( "mountain5.png", CGPoint(x: 420, y: 190), 2 )
                          ,( "mountain6.png", CGPoint(x: 80, y: 220), 2 )
                          ,( "sun.png", CGPoint(x: 370, y: 290), 1 )
                          ,("city1.png", CGPoint(x: 40, y: 150), 4)
                          ,("city2.png", CGPoint(x: 445, y: 166), 4)
                          ,("city3.png", CGPoint(x: 174, y: 170), 4)
                          ,("houses.png", CGPoint(x: 250, y: 90), 9)
                          ,("road.png", CGPoint(x: 250, y: 90), 6)
                          ,("bigcity.png", CGPoint(x: 250, y: 140), 3)
                          ,("pollution.png", CGPoint(x: 250, y: 290), 2)
        ]
    }
}
