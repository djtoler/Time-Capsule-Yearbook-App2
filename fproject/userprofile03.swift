//import SwiftUI
//
//struct SimpleViewController2: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
//    @State private var image01: UIImage?
//    @State private var image02: UIImage?
//    @State private var image03: UIImage?
//    @State private var image04: UIImage?
//    @State private var image05: UIImage?
//    @State private var image06: UIImage?
//    @State private var imagePickerShowing = false
//    @State private var activeImageSelection: Int?
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                HStack {
//                    Spacer()
//                    Image(uiImage: image01 ?? UIImage())
//                        .resizable()
//                        .frame(width: 162, height: 314)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//            //                            .offset(y: -29)
//                        .onTapGesture {
//                            self.activeImageSelection = 1
//                            self.imagePickerShowing = true
//                        }
//                    Image(uiImage: image02 ?? UIImage())
//                        .resizable()
//                        .frame(width: 198, height: 174)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .offset(y: -68)
//                        .onTapGesture {
//                            self.activeImageSelection = 2
//                            self.imagePickerShowing = true
//                        }
//                    Spacer()
//                }
//                HStack {
//                    Spacer()
//                    
//                    Image(uiImage: image03 ?? UIImage())
//                        .resizable()
//                        .frame(width: 162, height: 267)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//
//                        .onTapGesture {
//                            self.activeImageSelection = 3
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Image(uiImage: image04 ?? UIImage())
//                        .resizable()
//                        .frame(width: 198, height: 250)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .offset(y: -176)
//                        .onTapGesture {
//                            self.activeImageSelection = 4
//                            self.imagePickerShowing = true
//                        }
//                    Spacer()
//                }
//                HStack {
//                    Image(uiImage: image05 ?? UIImage()) // Reusing image03 for demonstration, replace with another state if needed
//                        .resizable()
//                        .frame(width: 162, height: 193)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .offset(y: -107)
//                        .onTapGesture {
//                            self.activeImageSelection = 5 // This would typically be a new state variable for a different image
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Image(uiImage: image06 ?? UIImage()) // Reusing image04 for demonstration, replace with another state if needed
//                        .resizable()
//                        .frame(width: 198, height: 345)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .offset(y: -183)
//                        .onTapGesture {
//                            self.activeImageSelection = 6 // This would typically be a new state variable for a different image
//                            self.imagePickerShowing = true
//                        }
//                }
//            }
//        }
//        .sheet(isPresented: $imagePickerShowing) {
//            ImagePicker(selectedImage: self.$activeImageSelection, images: [1: $image01, 2: $image02, 3: $image03, 4: $image04, 5: $image05, 6: $image06])
//        }
//    }
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
//struct SimpleViewController_Previews2: PreviewProvider {
//    static var previews: some View {
//        SimpleViewController2()
//    }
//}
//
//
//






















//import SwiftUI
//
//struct SimpleViewController2: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
//    @State private var image01: UIImage?
//    @State private var image02: UIImage?
//    @State private var image03: UIImage?
//    @State private var image04: UIImage?
//    @State private var image05: UIImage?
//    @State private var image06: UIImage?
//    @State private var imagePickerShowing = false
//    @State private var activeImageSelection: Int?
//
//    var body: some View {
//        ScrollView {
//            VStack {
//                HStack {
//                    Spacer()
//                    
//                    Image(uiImage: image01 ?? UIImage())
//                        .resizable()
//                        .frame(width: 162, height: 314)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .onTapGesture {
//                            self.activeImageSelection = 1
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Image(uiImage: image02 ?? UIImage())
//                        .resizable()
//                        .frame(width: 198, height: 174)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .onTapGesture {
//                            self.activeImageSelection = 2
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Spacer()
//                }
//                
//                HStack {
//                    Spacer()
//                    
//                    Image(uiImage: image03 ?? UIImage())
//                        .resizable()
//                        .frame(width: 162, height: 267)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .onTapGesture {
//                            self.activeImageSelection = 3
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Image(uiImage: image04 ?? UIImage())
//                        .resizable()
//                        .frame(width: 198, height: 250)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .onTapGesture {
//                            self.activeImageSelection = 4
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Spacer()
//                }
//                
//                HStack {
//                    Spacer()
//                    
//                    Image(uiImage: image05 ?? UIImage()) // Reusing image03 for demonstration, replace with another state if needed
//                        .resizable()
//                        .frame(width: 162, height: 193)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .onTapGesture {
//                            self.activeImageSelection = 5 // This would typically be a new state variable for a different image
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Image(uiImage: image06 ?? UIImage()) // Reusing image04 for demonstration, replace with another state if needed
//                        .resizable()
//                        .frame(width: 198, height: 345)
//                        .background(Color.black)
//                        .overlay(
//                            Rectangle()
//                                .stroke(Color.white, lineWidth: 3)
//                        )
//                        .onTapGesture {
//                            self.activeImageSelection = 6 // This would typically be a new state variable for a different image
//                            self.imagePickerShowing = true
//                        }
//                    
//                    Spacer()
//                }
//            }
//        }
//        .sheet(isPresented: $imagePickerShowing) {
//            ImagePicker(selectedImage: self.$activeImageSelection, images: [1: $image01, 2: $image02, 3: $image03, 4: $image04, 5: $image05, 6: $image06])
//        }
//    }
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
//struct SimpleViewController_Previews2: PreviewProvider {
//    static var previews: some View {
//        SimpleViewController2()
//    }
//}
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
////                VStack {
////                    HStack {
////                        Spacer()
////
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 162, height: 314)
////                            .background( // Set image background
////                                AsyncImage(url: URL(string: user.image01)) { image in
////                                    image.resizable()
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .clipShape(Rectangle())
////                            )
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                            )
////                            .offset(y: -29)
////
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 198, height: 174)
////                            .background(
////                                AsyncImage(url: URL(string: user.image02)) { image in
////                                    image.resizable()
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .clipShape(Rectangle())
////                            )
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                            )
////                            .offset(y: -98)
////                        Spacer()
////                    }
////
////                    HStack {
////                        Spacer()
////
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 162, height: 267)
////                            .background(
////                                AsyncImage(url: URL(string: user.image03)) { image in
////                                    image.resizable()
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .clipShape(Rectangle())
////                            )
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                            )
////                            .offset(y: -30)
////
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 198, height: 250)
////                            .background(
////                                AsyncImage(url: URL(string: user.image04)) { image in
////                                    image.resizable()
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .clipShape(Rectangle())
////                            )
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                            )
////                            .offset(y: -176)
////                        Spacer()
////                    }
////
////                    HStack {
////                        Spacer()
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 162, height: 193)
////                            .background(
////                                AsyncImage(url: URL(string: user.image03)) { image in
////                                    image.resizable()
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .clipShape(Rectangle())
////                            )
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                            )
////                            .offset(y: -107)
////
////                        Rectangle()
////                            .fill(Color.black)
////                            .frame(width: 198, height: 345)
////                            .background( // Set image background
////                                AsyncImage(url: URL(string: user.image04)) { image in
////                                    image.resizable()
////                                } placeholder: {
////                                    ProgressView()
////                                }
////                                .clipShape(Rectangle())
////                            )
////                            .overlay(
////                                Rectangle()
////                                    .stroke(Color.white)
////                            )
////                            .offset(y: -183)
////                        Spacer()
////                    }
////
////                }
