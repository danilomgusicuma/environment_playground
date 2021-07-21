import Foundation
import SpriteKit
import SwiftUI
import PlaygroundSupport

/// This is a basic SwiftUI View
public struct Page3: View {
    
    @Binding public var pageController: Int
    @ObservedObject private var observableButtons = ButtonsController()
    @ObservedObject private var observableImages = SceneController()
    @State var modalIsDisplayed = false

    
    let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 500, height: 368))
    
    var scene: SKScene {
        let sceneSize = CGSize(width: 500, height: 368)
        let scene = CustomScene(size: sceneSize)
        scene.scaleMode = .aspectFit
        scene.images = observableImages.badImages
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
                .padding()
                .background(Color(red: 1, green: 1, blue: 1))
                .cornerRadius(4)
        }
    }
    
    public func pushImage(buttonType:String){
        switch buttonType {
        case "windpower.png":
            observableImages.badImages.insert(("windpower.png", CGPoint(x: 370, y: 90), 11), at: observableImages.badImages.count)
            if let idx = observableButtons.goodButtons.firstIndex(where: { $0.1 == "windpower.png"}) {
                observableButtons.goodButtons.remove(at: idx)
                if observableButtons.goodButtons.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        pageController = 4
                    }
                }
            }
        case "trees.png":
            observableImages.badImages.insert(("trees.png", CGPoint(x: 230, y: 90), 7), at: observableImages.badImages.count)
            if let idx = observableButtons.goodButtons.firstIndex(where: { $0.1 == "trees.png"}) {
                observableButtons.goodButtons.remove(at: idx)
            }
        case "cleancity1.png":
            observableImages.badImages.insert(("cleancity1.png", CGPoint(x: 40, y: 150), 5), at: observableImages.badImages.count)
            if let idx = observableButtons.goodButtons.firstIndex(where: { $0.1 == "cleancity1.png"}) {
                observableButtons.goodButtons.remove(at: idx)
            }
            observableImages.badImages.insert(("cleancity2.png", CGPoint(x: 445, y: 166), 5), at: observableImages.badImages.count)
            if let idx = observableButtons.goodButtons.firstIndex(where: { $0.1 == "cleancity2.png"}) {
                observableButtons.goodButtons.remove(at: idx)
            }
            observableImages.badImages.insert(("cleancity3.png", CGPoint(x: 174, y: 170), 5), at: observableImages.badImages.count)
            if let idx = observableButtons.goodButtons.firstIndex(where: { $0.1 == "cleancity3.png"}) {
                observableButtons.goodButtons.remove(at: idx)
            }
        case "cleancity.png":
            observableImages.badImages.insert(("cleancity.png", CGPoint(x: 250, y: 140), 4), at: observableImages.badImages.count)
            if let idx = observableButtons.goodButtons.firstIndex(where: { $0.1 == "cleancity.png"}) {
                observableButtons.goodButtons.remove(at: idx)
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
                    
                    if (observableButtons.goodButtons.count > 0) {
                        Button(observableButtons.goodButtons[0].0){
                            pushImage(buttonType: observableButtons.goodButtons[0].1)
                            if observableButtons.goodButtons.count == 1 {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                    pageController = 4
                                }
                            }
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }
                    
                    if observableButtons.goodButtons.count > 1 {
                        Button(observableButtons.goodButtons[1].0){
                            pushImage(buttonType: observableButtons.goodButtons[1].1)
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }

                }.padding(.horizontal,8)
                HStack{
                    
                    if observableButtons.goodButtons.count > 2 {
                        Button(observableButtons.goodButtons[2].0){
                            pushImage(buttonType: observableButtons.goodButtons[2].1)
                        }
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button(""){}.buttonStyle(DisabledButtonStyle())
                    }
                    
                    if observableButtons.goodButtons.count > 3 {
                        Button(observableButtons.goodButtons[3].0){
                            pushImage(buttonType: observableButtons.goodButtons[3].1)
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

