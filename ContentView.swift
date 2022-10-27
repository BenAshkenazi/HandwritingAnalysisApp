//
//  ContentView.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/21/22.
//

import SwiftUI

struct LinkButton{
    var id: Int
    var title: String?
    var link: String?
}


struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State var isLoading = true
    var body: some View {
            VStack {
                if isLoading {
                    LoadingView()
                } else {
                    DoneLoadingView()
                }
            }.onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                AppDelegate.orientationLock = .portrait
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }.onDisappear {
                AppDelegate.orientationLock = .portrait // Unlocking the rotation when leaving the view
            }
        }
    
}
        


struct LoadingView: View {
    var body: some View {
        ZStack{
            Image("writing")
                .resizable(resizingMode: .stretch)
                .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView("Loading...")
                .scaleEffect(1.5, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .foregroundColor(.black)
                .background(RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .fill(Color.white)
                                .opacity(0.85)
                                .frame(width: 150, height: 90))
        }
        
       

    }
}

struct DoneLoadingView: View {
    
    var strokeFont = UIScreen.screenHeight/40;
    var fontThing = UIScreen.screenHeight/50;
    //var totalOpa = 0.95;
    //var paddingSize = 20.0;
    //var cornRad = 6.0;
    var buttText = Color.black;
    var buttBack = Color(red:1.0,green:205.0, blue: 199.0);
    //var buttWidth = 2.0;

    var url = URL(string: "mailto:\("littmanngraphology@gmail.com")?subject=\("Handwriting Analysis Comission".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\("Name:\n\n Purpose of Analyis:\n\n Additionally, please attach the handwriting you'd like analyzed:".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")")
    
    var capBorder = Color(red:192.0,green:192.0, blue: 192.0);
    var grandpaSize = UIScreen.screenHeight/4;
    
    var body: some View {
        
       
       NavigationView{
            ZStack{
               
                Image("writing")
                    .resizable(resizingMode:.stretch)
                    .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight)
                
                RoundedRectangle(cornerRadius: 0.01, style: .continuous)
                    .fill(Color.white)
                    .opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight)
        VStack{
            VStack{
                
                /*Text("What does your writing say about you?")
                    .foregroundColor(.black)
                    .font(.callout)
                    .fontWeight(.bold)*/
                Text("").padding([.bottom], 25.0)
                    StrokeText(text: "What does your handwriting", width: 0.2, color: capBorder)
                        .font(.system(size: strokeFont, weight: .bold))
                        .foregroundColor(Color.black)
                
                StrokeText(text: "say about you?", width: 0.2, color: capBorder)
                    .font(.system(size: strokeFont-1, weight: .bold))
                    .foregroundColor(Color.black)
                    StrokeText(text: "To find out, contact:", width: 0.5, color: .white)
                        .font(.system(size: strokeFont, weight: .bold))
                        .foregroundColor(Color.black)
                
                
                
                /*Text("To find out, contact:")
                    .foregroundColor(.black)
                    .font(.headline)
                    .fontWeight(.bold)*/
                
                Image("grandpa")
                    .resizable()
                    //.aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                    .frame(width: grandpaSize, height: grandpaSize*1.5)
                    .border(Color.black, width: 1.5)
                
                StrokeText(text: "DAVID L. LITTMANN", width: 0.75, color: .white)
                    .font(.system(size: strokeFont+2, weight: .bold))
                    .foregroundColor(Color.black)
                
                StrokeText(text: "Certified Graphologist", width: 0.75, color: .white)
                    .font(.system(size: strokeFont-1, weight: .bold))
                    .foregroundColor(Color.black)
                //Text("DAVID L. LITTMANN").font(.largeTitle).fontWeight(.bold).foregroundColor(.black)
                //Text("Certified Graphologist").foregroundColor(.black)
                
            }
            
            HStack{
                VStack{
                Group{
                    HStack{
                    Link(destination: URL(string: "tel:9289250039")!){
                        
                        ZStack{

                            Capsule()
                                .stroke(Color.black, lineWidth: 0.5)
                                .frame(width: UIScreen.screenWidth/2.5+UIScreen.screenWidth/20, height: UIScreen.screenWidth/10)
                                .background(Color.white.opacity(0.0))
                            
                                
                            Text("Call David")
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(buttText)
                                .font(.system(size: fontThing))
                        
                        }
                                 
                    }
                    
                    
                        
                        

                
                        Link(destination: url!){
                        
                        ZStack{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.5)
                                .frame(width: UIScreen.screenWidth/2.5+UIScreen.screenWidth/20, height: UIScreen.screenWidth/10)
                                .background(Color.white.opacity(0.0))
                                
                            Text("Email David")
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(buttText)
                                .font(.system(size: fontThing))
                        
                        }
                                 
                    }
                    }.frame(width: UIScreen.screenWidth/12, height: UIScreen.screenWidth/6)

                    HStack{
                    NavigationLink( destination: PriceView()){
                        
                        ZStack{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.5)
                                .frame(width: UIScreen.screenWidth/2.5+UIScreen.screenWidth/20, height: UIScreen.screenWidth/10)
                                .background(Color.white.opacity(0.0))
                            Text("Appt. Info")
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(buttText)
                                .font(.system(size: fontThing))
                        
                        }
                                 
                    }
                
                    NavigationLink( destination: InfoView()){
                        
                        ZStack{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.5)
                                .frame(width: UIScreen.screenWidth/2.5+UIScreen.screenWidth/20, height: UIScreen.screenWidth/10)
                                .background(Color.white.opacity(0.0))
                            Text("About David")
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(buttText)
                                .font(.system(size: fontThing))
                        
                        }
                                 
                    }
                    }.frame(width: UIScreen.screenWidth/12, height: UIScreen.screenWidth/6)

                    HStack{
                    NavigationLink(destination: ScannerView()){
                        
                        ZStack{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.5)
                                .frame(width: UIScreen.screenWidth/2.5+UIScreen.screenWidth/20, height: UIScreen.screenWidth/10)
                                .background(Color.white.opacity(0.0))
                            Text("QR Scanner")
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(buttText)
                                .font(.system(size: fontThing))
                        
                        }
                                 
                    }

                    NavigationLink(destination: GraphView()){
                        
                        ZStack{
                            Capsule()
                                .stroke(Color.black, lineWidth: 0.5)
                                .frame(width: UIScreen.screenWidth/2.5+UIScreen.screenWidth/20, height: UIScreen.screenWidth/10)
                                .background(Color.white.opacity(0.0))
                            Text("Accreditation")
                                .font(Font.headline.weight(.bold))
                                .foregroundColor(buttText)
                                .font(.system(size: fontThing-3))
                        
                        }
                                 
                    }
                    }
                 Spacer()
                }.onAppear {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                    AppDelegate.orientationLock = .portrait // And making sure it stays that way
                }.onDisappear {
                    AppDelegate.orientationLock = .portrait // Unlocking the rotation when leaving the view
                }
            }
            }
        }
            }
            .accentColor(.white)
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            
                        //.background(Image("clear"))
            }.accentColor(.white)
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
            .navigationViewStyle(StackNavigationViewStyle())

            
            
        }
                /*.background(Image("handwbackground").resizable().aspectRatio(UIImage(named: "handwbackground")!.size, contentMode: .fill).edgesIgnoringSafeArea(.all))//.blendMode(.lighten)*/
   

    }
                    


struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/*
Group{
HStack{
    
    Link(destination: URL(string: "tel:6506198426")!){
        Text("Call David")
            
            .font(.system(size: fontThing))
            .foregroundColor(Color.black)
            .background(
                Capsule()
                    //.fill(Color.white)
                    .stroke(Color.black, lineWidth: 5)
                    
                    .frame(width: 150, height: 50)

                    
            )
    }//.frame(alignment: .bottom)
            
    

    
    Link("Email David", destination: URL(string: "mailto:ben.ashkenazi@gmail.com")!)//.frame(alignment: .bottom)
        .font(.system(size: fontThing))
        .foregroundColor(Color.black)
        .background(
            Capsule()
                //.fill(Color.white)
                .stroke(Color.black, lineWidth: 5)
                .frame(width: 150, height: 50)

                
        )
    
    
        
}
HStack{
    NavigationLink("Pricing  ", destination: PriceView())//.frame(alignment: .bottom)
        .font(.system(size: fontThing))
        .foregroundColor(Color.black)
        .background(
            Capsule()
                //.fill(Color.white)
                .stroke(Color.black, lineWidth: 5)
                .frame(width: 150, height: 50)

                
        )
    NavigationLink("Q&A with David", destination: InfoView())//.frame(alignment: .bottom)
        .font(.system(size: fontThing))
        .foregroundColor(Color.black)
        .background(
            Capsule()
                //.fill(Color.white)
                .stroke(Color.black, lineWidth: 5)
                .frame(width: 150, height: 50)

                
        )
    
    
}
HStack{
    
    NavigationLink("QR Scanner", destination: ScannerView())//.frame(alignment: .bottom)
        .font(.system(size: fontThing))
        .foregroundColor(Color.black)
        .background(
            Capsule()
                //.fill(Color.white)
                .stroke(Color.black, lineWidth: 5)
                .frame(width: 150, height: 50)
                
                
        )
    
    NavigationLink("Graphology", destination: GraphView())//.frame(alignment: .bottom)
        .font(.system(size: fontThing))
        .foregroundColor(Color.black)
        .background(
            Capsule()
                //.fill(Color.white)
                .stroke(Color.black, lineWidth: 5)
                .frame(width: 150, height: 50)

                
        )
        
    
}
}*/
