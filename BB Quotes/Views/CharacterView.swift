//
//  CharacterView.swift
//  BB Quotes
//
//  Created by Justin Maronde on 3/21/24.
//

import SwiftUI

struct CharacterView: View {
    let show: String
    let character: Character
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack(alignment: .top) {
                //background image
                Image(show.lowerNoSpaces)
                    .resizable()
                    .scaledToFit()
                //Scrollview
                ScrollView {
                    // Character Image
                    VStack {
                        AsyncImage(url: character.images.randomElement()) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }

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
                            Text(character.name)
                                .font(.largeTitle)
                            
                            Text("Portrayed By: \(character.portrayedBy)")
                                .font(.subheadline)
                            
                            Divider()
                            
                            Text("\(character.name) Character Info:")
                                .font(.title2)
                            
                            Text("Born: \(character.birthday)")
                            
                            Divider()
                        }
                        
                        Group {
                            Text("Occupations:")
                            
                            ForEach(character.occupations, id:\.self) { occupation in
                                Text("• \(occupation)")
                                    .font(.subheadline)
                            }
                            
                            Divider()
                            
                            Text("Nicknames:")
                            
                            if character.aliases.count > 0 {
                                ForEach(character.aliases, id:\.self) { alias in
                                    Text("• \(alias)")
                                        .font(.subheadline)
                                }
                            } else {
                                Text("None")
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
    CharacterView(show: Constants.bbName, character: Constants.previewCharacter)
    //        .preferredColorScheme(.dark)
}
