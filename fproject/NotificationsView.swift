////
////  NotificationsView.swift
////  Superlatives
////
////  Created by Syeda Hussain on 5/24/24.
////
//
//import SwiftUI
//
//struct NotificationsView: View {
//    var body: some View {
//        GeometryReader { geo in
//        ZStack {
//            Image("NotificationBackground3")
//                .resizable()
//                .ignoresSafeArea()
//            ScrollView {
//                VStack(alignment: .leading) {
//                    
//                    
//                    Text("Notifications")
//                        .font(.custom("Helvetica.ttc", size: 40, relativeTo: .headline))
//                        .foregroundStyle(.white)
//                    
//                    Divider()
//                        .frame(width: 250, height: 3)
//                        .overlay(.white)
//                    
//                    VStack(alignment: .leading) {
//                        Text("New")
//                            .font(.custom("Helvetica.ttf", size: 25))
//                        
//                            .foregroundStyle(.white)
//                        
//                    }
//                    
//                    profileImageView(userImage: Image ("Leah"), textBox: "A Student signed your yearbook", imageSize: geo.size.width * 0.2)
//                       // .frame(width: geo.size.width * 0.3)
//                    
//                }
//                
//            }
//           // Image("grid")
//             //   .resizable()
//                //.scaledToFit()
//            //.scaledToFill()
//        }
//      }
//    }
//}
//
//struct NotificationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsView()
//    }
//}
















//
//  NotificationsView.swift
//  Superlatives
//
//  Created by Syeda Hussain on 5/24/24.
//

import SwiftUI

struct NotificationsView: View {
    var user: User // This user object is passed in from the parent view

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("NotificationBackground3")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Notifications")
                            .font(.custom("Helvetica.ttc", size: 40, relativeTo: .headline))
                            .foregroundColor(.white)

                        Divider()
                            .frame(width: 250, height: 3)
                            .overlay(Color.white)

                        VStack(alignment: .leading) {
                            Text("Hello, \(user.firstName)")
                                .font(.custom("Helvetica.ttf", size: 25))
                                .foregroundColor(.white)

                            Text("New Comments")
                                .font(.custom("Helvetica.ttf", size: 25))
                                .foregroundColor(.white)
                        }

                        ForEach(user.comments ?? [], id: \.self) { comment in
                            profileImageViewNotifications2(
                                userImageURL: comment.profilePicture, // Pass the URL directly
                                textBox: comment.comment,
                                imageSize: geo.size.width * 0.2
                            )
                            .padding(.vertical, 5)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct profileImageViewNotifications: View {
    let userImage: Image
    let textBox: String
    let imageSize: CGFloat

    var body: some View {
        HStack(alignment: .top) {
            userImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))

            Text(textBox)
                .font(.custom("Helvetica.ttc", size: 18, relativeTo: .body))
                .foregroundColor(.white)
                .padding(.leading, 10)
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.6))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(user: User.default)
    }
}


