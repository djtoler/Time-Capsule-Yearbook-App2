//import SwiftUI
//
//struct NotificationsView2: View {
//    var user: User // This user object is passed in from the parent view
//
//    var body: some View {
//        GeometryReader { geo in
//            ZStack {
//                Image("NotificationBackground3")
//                    .resizable()
//                    .ignoresSafeArea()
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        VStack(alignment: .leading) {
//
//                            Text("New Comments")
//                                .font(.custom("Helvetica.ttf", size: 25))
//                                .foregroundColor(.white)
//                        }
//
//                        ForEach(user.comments ?? [], id: \.self) { comment in
//                            profileImageViewNotifications(userImage: Image("Leah"), textBox: comment, imageSize: geo.size.width * 0.2)
//                                .padding(.vertical, 5)
//                        }
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//}
//
//struct profileImageViewNotifications2: View {
//    let userImage: Image
//    let textBox: String
//    let imageSize: CGFloat
//
//    var body: some View {
//        HStack(alignment: .top) {
//            userImage
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: imageSize, height: imageSize)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 2))
//
//            Text(textBox)
//                .font(.custom("Helvetica.ttc", size: 18, relativeTo: .body))
//                .foregroundColor(.white)
//                .padding(.leading, 10)
//                .padding(.vertical, 10)
//                .background(Color.gray.opacity(0.6))
//                .cornerRadius(10)
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct NotificationsView_Previews2: PreviewProvider {
//    static var previews: some View {
//        NotificationsView2(user: User.default) // This is for preview purposes
//    }
//}









//import SwiftUI
//
//struct NotificationsView2: View {
//    var user: User // This user object is passed in from the parent view
//
//    var body: some View {
//        GeometryReader { geo in
//            ZStack {
//                Image("NotificationBackground3")
//                    .resizable()
//                    .ignoresSafeArea()
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        VStack(alignment: .leading) {
//                            Text("New Comments")
//                                .font(.custom("Helvetica.ttf", size: 25))
//                                .foregroundColor(.white)
//                        }
//
//                        ForEach(user.comments ?? [], id: \.self) { comment in
//                            profileImageViewNotifications2(userImage: Image("Leah"), textBox: comment, imageSize: geo.size.width * 0.2)
//                                .padding(.vertical, 5)
//                        }
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//}
//
//struct profileImageViewNotifications2: View {
//    let userImage: Image
//    let textBox: String
//    let imageSize: CGFloat
//
//    var body: some View {
//        HStack(alignment: .top) {
//            userImage
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: imageSize, height: imageSize)
//                .clipShape(Circle())
//                .overlay(Circle().stroke(Color.white, lineWidth: 2))
//
//            Text(textBox)
//                .font(.custom("Helvetica.ttc", size: 18, relativeTo: .body))
//                .foregroundColor(.white)
//                .padding(.leading, 10)
//                .padding(.vertical, 10)
//                .background(Color.gray.opacity(0.6))
//                .cornerRadius(10)
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct NotificationsView_Previews2: PreviewProvider {
//    static var previews: some View {
//        NotificationsView2(user: User.default) // Use the example user for preview
//    }
//}










//import SwiftUI
//
//struct NotificationsView2: View {
//    var user: User // This user object is passed in from the parent view
//
//    var body: some View {
//        GeometryReader { geo in
//            ZStack {
//                Color.red // Background color for debugging
//                Image("NotificationBackground3")
//                    .resizable()
//                    .ignoresSafeArea()
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        VStack(alignment: .leading) {
//                            Text("Notifications")
//                                .font(.custom("Helvetica.ttc", size: 40, relativeTo: .headline))
//                                .foregroundStyle(.white)
//                                .padding(.leading, 20) // Move to the right
//                            
//                            Divider()
//                                .frame(width: 250, height: 3)
//                                .overlay(.white)
//                                .padding(.leading, 20) // Move to the right
//                            
//                            VStack(alignment: .leading) {
//                                Text("New")
//                                    .font(.custom("Helvetica.ttf", size: 25))
//                                    .foregroundStyle(.white)
//                                    .padding(.leading, 20) // Move to the right
//                            }
//                        }
//
//                        ForEach(user.comments ?? [], id: \.self) { comment in
//                            profileImageViewNotifications2(
//                                userImageURL: comment.profilePicture,
//                                textBox: comment.comment,
//                                imageSize: geo.size.width * 0.2
//                            )
//                            .padding(.vertical, 5)
//                            .padding(.leading, 10) // Move to the right
//                        }
//                    }
//                    .padding()
//                }
//            }
//        }
//        .background(Color.blue) // Background color for debugging
//    }
//}
//
//
//struct profileImageViewNotifications2: View {
//    let userImageURL: String
//    let textBox: String
//    let imageSize: CGFloat
//
//    var body: some View {
//        HStack(alignment: .top) {
//            if let url = URL(string: userImageURL) {
//                AsyncImage(url: url) { phase in
//                    switch phase {
//                    case .empty:
//                        ProgressView()
//                            .frame(width: imageSize, height: imageSize)
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
//                            .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.blueish, lineWidth: 3))
//                    case .failure:
//                        Image(systemName: "person.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
//                            .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                    @unknown default:
//                        Image(systemName: "person.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
//                            .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                    }
//                }
//            } else {
//                Image(systemName: "person.fill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
//                    .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
//            }
//
//            Text(textBox)
//                .font(.custom("Helvetica.ttc", size: 16, relativeTo: .subheadline))
//                .foregroundColor(.white)
//                .padding()
//                .background {
//                    RoundedRectangle(cornerRadius: 5)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                        .shadow(color: .blueish, radius: 0.2)
//                }
//        }
//        .padding(.horizontal)
//    }
//}
//
//struct NotificationsView_Previews2: PreviewProvider {
//    static var previews: some View {
//        NotificationsView2(user: User.default) // Use the example user for preview
//    }
//}





import SwiftUI

struct NotificationsView2: View {
    var user: User // This user object is passed in from the parent view

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.red // Background color for debugging
                Image("NotificationBackground3")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Notifications")
                                .font(.custom("Helvetica.ttc", size: 40, relativeTo: .headline))
                                .foregroundStyle(.white)
                                .padding(.leading, 20) // Move to the right
                            
                            Divider()
                                .frame(width: 250, height: 3)
                                .overlay(.white)
                                .padding(.leading, 20) // Move to the right
                            
                            VStack(alignment: .leading) {
                                Text("New")
                                    .font(.custom("Helvetica.ttf", size: 25))
                                    .foregroundStyle(.white)
                                    .padding(.leading, 20) // Move to the right
                            }
                        }

                        ForEach(user.comments ?? [], id: \.self) { comment in
                            profileImageViewNotifications2(
                                userImageURL: comment.profilePicture,
                                textBox: comment.comment,
                                imageSize: geo.size.width * 0.2
                            )
                            .padding(.vertical, 5)
                            .padding(.leading, 10) // Move to the right
                        }
                    }
                    .padding()
                }
            }
        }
        .background(Color.blue) // Background color for debugging
    }
}

struct profileImageViewNotifications2: View {
    let userImageURL: String
    let textBox: String
    let imageSize: CGFloat

    var body: some View {
        HStack(alignment: .top) {
            if let url = URL(string: userImageURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
                            .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.blueish, lineWidth: 3))
                    case .failure:
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
                            .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    @unknown default:
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
                            .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    }
                }
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Ensuring the image fills the circle
                    .frame(width: imageSize, height: imageSize) // Ensuring consistent frame size
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            }

            Text(textBox)
                .font(.custom("Helvetica.ttc", size: 12, relativeTo: .subheadline))
                .foregroundColor(.white)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 5)
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
        .padding(.horizontal)
    }
}

struct NotificationsView_Previews2: PreviewProvider {
    static var previews: some View {
        NotificationsView2(user: User.default) // Use the example user for preview
    }
}
