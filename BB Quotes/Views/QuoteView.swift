//
//  QuoteView.swift
//  BB Quotes
//
//  Created by Justin Maronde on 3/20/24.
//

import SwiftUI

struct QuoteView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    
    let show: String
    
    var body: some View {
        GeometryReader { geoReader in
            ZStack {
                Image(show.lowerNoSpaces)
                    .resizable()
                    .frame(width: geoReader.size.width * 2.7, height: geoReader.size.height * 1.2)
                
                VStack {
                    VStack {
                        Spacer(minLength: 140)
                        
                        switch viewModel.status {
                        case .notStarted:
                            EmptyView()
                        case .fetching:
                            ProgressView()
                        case .success(let data):
                            Text("\"\(data.quote.quote)\"")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                                .background(.black.opacity(0.5))
                                .cornerRadius(25)
                                .padding(.horizontal)
                            
                            ZStack(alignment: .bottom, content: {
                                AsyncImage(url: data.character.images[0]) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: geoReader.size.width / 1.1, height: geoReader.size.height / 1.8)
                                
                                Text(data.quote.character)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                            })
                            .frame(width: geoReader.size.width / 1.1, height: geoReader.size.height / 1.8)
                            .cornerRadius(80)
                        case .failed(let error):
                            EmptyView()
                        }
                        
                        Spacer()
                    }
                    
                    Button {
                        //Action of button press here
                        Task {
                            await viewModel.getData(for:show)
                        }
                    } label: {
                        Text("Get Random Quote")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("\(show.noSpaces)Button"))
                            .cornerRadius(7)
                            .shadow(color: Color("\(show.noSpaces)Shadow"), radius: 2)
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
    QuoteView(show: Constants.bbName)
        .preferredColorScheme(.dark)
}
