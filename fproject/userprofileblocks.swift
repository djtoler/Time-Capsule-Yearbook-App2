//import SwiftUI
//
//struct ImageLayoutView: View {
//    var user: User
//
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 162, height: 314)
//                    .background(
//                        AsyncImage(url: URL(string: user.image01)) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Rectangle())
//                    )
//                    .overlay(
//                        Rectangle()
//                            .stroke(Color.white)
//                    )
//                    .offset(y: -29)
//
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 198, height: 174)
//                    .background(
//                        AsyncImage(url: URL(string: user.image02)) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Rectangle())
//                    )
//                    .overlay(
//                        Rectangle()
//                            .stroke(Color.white)
//                    )
//                    .offset(y: -98)
//                Spacer()
//            }
//
//            HStack {
//                Spacer()
//
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 162, height: 267)
//                    .background(
//                        AsyncImage(url: URL(string: user.image03)) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Rectangle())
//                    )
//                    .overlay(
//                        Rectangle()
//                            .stroke(Color.white)
//                    )
//                    .offset(y: -30)
//
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 198, height: 250)
//                    .background(
//                        AsyncImage(url: URL(string: user.image04)) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Rectangle())
//                    )
//                    .overlay(
//                        Rectangle()
//                            .stroke(Color.white)
//                    )
//                    .offset(y: -176)
//                Spacer()
//            }
//            
//            HStack {
//                Spacer()
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 162, height: 193)
//                    .background(
//                        AsyncImage(url: URL(string: user.image03)) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Rectangle())
//                    )
//                    .overlay(
//                        Rectangle()
//                            .stroke(Color.white)
//                    )
//                    .offset(y: -107)
//
//                Rectangle()
//                    .fill(Color.black)
//                    .frame(width: 198, height: 345)
//                    .background( // Set image background
//                        AsyncImage(url: URL(string: user.image04)) { image in
//                            image.resizable()
//                        } placeholder: {
//                            ProgressView()
//                        }
//                        .clipShape(Rectangle())
//                    )
//                    .overlay(
//                        Rectangle()
//                            .stroke(Color.white)
//                    )
//                    .offset(y: -183)
//                Spacer()
//            }
//            
//        }
//    }
//}
//
//// Add preview support for your SwiftUI canvas
//struct ImageLayoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageLayoutView(user: User(email: "example@email.com", firstName: "John", lastName: "Doe", specialty: "iOS Development", accessCode: "12345", image01: "https://example.com/image01.jpg", image02: "https://example.com/image02.jpg", image03: "https://example.com/image03.jpg", image04: "https://example.com/image04.jpg", image05: "https://example.com/image05.jpg", image06: "https://example.com/image06.jpg", image07: "https://example.com/image07.jpg", image08: "https://example.com/image08.jpg", profilePicture: "https://example.com/image08.jpg"
//            
//                                  ))
//    }
//}
//
