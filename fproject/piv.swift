//
//  profileImageView.swift
//  Superlatives
//
//  Created by Syeda Hussain on 5/28/24.
//

import SwiftUI

struct profileImageView2: View {
    var userImage: Image
    var textBox: String
    var imageSize: Double
    
    var body: some View {
        
           // GeometryReader { geo in
                HStack {
                userImage
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.blueish, lineWidth: 3))
                   .frame(width: imageSize)
                   // .padding(100)
                Text(textBox)
                        .font(.custom("Helvetica.ttc", size: 16, relativeTo: .subheadline))
                    .foregroundColor(.white)
                    .padding()
                   .background {
                        RoundedRectangle(cornerRadius: 5)
                           
                           
                            //.stroke(Color.blue, lineWidth: 5)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)
                            .shadow(color: .blueish, radius: 0.2)

                            
                    }
            }
        //}
    }
}

#Preview {
    profileImageView2(userImage: Image("Leah"), textBox: "A Student signed your yearbook", imageSize: 1.5)
}
