//
//  SwiftUIView.swift
//  Superlatives
//
//  Created by Syeda Hussain on 5/28/24.
//

import SwiftUI
//struct Notifications {
//    var 
//}

struct AlertView: View {
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                profileImageView2(userImage: Image(systemName: "person"), textBox: "User signed your yearbook", imageSize: 0.3)
                
                
            }
            Spacer()

        }
    }
}

#Preview {
    AlertView()
}
