//
//  CharacterView.swift
//  BB Quotes
//
//  Created by Justin Maronde on 3/21/24.
//

import SwiftUI

struct CharacterView: View {
    var body: some View {
        GeometryReader { geoReader in
            ZStack(alignment: .top) {
                //background image
                Image("breakingbad")
                    .resizable()
                    .scaledToFit()
                //Scrollview
                ScrollView {
                    // Character Image
                    VStack {
                        Image("jessepinkman")
                            .resizable()
                            .scaledToFill()
                    }
                    .frame(width: geoReader.size.width / 1.2, height: geoReader.size.height / 1.7)
                    .cornerRadius(25)
                    .padding(.top, 60)
                    
                    // Character Info
                    VStack(alignment: .leading) {
                        Group {
                            //These are added in a group originally
                            //due to some limit of 10 subviews - but
                            //personally did not encounter this. Is it fixed?
                            Text("Jesse Pinkman")
                                .font(.largeTitle)
                            
                            Text("Portrayed By: Aaron Paul")
                                .font(.subheadline)
                            
                            Divider()
                            
                            Text("Jesse Pinkman Character Info:")
                                .font(.title2)
                            
                            Text("Born: 09/24/1984")
                            
                            Divider()
                        }
                        
                        Group {
                            Text("Occupations:")
                            
                            ForEach(0..<3) { i in
                                Text("• Occupation \(i)")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            Text("Nicknames:")
                            
                            ForEach(0..<3) { i in
                                Text("• Alias \(i)")
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding([.leading, .bottom], 40)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CharacterView()
    //        .preferredColorScheme(.dark)
}
