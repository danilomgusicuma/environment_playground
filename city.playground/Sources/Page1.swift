import Foundation
import SpriteKit
import SwiftUI
import PlaygroundSupport

/// This is a basic SwiftUI View
public struct Page1: View {
    
    @Binding public var pageController: Int
    @ObservedObject private var observableButtons = ButtonsController()
    @ObservedObject private var observableImages = SceneController()
    @State private var message = "Let's build a city!"
    @State var modalIsDisplayed = false
    
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 500, height: 368))
    
    var scene: SKScene {
        let sceneSize = CGSize(width: 500, height: 368)
        let scene = CustomScene(size: sceneSize)
        scene.scaleMode = .aspectFit
        scene.images = observableImages.images
        scene.message = message
        return scene
    }
    
    struct CustomButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 42)
                .background(Color(red: 0.61, green: 0.69, blue: 0.80))
                .cornerRadius(4)
                .foregroundColor(Color(red: 1, green: 1, blue: 1))
                .font(Font.body.bold())
        }
    }
    
    struct DisabledButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color(red: 1, green: 1, blue: 1))
                .cornerRadius(4)
        }
    }
    
    public func pushImage(buttonType:String){
        message = ""
        switch buttonType {
        case "city1.png":
            observableImages.images.insert(("city1.png", CGPoint(x: 40, y: 150), 4), at: observableImages.images.count)
            if let idx = observableButtons.badButtons.firstIndex(where: { $0.1 == "city1.png"}) {
                observableButtons.badButtons.remove(at: idx)
            }
        case "city2.png":
            observableImages.images.insert(("city2.png", CGPoint(x: 445, y: 166), 4), at: observableImages.images.count)
            if let idx = observableButtons.badButtons.firstIndex(where: { $0.1 == "city2.png"}) {
                observableButtons.badButtons.remove(at: idx)
            }
        case "city3.png":
            observableImages.images.insert(("city3.png", CGPoint(x: 174, y: 170), 4), at: observableImages.images.count)
            if let idx = observableButtons.badButtons.firstIndex(where: { $0.1 == "city3.png"}) {
                observableButtons.badButtons.remove(at: idx)
            }
        case "houses.png":
            observableImages.images.insert(("houses.png", CGPoint(x: 250, y: 90), 9), at: observableImages.images.count)
            if let idx = observableButtons.badButtons.firstIndex(where: { $0.1 == "houses.png"}) {
                observableButtons.badButtons.remove(at: idx)
            }
        case "road.png":
            observableImages.images.insert(("road.png", CGPoint(x: 250, y: 90), 6), at: observableImages.images.count)
            if let idx = observableButtons.badButtons.firstIndex(where: { $0.1 == "road.png"}) {
                observableButtons.badButtons.remove(at: idx)
            }
        case "bigcity.png":
            observableImages.images.insert(("bigcity.png", CGPoint(x: 250, y: 140), 3), at: observableImages.images.count)
            if let idx = observableButtons.badButtons.firstIndex(where: { $0.1 == "bigcity.png"}) {
                observableButtons.badButtons.remove(at: idx)
            }
        default:
            print("other")
        }
    }
    
    // The body property must also be public!
    public var body: some View {
    
            VStack{
                
                SpriteView(scene: scene).frame(width: 500, height: 368, alignment: .top)
                
                HStack{
                    
                    if observableButtons.badButtons.count > 0 {
                        Button(observableButtons.badButtons[0].0){
                            pushImage(buttonType: observableButtons.badButtons[0].1)
                            if observableButtons.badButtons.count == 1 {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    pageController = 2
                                }
                            }
                            
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }
                    
                    if observableButtons.badButtons.count > 1 {
                        Button(observableButtons.badButtons[1].0){
                            pushImage(buttonType: observableButtons.badButtons[1].1)
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }

                }.padding(.horizontal,8)
                HStack{
                    
                    if observableButtons.badButtons.count > 2 {
                        Button(observableButtons.badButtons[2].0){
                            pushImage(buttonType: observableButtons.badButtons[2].1)
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }
                    
                    if observableButtons.badButtons.count > 3 {
                        Button(observableButtons.badButtons[3].0){
                            pushImage(buttonType: observableButtons.badButtons[3].1)
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }
                }.padding(.horizontal,8)
                .padding(.bottom, 8)
            }.frame(width: 500, height: 600, alignment: .top)
    }
}
