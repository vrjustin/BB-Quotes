//
//  QuoteView.swift
//  BB Quotes
//
//  Created by Justin Maronde on 3/20/24.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
        GeometryReader { geoReader in
            ZStack {
                Image("breakingbad")
                    .resizable()
                    .frame(width: geoReader.size.width * 2.7, height: geoReader.size.height * 1.2)
                
                VStack {
                    Spacer(minLength: 140)
                    
                    Text("\"You either run from things or you face them, Mr. White.\"")
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                        .background(.black.opacity(0.5))
                        .cornerRadius(25)
                        .padding(.horizontal)
                    
                    ZStack(alignment: .bottom, content: {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFill()
                        
                        Text("Jesse Pinkman")
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                    })
                    .frame(width: geoReader.size.width / 1.1, height: geoReader.size.height / 1.8)
                    .cornerRadius(80)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(.breakingBadGreen)
                            .cornerRadius(7)
                            .shadow(color: .breakingBadYellow, radius: 2)
                    }
                    
                    Spacer(minLength: 180)
                }
                .frame(width: geoReader.size.width)
            }
            .frame(width: geoReader.size.width, height: geoReader.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    QuoteView()
//        .preferredColorScheme(.dark)
}
