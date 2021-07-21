import Foundation
import SpriteKit
import SwiftUI


extension UIImage {
    static func gradientImage(withBounds: CGRect, startPoint: CGPoint, endPoint: CGPoint , colors: [CGColor]) -> UIImage {
        //configuring the gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = withBounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        //render the image using gradient layer
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}

public class CustomScene: SKScene {
        
    let color1: CGColor = UIColor(red: 72/255, green: 187/255, blue: 246/255, alpha: 1).cgColor
    let color2: CGColor = UIColor(red: 219/255, green: 193/255, blue: 194/255, alpha: 1).cgColor
    let color3: CGColor = UIColor(red: 236/255, green: 239/255, blue: 242/255, alpha: 1).cgColor
    
    let startPoint = CGPoint(x: 0.5, y: 0)
    let endPoint = CGPoint(x: 0.5, y: 1)
    
    public var message: String = ""
    public var images:[(String, CGPoint, CGFloat)] = []
    
    func addImageToView( image: String, location: CGPoint, z: CGFloat){
        let uiimage = UIImage(named: image)
        let texture = SKTexture(image: uiimage!)
        let node = SKSpriteNode(texture: texture)
        node.scale(to: CGSize(width: 0.54 * uiimage!.size.width, height: 0.54 * uiimage!.size.height))
        node.position = location
        node.name = image
        node.zPosition = z
        self.addChild(node)
    }
    
    func addImagesToView(images: [(String, CGPoint, CGFloat)]){
        
        self.removeAllChildren()
        
        let frameSize = self.frame
        let rect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        let image = UIImage.gradientImage(withBounds: rect, startPoint: startPoint, endPoint: endPoint, colors: [color1, color2, color3])
        let gradientTexture = SKTexture(image: image)
        let gradientNode = SKSpriteNode(texture: gradientTexture)
        gradientNode.anchorPoint.x = 0
        gradientNode.anchorPoint.y = 0
        
        self.addChild(gradientNode)
        
        for i in images.reversed() {
            addImageToView(image: i.0, location: i.1, z: i.2)
        }
    }
    
    func addMessageToView(){
        let text = SKLabelNode(fontNamed: "")
        text.text = message
        text.fontSize = 35
        text.fontColor = SKColor.white
        text.position = CGPoint(x: self.frame.midX, y: 100)
        text.zPosition = 10
    
        self.addChild(text)
    }
    
    
    public override func didMove(to view: SKView) {
        addImagesToView(images: images)
        addMessageToView()
    }
    
    //public override func update(_ currentTime: TimeInterval) {
    //    addImagesToView(images: images)
    //}
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in:self)
        print(location)
    }
}


