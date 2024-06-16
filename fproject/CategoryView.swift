//
//  CategoryView.swift
//  Superlatives
//
//  Created by Syeda Hussain on 5/23/24.
//

import SwiftUI

struct CategoryView: View {
    var categoryTitle: String
    
    var body: some View {
        VStack {
            
            Text(categoryTitle)
                .font(.custom("CaviarDreams", size: 20, relativeTo: .title3))
                .foregroundColor(.white)
            Image("image")
                .resizable()
                .scaledToFit()
                .border(Color.white)
                .padding(.bottom, 40)
                // .frame(width: 162, height: 223)
        }
        
    }
}

#Preview {
    CategoryView(categoryTitle: "Most Social")
}
