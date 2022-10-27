//
//  LinkView.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/21/22.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let webView: WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) { }
}



class WebViewModel: ObservableObject {
    let webView: WKWebView
    var actualLink: URL?
    public var title: String?
    var linkButton: LinkButton
    var codeFound: Bool

    
    init(linkButton: LinkButton) {
        self.linkButton = linkButton
        webView = WKWebView(frame: .zero)
        title = linkButton.title
        if title != nil && linkButton.link != nil{
                if let x = linkButton.link,
                    let actualLink = URL(string: x){
                    
                    self.actualLink = actualLink
                }
                codeFound = true
                
        }else{
            codeFound = false
            title = "Code not found"
            actualLink = URL(string: "www.google.com")!
            
        }
        loadUrl()
    }

    func loadUrl() {
        if codeFound{
            if let actualLink = actualLink {
                webView.load(URLRequest(url: actualLink as URL))
            }
            
        }
    }
}

struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button("Internet Connection Unavailable, please check your connection and try again.") {
            presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
        .background(Image("writing").resizable(resizingMode: .stretch).aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill).edgesIgnoringSafeArea(.all))
    }
}

struct LinkView: View {
    //let link: URL
    @State var linkButt: LinkButton
    @State var isLoading = true
    var model : WebViewModel//(link: link)
    init(linkButton: LinkButton) {
        //self.link = link
        linkButt=linkButton
        model=WebViewModel(linkButton: linkButton)
        
        //print(link.absoluteString)
    }
    
    var body: some View {
            VStack {
                if isLoading {
                    LoadingView()
                } else {
                    LinkDoneLoadingView(linkButton: linkButt)
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading = false
                }
            }
        }

 
  }



struct LinkDoneLoadingView: View {
    @ObservedObject var net = NetworkManager()
    var model : WebViewModel//(link: link)
    init(linkButton: LinkButton) {
        //self.link = link
        net=NetworkManager()
        model=WebViewModel(linkButton: linkButton)
        
        //print(link.absoluteString)
    }
    
    var body: some View {
            ZStack{
                /*Image("writing")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(abs(net.connectionDescription()-1.0))*/

                WebView(webView: model.webView).opacity(abs(net.connectionDescription()-1.0))
                
                /*Image("writing")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(net.connectionDescription())*/
                Text("Network Error, please check your connection and try again.").foregroundColor(.white).font(.largeTitle).opacity(net.connectionDescription()).cornerRadius(15).font(Font.largeTitle.weight(.bold)).shadow(color: .black, radius: 2)
                   
                
            }.background(Image("writing")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                            .edgesIgnoringSafeArea(.all))
                            //.opacity(net.connectionDescription()))
            }
    
}
