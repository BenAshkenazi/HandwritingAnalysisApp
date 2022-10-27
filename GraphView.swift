//
//  GraphView.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/22/22.
//
import Foundation
import SwiftUI
import PDFKit


var myLinks=[
    LinkButton(id: 1, title: "History of the AAHA", link: "https://www.aahahandwriting.org/aahas-history.html"),
    
    LinkButton(id: 2, title: "FAQ", link: "https://www.aahahandwriting.org/faqs.html"),
    
   // LinkButton(id: 3, title: "Graphology in Science", link: "https://tinyurl.com/newsactualities"),
    
    LinkButton(id: 5, title: "Reading List", link: "https://www.aahahandwriting.org/education-aids.html"),
    
    LinkButton(id: 6, title: "Archive", link: "https://www.aahahandwriting.org/resources.html"),
       
]



struct GraphView: View {
    var fontThing = UIScreen.screenHeight/45;
    var titleSize = UIScreen.screenHeight/30;

    var body: some View {
        
        ZStack{
            Image("writing")
                .resizable()
                .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight)

            /*RoundedRectangle(cornerRadius: 4, style: .continuous)
                .fill(Color.white)
                .opacity(0.7)

            
                //.aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)*/
            
            VStack{
                Group{
                    StrokeText(text: "Other Resources:", width: 0.75, color: .white)
                        .font(.system(size: titleSize, weight: .bold))
                        .foregroundColor(Color.black)
                   /* StrokeText(text: "of Handwriting Analysts:", width: 0.75, color: .white)
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(Color.black)*/
                    Text("David recieved his accreditation from the American Association of Handwriting Analysts, an institution that, for the past 60 years, has offered exemplary resources for aspiring and experienced handwriting analysts.")
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .font(.system(size:fontThing))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.white).opacity(0.9))
                            .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenHeight/4)
                }
                HStack{
                    VStack{
                        Spacer(minLength: UIScreen.screenHeight/24)
                        ForEach(0..<4){index in
                                NavigationLink(destination: LinkView(linkButton:  myLinks[index])) {
                                    ZStack{
                                        
                                        Capsule()
                                            .stroke(Color.black, lineWidth: 1)
                                            .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenWidth/8)
                                        Capsule()
                                            //.stroke(Color.black, lineWidth: 0.5)
                                            .fill(Color.white.opacity(0.7))
                                            .frame(width: UIScreen.screenWidth/1.12, height: UIScreen.screenWidth/8)
                                            
                                        Text(myLinks[index].title!)
                                            .font(Font.headline.weight(.bold))
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 40.0))
                                    
                                    }.multilineTextAlignment(.center)
                                }.multilineTextAlignment(.center)
                                    
                                }.position(x: UIScreen.main.bounds.width/2)
                            Spacer()
                            }
                }
            }
        }.navigationBarTitle(Text(""), displayMode: .inline)

    }
}

struct PDFKitView: UIViewRepresentable {
    
    let pdfDocument: PDFDocument
    
    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }
    
    //you could also have inits that take a URL or Data
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoScales = true
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}

struct PDFUIView: View {

    let pdfDoc: PDFDocument
    
    init() {
        //for the sake of example, we're going to assume
        //you have a file Lipsum.pdf in your bundle
        let url = Bundle.main.url(forResource: "grandpaVitae", withExtension: "pdf")!
        pdfDoc = PDFDocument(url: url)!
    }
    
    var body: some View {
        PDFKitView(showing: pdfDoc)
            .background(Image("writing")
            .resizable(resizingMode: .stretch)
            .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill)
            .edgesIgnoringSafeArea(.all))
    }
}

    
