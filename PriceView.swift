//
//  PriceView.swift
//  Handwriting Analysis by Dave
//
//  Created by Ben Ashkenazi on 2/24/22.
//

import Foundation
import SwiftUI


struct PriceView: View {

    var titleSize = UIScreen.screenHeight/30;
    var imgSize = 60.0;
     var body: some View {
         ZStack{
             Image("writing")
                 .resizable()
                 .aspectRatio(UIImage(named: "writing")!.size, contentMode: .fill).edgesIgnoringSafeArea(.all)
                 .edgesIgnoringSafeArea(.all)
             VStack{
                 StrokeText(text: "Appointment Information:", width: 0.75, color: .white)
                     .font(.system(size: titleSize, weight: .bold))
                     .foregroundColor(Color.black)

                 Text("This application only provides the means to contact David Littmann. Follow these instructions to have your handwriting analyzed:\n\nHandwriting Analysis for Personal Use:\nPlease send your request and the handwriting sample to: littmannGraphology@gmail.com. \n\nOnce David Littmann has confirmed that he will perform the analysis, you will be asked for half of the amount owed, with the rest due upon completion of the analysis.\n \nHandwriting Analysis for Legal Use: Price will vary depending on the scope and complexity of the request. Please consult with David Littmann for further information. ")
                     .accentColor(.black)
                     .font(.system(size: titleSize/1.5))
                     .multilineTextAlignment(.leading)
                     .foregroundColor(.black)
                     .padding()
                     .background(RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color.white).opacity(0.9))
                     
                     .frame(width: UIScreen.screenWidth/1.1, height: UIScreen.screenHeight/1.5)
                     
                 Spacer()
         }
     }    .navigationBarTitle(Text(""), displayMode: .inline)

    
     }
}
