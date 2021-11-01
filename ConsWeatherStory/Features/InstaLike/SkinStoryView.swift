//
//  SkinStoryView.swift
//  ConsWeatherStory
//
//  Created by Nicholas on 27/10/21.
//

import SwiftUI

struct SkinStoryView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        Button {
                            
                        } label: {
                            Image("portrait")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(
                                    Image(systemName: "plus")
                                        .padding(7)
                                        .background(.blue, in: Circle())
                                        .foregroundColor(.white)
                                        .padding(2)
                                        .background(.black, in: Circle())
                                        .offset(x: 10, y: 10)
                                    , alignment: .bottomTrailing
                                )
                        }
                        
                        // Stories:
                    }
                    .padding()
                    .padding(.top, 10)
                }
            }
        }
    }
}

struct SkinStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SkinStoryView()
    }
}
