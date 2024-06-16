//import SwiftUI
//
//struct CommentsView: View {
//    @StateObject var viewModel: CommentsViewModel
//    @State private var commentText: String = ""
//
//    var body: some View {
//        ZStack {
//            Image("NotificationBackground3")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack {
//                Text("Comments")
//                    .font(.custom("Helvetica.ttc", size: 40, relativeTo: .headline))
//                    .foregroundColor(.white)
//
//                TextField("Enter your comment", text: $commentText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .frame(width: 350, height: 200) // Adjust width and height as needed
//                    .font(.custom("Helvetica.ttc", size: 20, relativeTo: .body)) // Adjust font size as needed
//
//                Button(action: {
//                    print("Button clicked..")
//                    viewModel.addComment(commentText)
//                    commentText = ""
//                }) {
//                    Text("Post Comment")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                List(viewModel.comments) { comment in
//                    HStack {
//                        if let url = URL(string: comment.profilePicture) {
//                            AsyncImage(url: url) { image in
//                                image.resizable()
//                                    .frame(width: 40, height: 40)
//                                    .clipShape(Circle())
//                            } placeholder: {
//                                Circle()
//                                    .fill(Color.gray)
//                                    .frame(width: 40, height: 40)
//                            }
//                        }
//                        Text(comment.comment)
//                    }
//                    .listRowBackground(Color.clear)
//                }
//                .background(Color.clear)
//                .scrollContentBackground(.hidden) // For iOS 16+
//                .onAppear {
//                    UITableView.appearance().backgroundColor = .clear // For iOS 15 and below
//                }
//
//                Spacer()
//            }
//            .padding()
//        }
//    }
//}
//
//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        if let currentUser = User.loadFromUserDefaults() {
//            // Assuming targetUser is passed from the parent view or determined elsewhere
//            let targetUser = User.default // Replace with actual target user
//            CommentsView(viewModel: CommentsViewModel(targetUser: targetUser, currentUser: currentUser))
//        } else {
//            Text("Error loading current user.")
//        }
//    }
//}
//
//







//import SwiftUI

//struct CommentsView: View {
//    @StateObject var viewModel: CommentsViewModel
//    @State private var commentText: String = ""
//
//    var body: some View {
//        ZStack {
//            Image("NotificationBackground3")
//                .resizable()
//                .ignoresSafeArea()
//
//            VStack {
//                Text("Comments")
//                    .font(.custom("Helvetica.ttc", size: 40, relativeTo: .headline))
//                    .foregroundColor(.white)
//
//                TextField("Enter your comment", text: $commentText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//
//                Button(action: {
//                    print("Button clicked..")
//                    viewModel.addComment(commentText)
//                    commentText = ""
//                }) {
//                    Text("Post Comment")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//                List(viewModel.comments) { comment in
//                    HStack {
//                        if let url = URL(string: comment.profilePicture) {
//                            AsyncImage(url: url) { image in
//                                image.resizable()
//                                    .frame(width: 40, height: 40)
//                                    .clipShape(Circle())
//                            } placeholder: {
//                                Circle()
//                                    .fill(Color.gray)
//                                    .frame(width: 40, height: 40)
//                            }
//                        }
//                        Text(comment.comment)
//
//                    }
//                }
//
//                Spacer()
//            }
//        }
//        .padding()
//    }
//}

//import SwiftUI
//
//struct CommentsView: View {
//    @StateObject var viewModel: CommentsViewModel
//    @State private var commentText: String = ""
//
//    var body: some View {
//        ZStack {
//            Image("NotificationBackground3")
//                .resizable()
//                .ignoresSafeArea()
//
//            VStack {
//                TextField("Enter your comment", text: $commentText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .foregroundColor(.black)
//
//
//                Button(action: {
//                    print("Button clicked..")
//                    // Assuming you have access to currentUser and targetUser within the ViewModel
//                    if let profilePictureURL = currentUser.profilePicture {
//                        print("Profile picture URL from currentUser: \(profilePictureURL)")
//
//                        viewModel.addComment(targetUserEmail: viewModel.targetUser.email, commentText: commentText, profilePictureURL: profilePictureURL) { success in
//                            if success {
//                                print("Comment posted successfully")
//                            } else {
//                                print("Failed to post comment")
//                            }
//                        }
//                    } else {
//                        print("No profile picture found for current user")
//                    }
//
//
//                    commentText = "" // Reset the text field after submitting
//                }) {
//                    Text("Post Comment")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
//
////                List(viewModel.comments) { comment in
////                    HStack {
////                        if let url = URL(string: comment.profilePicture) {
////                            AsyncImage(url: url) { image in
////                                image.resizable()
////                                    .frame(width: 40, height: 40)
////                                    .clipShape(Circle())
////                            } placeholder: {
////                                Circle()
////                                    .fill(Color.gray)
////                                    .frame(width: 40, height: 40)
////                            }
////                        }
////                        Text(comment.comment)
////                            .foregroundColor(.white)
////                            .padding()
////                            .background(Color.black)
////                            .cornerRadius(8)
////                    }
////                }
//
//                Spacer()
//            }
//        }
//        .padding()
//    }
//}
//
//
//
//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(viewModel: CommentsViewModel(targetUser: User.default, currentUser: User.default))
//    }
//}



//import SwiftUI
//
//struct CommentsView: View {
//    @StateObject var viewModel: CommentsViewModel
//    @State private var commentText: String = ""
//
//    var body: some View {
//        ZStack {
//            Image("NotificationBackground3")
//                .resizable()
//                .ignoresSafeArea()
//
//            VStack {
//                TextField("Enter your comment", text: $commentText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .foregroundColor(.black)
//
//                Button(action: {
//                    print("Button clicked..")
//                    // Access currentUser from viewModel
//                    if let profilePictureURL = viewModel.currentUser.profilePicture {
//                        print("Profile picture URL from currentUser: \(profilePictureURL)")
//                        print(viewModel.currentUser, ": VM Current User")
//
//                        viewModel.addComment(targetUserEmail: viewModel.targetUser.email, commentText: commentText, profilePictureURL: profilePictureURL) { success in
//                            if success {
//                                print("Comment posted successfully")
//                            } else {
//                                print("Failed to post comment")
//                            }
//                        }
//                    } else {
//                        print("No profile picture found for current user")
//                    }
//
//                    commentText = "" // Reset the text field after submitting
//                }) {
//                    Text("Post Comment")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
////                List(viewModel.comments) { comment in
////                    HStack {
////                        if let url = URL(string: comment.profilePicture) {
////                            AsyncImage(url: url) { image in
////                                image.resizable()
////                                    .frame(width: 40, height: 40)
////                                    .clipShape(Circle())
////                            } placeholder: {
////                                Circle()
////                                    .fill(Color.gray)
////                                    .frame(width: 40, height: 40)
////                            }
////                        }
////                        Text(comment.comment)
////                            .foregroundColor(.white)
////                            .padding()
////                            .background(Color.black)
////                            .cornerRadius(8)
////                    }
////                }
//
//                Spacer()
//            }
//        }
//        .padding()
//    }
//}
//
//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(viewModel: CommentsViewModel(targetUser: User.default, currentUser: User.default))
//    }
//}




//import SwiftUI
//
//struct CommentsView: View {
//    @StateObject var viewModel: CommentsViewModel
//    @State private var commentText: String = ""
//
//    var body: some View {
//        ZStack {
//            Image("NotificationBackground3")
//                .resizable()
//                .ignoresSafeArea()
//
//            VStack {
//                TextField("Enter your comment", text: $commentText)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .padding()
//                    .foregroundColor(.black)
//
//                Button(action: {
//                    print("Button clicked..")
//                    // Access currentUser from viewModel
//                    if let profilePictureURL = viewModel.currentUser.profilePicture {
//                        print("Profile picture URL from currentUser: \(profilePictureURL)")
//                        print(viewModel.currentUser, ": VM Current User")
//
//                        viewModel.addComment(targetUserEmail: viewModel.targetUser.email, commentText: commentText) { success in
//                            if success {
//                                print("Comment posted successfully")
//                            } else {
//                                print("Failed to post comment")
//                            }
//                        }
//                    } else {
//                        print("No profile picture found for current user")
//                    }
//
//                    commentText = "" // Reset the text field after submitting
//                }) {
//                    Text("Post Comment")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding()
//
////                List(viewModel.comments) { comment in
////                    HStack {
////                        if let url = URL(string: comment.profilePicture) {
////                            AsyncImage(url: url) { image in
////                                image.resizable()
////                                    .frame(width: 40, height: 40)
////                                    .clipShape(Circle())
////                            } placeholder: {
////                                Circle()
////                                    .fill(Color.gray)
////                                    .frame(width: 40, height: 40)
////                            }
////                        }
////                        Text(comment.comment)
////                            .foregroundColor(.white)
////                            .padding()
////                            .background(Color.black)
////                            .cornerRadius(8)
////                    }
////                }
//
//                Spacer()
//            }
//        }
//        .padding()
//    }
//}
//
//struct CommentsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView(viewModel: CommentsViewModel(targetUser: User.default))
//    }
//}













import SwiftUI
import Combine

struct CommentsView: View {
    @StateObject var viewModel: CommentsViewModel
    @State private var commentText: String = ""
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Image("NotificationBackground3")
                .resizable()
                .ignoresSafeArea()

            VStack {
                TextField("Enter your comment", text: $commentText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(.black)

                Button(action: {
                    print("Button clicked..")
                    // Access currentUser from viewModel
                    if let profilePictureURL = viewModel.currentUser.profilePicture {
                        print("Profile picture URL from currentUser: \(profilePictureURL)")
                        print(viewModel.currentUser, ": VM Current User")

                        viewModel.addComment(targetUserEmail: viewModel.targetUser.email, commentText: commentText) { success in
                            if success {
                                print("Comment posted successfully")
                                showAlert = true
                                viewModel.fetchUserComments() // Fetch comments after adding a new one
                            } else {
                                print("Failed to post comment")
                            }
                        }
                    } else {
                        print("No profile picture found for current user")
                    }

                    commentText = "" // Reset the text field after submitting
                }) {
                    Text("Post Comment")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Success"), message: Text("Comment posted successfully"), dismissButton: .default(Text("OK")))
                }

//                List(viewModel.comments) { comment in
//                    HStack {
//                        if let url = URL(string: comment.profilePicture) {
//                            AsyncImage(url: url) { image in
//                                image.resizable()
//                                    .frame(width: 40, height: 40)
//                                    .clipShape(Circle())
//                            } placeholder: {
//                                Circle()
//                                    .fill(Color.gray)
//                                    .frame(width: 40, height: 40)
//                            }
//                        }
//                        Text(comment.comment)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.black)
//                            .cornerRadius(8)
//                    }
//                }

                Spacer()
            }
        }
        .padding()
        .onReceive(viewModel.commentAdded) { _ in
            showAlert = true
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(viewModel: CommentsViewModel(targetUser: User.default))
    }
}
