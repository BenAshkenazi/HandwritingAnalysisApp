//
//  InfoView.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/22/22.
//

import Foundation
import SwiftUI
import AVKit
import UIKit
import AVFoundation
import WebKit


struct InfoView: View {

    //@State var number = 0
    //@State var player = AVPlayer(url:  Bundle.main.url(forResource: "graphPlace", withExtension: "mp4")!)
    @State var isPresented = false;
    var fontThing = UIScreen.screenHeight/45;
    
    var imgSize = UIScreen.screenHeight/3;
     var body: some View {
         ZStack{
             Image("writing")
                 .resizable(resizingMode: .stretch)
                 .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                 .edgesIgnoringSafeArea(.all)
                 VStack{
                     Link(destination: URL(string: "https://www.youtube.com/watch?v=vihg7L_uuXk")!){
                         VStack{
                             Image("playButton").resizable().frame(width: imgSize, height: imgSize*(9.0/16.0))
                                 .multilineTextAlignment(.center)
                             ZStack{
                                 Capsule()
                                     .stroke(Color.black, lineWidth: 1)
                                     .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenWidth/8)
                                 Capsule()
                                     //.stroke(Color.black, lineWidth: 0.5)
                                     .fill(Color.white.opacity(0.7))
                                     .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenWidth/8)
                                     
                                 Text("Watch David in Action")
                                     .font(Font.headline.weight(.bold))
                                     .foregroundColor(Color.black)
                                     .font(.system(size: fontThing))
                             }.multilineTextAlignment(.center)
                             
                             
                         }.multilineTextAlignment(.center)
                         
                     }
                     /*StrokeText(text: "About David Littmann:", width: 0.75, color: .white)
                         .font(.system(size: 30, weight: .bold))
                         .foregroundColor(Color.black)*/

                     Text("David L. Littmann is a certified graphologist. He has served as a chairman on the Board of Trustees of the American Association of Handwriting Analysts. \n\nHis writings on handwriting analysis have been published more than a dozen times in various acclaimed publications. David Littmann appeared on Dow Jones' _Coffee Break_, discussing writing samples of each presidential candidate. \n\nAdditionally, David Littmann has given talks about, and samples of, his handwriting analysis at more than 50 venues.")
                         .multilineTextAlignment(.leading)
                         .foregroundColor(.black)
                         .padding()
                         .font(.system(size: fontThing/1.1))
                         .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(Color.white).opacity(0.9))
                         .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenHeight/2.2)
  
                     
                     Spacer()
                     NavigationLink(destination: PDFUIView()) {
                         
                         ZStack{
                             Capsule()
                                 .stroke(Color.black, lineWidth: 1)
                                 .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenWidth/8)
                             Capsule()
                                 //.stroke(Color.black, lineWidth: 0.5)
                                 .fill(Color.white.opacity(0.7))
                                 .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenWidth/8)
                                 
                             
                                 
                             Text("David Littmann's Vitae")
                                 .font(Font.headline.weight(.bold))
                                 .foregroundColor(Color.black)
                                 .font(.system(size: fontThing))
                                 .padding()
                         
                         }
                                  
                     }
                     Spacer().frame(height: UIScreen.screenHeight/20.0)

                     //Text("Watch Graphology in Action!").fontWeight(.bold)
                     //VideoPlayer(player: player)
                     
                     //.position(x: UIScreen.main.bounds.width/2)
                     /*.fullScreenCover(isPresented: $isPresented){
                         videoView()
                     }*/
                     

                 
                 /*NavigationLink("Watch Handwriting Analysis in Action!", destination: AVPlayer(url:  Bundle.main.url(forResource: "graphPlace", withExtension: "mp4")!))*/

                 
                 }
             }.navigationBarTitle(Text(""), displayMode: .inline)

            .onAppear{
             UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
             AppDelegate.orientationLock = .portrait

         }

         
     }
    
    
}

/*struct videoView2: UIViewRepresentable{
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard URL(string:"https://www.youtube.com/embed/\(videoID)") != nil else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: URL(string:"https://www.youtube.com/embed/\(videoID)")! ))
    }
    
    
}

struct videoView: View {
    @Environment(\.presentationMode) var presentationMode
    //let orientation = UIApplication.shared.statusBarOrientation

    //@State var orientationValue = UIInterfaceOrientation.landscapeRight.rawValue
    
    
    func checkAudio(){
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch(let error) {
            print(error.localizedDescription)
        }
        /*if orientation == .landscapeLeft || orientation == .landscapeRight {
            orientationValue = orientation.rawValue

        }

        UIDevice.current.setValue(orientationValue, forKey: "orientation")*/
        player.play()
        
    }
    
    /*func flipScreen(){

        
        orientationValue = UIInterfaceOrientation.portrait.rawValue
        
        UIDevice.current.setValue(orientationValue, forKey: "orientation")
        player.play()
        
    }*/
    
    @State var player = AVPlayer(url:  Bundle.main.url(forResource: "graphPlace", withExtension: "mp4")!)


    var body: some View {
        
        
        
        VStack(alignment: .leading){
            /*Button("< Back"){
                presentationMode.wrappedValue.dismiss()
                
            }                //..rotationEffect(.degrees(-90), anchor: .center)*/
           
            VideoPlayer(player: player)
                .onAppear{
                    checkAudio()
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                    AppDelegate.orientationLock = .landscape
                }.onDisappear {
                    player.pause()
                    AppDelegate.orientationLock = .portrait // Unlocking the rotation when leaving the view
                }
                /*.rotationEffect(.degrees(-90))
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .fixedSize()*/
            //.onDisappear{flipScreen()}
           
    }
    
    
}
}*/


extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}


           

