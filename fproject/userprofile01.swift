////import SwiftUI
////import Foundation
////
////struct UserProfileView: View {
////    @EnvironmentObject var sessionManager: UserSessionManager
////    var user: User
////    var onLogout: () -> Void
////    @State private var selectedImages: [UIImage] = []
////    
////    var body: some View {
////        ScrollView {
////            VStack {
////                HeaderView(user:user)
////                SimpleViewController2()
////                Button("Upload Images") {
////                    let imageUploader = ImageUploader()
////                    imageUploader.uploadImages(selectedImages)
////                }
////                LinksAndMemoryView()
////                commentbox()
////                LogoutButtonView()
////                    .padding(.top, 50)
////            }
////        }
////    }
////}
////
////struct UserProfileView_Previews: PreviewProvider {
////    static var previews: some View {
////        UserProfileView(user: User(email: "example@email.com", firstName: "John", lastName: "Doe", specialty: "iOS Development", accessCode: "12345", image01: "https://example.com/defaultprofile", image02: "https://example.com/defaultprofile", image03: "https://example.com/defaultprofile", image04: "https://example.com/defaultprofile", image05: "https://example.com/defaultprofile", image06: "https://example.com/dfp", image07: "https://example.com/dfp", image08: "https://example.com/dfp", profilePicture: "https://example.com/defaultprofile",
////            link01: "https://example.com/defaultprofile",
////            link02: "https://example.com/defaultprofile"),
////        onLogout: {
////            print("Logout tapped in preview")
////        })
////    }
////}
////
////
//
////
////import SwiftUI
////
////struct UserProfileView: View {
////    @EnvironmentObject var sessionManager: UserSessionManager
////    var onLogout: () -> Void
////    @State private var selectedImages: [UIImage] = []
////    
////    var body: some View {
////        ScrollView {
////            VStack {
////                if let user = sessionManager.user {
////                    HeaderView(user: user)
////                    SimpleViewController2()
////                    Button("Upload Images") {
////                        let imageUploader = ImageUploader()
////                        imageUploader.uploadImages(selectedImages)
////                    }
////                    LinksAndMemoryView()
////                    commentbox()
////                    LogoutButtonView(onLogout: onLogout)
////                        .padding(.top, 50)
////                } else {
////                    Text("Not logged in.")
////                }
////            }
////        }
////    }
////}
////
////struct UserProfileView_Previews: PreviewProvider {
////    static var previews: some View {
////        UserProfileView(onLogout: {
////            print("Logout tapped in preview")
////        })
////        .environmentObject(UserSessionManager.previewLoggedIn()) // Assuming you have a mock function for previews
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
////import SwiftUI
////import Foundation
////
////struct UserProfileView: View {
////    var user: User
////    var onLogout: () -> Void
////    @State private var selectedImages: [UIImage] = []
////    
////    var body: some View {
////        ScrollView {
////            VStack {
////                HeaderView(user: user)
////                SimpleViewController2()
////                Button("Upload Images") {
////                    let imageUploader = ImageUploader()
////                    imageUploader.uploadImages(selectedImages)
////                }
////                LinksAndMemoryView()
////                commentbox()
////                LogoutButtonView(onLogout: onLogout)
////                    .padding(.top, 50)
////            }
////        }
////    }
////}
////
////struct UserProfileView_Previews: PreviewProvider {
////    static var previews: some View {
////        UserProfileView(user: User(email: "example@email.com", firstName: "John", lastName: "Doe", specialty: "iOS Development", accessCode: "12345", image01: "https://example.com/defaultprofile", image02: "https://example.com/defaultprofile", image03: "https://example.com/defaultprofile", image04: "https://example.com/defaultprofile", image05: "https://example.com/defaultprofile", image06: "https://example.com/dfp", image07: "https://example.com/dfp", image08: "https://example.com/dfp", profilePicture: "https://example.com/defaultprofile",
////            link01: "https://example.com/defaultprofile",
////            link02: "https://example.com/defaultprofile"),
////        onLogout: {
////            print("Logout tapped in preview")
////        })
////    }
////}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//import SwiftUI
//import UIKit
//
//struct UserProfileView1: View {
////    @EnvironmentObject var sessionManager: UserSessionManager
//    @State private var image01: UIImage?
//    @State private var image02: UIImage?
//    @State private var image03: UIImage?
//    @State private var image04: UIImage?
//    @State private var image05: UIImage?
//    @State private var image06: UIImage?
//    @State private var imagePickerShowing = false
//    @State private var activeImageSelection: Int?
//    @State private var showWebView = false
//    @State private var urlToOpen: URL?
//
//    var user: User
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                
//                // nav bar
//                HStack {
//                   // Image(systemName: "chevron.left")
//                        //.font(.title2)
//                    
//                    VStack(alignment: .leading) {
//                        Text("\(user.firstName) \(user.lastName)")
//                            .font(.custom("caviarDreams", size: 35))
//                            .fontWeight(.semibold)
//                            .font(.system(size: 32))
//                            .foregroundColor(.white)
//                           
//                        Text("\(user.specialty)")
//                            .font(.custom("caviarDreams", size: 20))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                        HStack {
//                            VStack {
//                                Spacer()
//                                Text("MEMORIES")
//                                    .font(.custom("varsity", size: 45))
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.bay)
//                                Rectangle()
//                                    .frame(height: 5)
//                                    .foregroundColor(.white)
//                                    .offset(y: -25)
//                                Spacer()
//                            }
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                        AsyncImage(url: url) { image in
//                            image.resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 81, height: 79)
//                                .clipShape(Circle())
//                                .clipped()
//                        } placeholder: {
//                            Circle()
//                                .fill(Color.gray)
//                                .frame(width: 81, height: 79)
//                        }
//                    } else {
//                        Circle()
//                            .fill(Color.gray)
//                            .frame(width: 81, height: 79)
//                    }
//
//
//                }
//                .padding()
//                
////########################################################
//                
//                // difframe section
////                VStack {
////                    
////                    HStack {
////                        Spacer()
////                        
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 162, height: 314)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                        )
////                            .offset(y: -29)
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 198, height: 174)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                        )
////                            .offset(y: -98) // Move blue square up
////                        
////                        Spacer()
////                    }
////                    
////                    HStack {
////                        Spacer()
////                        
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 162, height: 267)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                        )
////                            .offset(y: -30) // Adjusted offset for green square
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 198, height: 250)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                        )
////                            .offset(y: -176) // Adjusted offset for orange square
////                        Spacer()
////                    }
////                    
////                    HStack {
////                        Spacer()
////                        
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 162, height: 193)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                        )
////                            .offset(y: -107) // Move purple square down
////                        
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 198, height: 345)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                        )
////                            .offset(y: -183)
////                        Spacer()
////                    }
////                }
////                .padding()
//                
//                
////#######################################
////                VStack {
////                    HStack {
////                        Spacer()
////                        Image(uiImage: image01 ?? UIImage())
////                            .resizable()
////                            .frame(width: 162, height: 314)
////                            .background(Color.black)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white, lineWidth: 3)
////                            )
//////                            .offset(y: -29)
////                            .onTapGesture {
////                                self.activeImageSelection = 1
////                                self.imagePickerShowing = true
////                            }
////                        Image(uiImage: image02 ?? UIImage())
////                            .resizable()
////                            .frame(width: 198, height: 174)
////                            .background(Color.black)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white, lineWidth: 3)
////                            )
////                            .offset(y: -68)
////                            .onTapGesture {
////                                self.activeImageSelection = 2
////                                self.imagePickerShowing = true
////                            }
////                        Spacer()
////                    }
////                    HStack {
////                        Spacer()
////                        
////                        Image(uiImage: image03 ?? UIImage())
////                            .resizable()
////                            .frame(width: 162, height: 267)
////                            .background(Color.black)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white, lineWidth: 3)
////                            )
////        
////                            .onTapGesture {
////                                self.activeImageSelection = 3
////                                self.imagePickerShowing = true
////                            }
////                        
////                        Image(uiImage: image04 ?? UIImage())
////                            .resizable()
////                            .frame(width: 198, height: 250)
////                            .background(Color.black)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white, lineWidth: 3)
////                            )
////                            .offset(y: -176)
////                            .onTapGesture {
////                                self.activeImageSelection = 4
////                                self.imagePickerShowing = true
////                            }
////                        Spacer()
////                    }
////                    HStack {
////                        Image(uiImage: image05 ?? UIImage()) // Reusing image03 for demonstration, replace with another state if needed
////                            .resizable()
////                            .frame(width: 162, height: 193)
////                            .background(Color.black)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white, lineWidth: 3)
////                            )
////                            .offset(y: -107)
////                            .onTapGesture {
////                                self.activeImageSelection = 5 // This would typically be a new state variable for a different image
////                                self.imagePickerShowing = true
////                            }
////                        
////                        Image(uiImage: image06 ?? UIImage()) // Reusing image04 for demonstration, replace with another state if needed
////                            .resizable()
////                            .frame(width: 198, height: 345)
////                            .background(Color.black)
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white, lineWidth: 3)
////                            )
////                            .offset(y: -183)
////                            .onTapGesture {
////                                self.activeImageSelection = 6 // This would typically be a new state variable for a different image
////                                self.imagePickerShowing = true
////                            }
////                    }
////                }
//                
//                VStack {
//                    HStack {
//                        Spacer()
//                        Image(uiImage: image01 ?? UIImage(named: "addimage")!)
//                            .resizable()
//                            .frame(width: 162, height: 314)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .onTapGesture {
//                                self.activeImageSelection = 1
//                                self.imagePickerShowing = true
//                            }
//                        Image(uiImage: image02 ?? UIImage(named: "addimage12")!)
//                            .resizable()
//                            .frame(width: 198, height: 174)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -68)
//                            .onTapGesture {
//                                self.activeImageSelection = 2
//                                self.imagePickerShowing = true
//                            }
//                        Spacer()
//                    }
//                    HStack {
//                        Spacer()
//                        Image(uiImage: image03 ?? UIImage(named: "addimage4")!)
//                            .resizable()
//                            .frame(width: 162, height: 267)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .onTapGesture {
//                                self.activeImageSelection = 3
//                                self.imagePickerShowing = true
//                            }
//                        Image(uiImage: image04 ?? UIImage(named: "addimage8")!)
//                            .resizable()
//                            .frame(width: 198, height: 250)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -176)
//                            .onTapGesture {
//                                self.activeImageSelection = 4
//                                self.imagePickerShowing = true
//                            }
//                        Spacer()
//                    }
//                    HStack {
//                        Image(uiImage: image05 ?? UIImage(named: "addimage2")!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 162, height: 193)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -107)
//                            .onTapGesture {
//                                self.activeImageSelection = 5
//                                self.imagePickerShowing = true
//                            }
//                        Image(uiImage: image06 ?? UIImage(named: "addimage")!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 198, height: 345)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -183)
//                            .onTapGesture {
//                                self.activeImageSelection = 6
//                                self.imagePickerShowing = true
//                            }
//                    }
//                    .padding(.bottom, -150)
//                }
//
////#######################################
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("LINKS")
//                        .font(.custom("varsity", size: 45))
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.bay)
//                    Rectangle()
//                        .frame(width: 140, height: 5)
//                        .foregroundColor(.white)
//                        .offset(y: -23)
//
////                    HStack {
////                        Image(systemName: "link")
////                        Button(action: {
////                            if let urlString = user.link01, let url = URL(string: urlString) {
////                                urlToOpen = url
////                                showWebView = true
////                                print(urlString)
////                                print(user.link01 as Any)
////                            } else {
////                                print("Invalid URL: \(user.link01 ?? "nil")")
////                            }
////                        }) {
////                            Text("Portfolio")
////                                .font(.custom("Helvetica", size: 12))
////                                .fontWeight(.semibold)
////                        }
////                    }
////                    .frame(maxWidth: .infinity, alignment: .leading)
////                    .frame(width: 352, height: 34)
////                    .multilineTextAlignment(.center)
////                    .background(Color.white)
////                    .foregroundColor(.black)
////                    .cornerRadius(4)
//
//
//                    HStack {
//                        Image(systemName: "link")
//                        Button(action: {
//                            showWebView = true
//                        }) {
//                            Text("Portfolio")
//                                .font(.custom("Helvetica", size: 12))
//                                .fontWeight(.semibold)
//                        }
//                        .sheet(isPresented: $showWebView) {
//                            if let urlString = user.link01, let url = URL(string: urlString) {
//                                WebView(url: url)
//                            } else {
//                                Text("Invalid URL") // Display an error message or alternative view if the URL is not valid
//                            }
//                        }
//
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .frame(width: 352, height: 34)
//                    .multilineTextAlignment(.center)
//                    .background(Color.white)
//                    .foregroundColor(.black)
//                    .cornerRadius(4)
//                    
//                    
//                    HStack {
//                        Image(systemName: "link")
//                        Button(action: {
//                            showWebView = true
//                        }) {
//                            Text("GitHub")
//                                .font(.custom("Helvetica", size: 12))
//                                .fontWeight(.semibold)
//                        }
//                        .sheet(isPresented: $showWebView) {
//                            if let urlString = user.link02, let url = URL(string: urlString) {
//                                WebView(url: url)
//                            } else {
//                                Text("Invalid URL")
//                            }
//                        }
//
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .frame(width: 352, height: 34)
//                    .multilineTextAlignment(.center)
//                    .background(Color.white)
//                    .foregroundColor(.black)
//                    .cornerRadius(4)
//
//
////                    HStack {
////                        Image(systemName: "link")
////                        Text("Github")
////                            .font(.custom("Helvetica", size: 12))
////                            .fontWeight(.semibold)
////                    }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                    
//                    Text("SHARE A MEMORY")
//                        .font(.custom("varsity", size: 40))
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.bay)
//                    Rectangle()
//                        .frame(width: 340, height: 5)
//                        .foregroundColor(.white)
//                        .offset(y: -20)
//                }
//                .padding(30)
//                
//                commentbox()
////                TabView2()
//            }
//            .background(
//                Image("splash")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//            )
//                
//        }
//        .background(Color.black)
//         .sheet(isPresented: $imagePickerShowing) {
//             ImagePicker(selectedImage: self.$activeImageSelection, images: [1: $image01, 2: $image02, 3: $image03, 4: $image04, 5: $image05, 6: $image06])
//            }
//         .sheet(isPresented: $showWebView) {
//             if let urlToOpen = urlToOpen {
//                 WebView(url: urlToOpen)
//             }
//         }
//
//    }
//    
//}
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Binding var selectedImage: Int?
//    var images: [Int: Binding<UIImage?>]
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .photoLibrary
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        var parent: ImagePicker
//
//        init(_ parent: ImagePicker) {
//            self.parent = parent
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                if let selectedImage = parent.selectedImage {
//                    self.parent.images[selectedImage]?.wrappedValue = image
//                }
//            }
//            picker.dismiss(animated: true)
//        }
//    }
//}
//
//struct UserProfileView_Previews1: PreviewProvider {
//    static var previews: some View {
//        // Attempt to load user data from UserDefaults
//        if let user = User.load() {
//            UserProfileView1(user: user)
//        } else {
//            // If no user is found, use the default user
//            UserProfileView1(user: User.default)
//        }
//    }
//}
