//
//  headshots.swift
//  Yearbook
//
//  Created by Tommy Hailey on 5/25/24.
//
//import SwiftUI
//
//struct headshots: View {
//    @State private var user: User = User.load() ?? User.default
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack( spacing: -9) {
//                    Spacer()
//                    Text("CLASS OF 2024")
//                        .font(.custom("varsity", size: 50))
//                        .fontWeight(.bold)
//                        .foregroundColor(.bay)
//                    HStack {
//                        
//                        Spacer()
//                        Rectangle()
//                            .frame(width: 350, height: 3)
//                            .foregroundColor(.white)
//                        //.offset(y: -25)
//                        NavigationLink(destination: lookupbox()) {
//                            Image(systemName: "magnifyingglass")
//                                .font(.title2)
//                                .foregroundColor(.white) // Optional: change the color of the magnifying glass
//                        }
//                    }
//                }
//                    LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
//                                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
//                                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32)
//                                       ], spacing: 30, content: {
//                        ForEach(0..<9, id: \.self) { num in
//                            VStack( spacing: 5) {
//                                Spacer()
//                                    .frame(width: 120, height: 175)
//                                    .background(Color.black)
//                                    .overlay(
//                                        Rectangle()
//                                            .stroke(Color.white)
//                                    )
//                                NavigationLink(destination: UserProfileView(user: user)) {
//                                    Text("BREA PRYOR ") .font(.custom("varsity TEAM", size: 20))
//                                        .multilineTextAlignment(.center)
//                                        .foregroundColor(.white)
//                                }
//                                Text("UX/UI Design")
//                                    .font(.custom("CaviarDreams", size: 15))
//                                    .fontWeight(.semibold)
//                                //.frame(maxWidth: .infinity, alignment: .leading)
//                                    .frame(width: 109, height: 24)
//                                //.multilineTextAlignment(.center)
//                                    .background(Color.black)
//                                    .foregroundColor(.white)
//                                // .cornerRadius(4)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 4)
//                                            .stroke(Color.white)
//                                    )
//                                Text("PM ADA").font(.custom("CaviarDreams", size: 15))
//                                    .fontWeight(.semibold)
//                                //.frame(maxWidth: .infinity, alignment: .leading)
//                                    .frame(width: 109, height: 24)
//                                    .multilineTextAlignment(.center)
//                                    .background(Color.black)
//                                    .foregroundColor(.white)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 4)
//                                            .stroke(Color.white)
//                                    )
//                                
//                            }
//                            .padding()
//                            // .background(Color.red)
//                        }
//                        
//                    }).padding(.horizontal, 12)
//                }
//                .background(
//                    Image("splash")
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
//                )
//                
//            }
//        }
//        
//    }
//    
//struct HeadShots_Previews: PreviewProvider {
//    static var previews: some View {
//        headshots()
//    }
//}
    




//import SwiftUI
//
//struct headshots: View {
//    @State private var users: [User] = []
//    @State private var errorMessage: String?
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(spacing: -9) {
//                    Spacer()
//                    Text("CLASS OF 2024")
//                        .font(.custom("varsity", size: 50))
//                        .fontWeight(.bold)
//                        .foregroundColor(.bay)
//                    HStack {
//                        Spacer()
//                        Rectangle()
//                            .frame(width: 350, height: 3)
//                            .foregroundColor(.white)
//                        NavigationLink(destination: lookupbox()) {
//                            Image(systemName: "magnifyingglass")
//                                .font(.title2)
//                                .foregroundColor(.white) // Optional: change the color of the magnifying glass
//                        }
//                    }
//                }
//
//                if let errorMessage = errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .padding()
//                } else {
//                    LazyVGrid(columns: [
//                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
//                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
//                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32)
//                    ], spacing: 30) {
//                        ForEach(users) { user in
//                            VStack(spacing: 5) {
//                                Spacer()
//                                    .frame(width: 120, height: 175)
//                                    .background(Color.black)
//                                    .overlay(
//                                        Rectangle()
//                                            .stroke(Color.white)
//                                    )
//                                NavigationLink(destination: UserProfileView(user: user)) {
//                                    Text(user.firstName + " " + user.lastName)
//                                        .font(.custom("varsity TEAM", size: 20))
//                                        .multilineTextAlignment(.center)
//                                        .foregroundColor(.white)
//                                }
//                                Text(user.specialty)
//                                    .font(.custom("CaviarDreams", size: 15))
//                                    .fontWeight(.semibold)
//                                    .frame(width: 109, height: 24)
//                                    .background(Color.black)
//                                    .foregroundColor(.white)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 4)
//                                            .stroke(Color.white)
//                                    )
//                                Text("PM ADA")
//                                    .font(.custom("CaviarDreams", size: 15))
//                                    .fontWeight(.semibold)
//                                    .frame(width: 109, height: 24)
//                                    .multilineTextAlignment(.center)
//                                    .background(Color.black)
//                                    .foregroundColor(.white)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 4)
//                                            .stroke(Color.white)
//                                    )
//                            }
//                            .padding()
//                        }
//                    }
//                    .padding(.horizontal, 12)
//                }
//            }
//            .background(
//                Image("splash")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//            )
//            .onAppear {
//                HeadshotFunction.fetchRecentUsers { success, users in
//                    if success {
//                        self.users = users ?? []
//                    } else {
//                        self.errorMessage = "Failed to load users"
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct HeadShots_Previews: PreviewProvider {
//    static var previews: some View {
//        headshots()
//    }
//}







import SwiftUI

struct headshots: View {
    @State private var users: [User] = []
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: -9) {
                    Spacer()
                    Text("CLASS OF 2024")
                        .font(.custom("varsity", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.bay)
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 350, height: 3)
                            .foregroundColor(.white)
                        NavigationLink(destination: SearchView()) {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.white) // Optional: change the color of the magnifying glass
                        }
                    }
                }

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
                        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32)
                    ], spacing: 30) {
                        ForEach(users) { user in
                            VStack(spacing: 5) {
                                if let urlString = user.profilePicture, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 120, height: 175)
                                            .clipped()
                                            .background(Color.black)
                                            .overlay(
                                                Rectangle()
                                                    .stroke(Color.white)
                                            )
                                    } placeholder: {
                                        Color.black
                                            .frame(width: 120, height: 175)
                                            .overlay(
                                                Rectangle()
                                                    .stroke(Color.white)
                                            )
                                    }
                                } else {
                                    Color.black
                                        .frame(width: 120, height: 175)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white)
                                        )
                                }
                                NavigationLink(destination: UserProfileViewAlt(user: user)) {
                                    Text(user.firstName + " " + user.lastName)
                                        .font(.custom("varsity TEAM", size: 17))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white)
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    print("Selected user's email: \(user.email)")
                                })
                                Text(user.specialty)
                                    .font(.custom("CaviarDreams", size: 15))
                                    .fontWeight(.semibold)
                                    .frame(width: 109, height: 24)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.white)
                                    )
                                Text("PM ADA")
                                    .font(.custom("CaviarDreams", size: 15))
                                    .fontWeight(.semibold)
                                    .frame(width: 109, height: 24)
                                    .multilineTextAlignment(.center)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(Color.white)
                                    )
                            }
                            .padding()
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
            .background(
                Image("splash")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .onAppear {
                HeadshotFunction.fetchRecentUsers { success, users in
                    if success {
                        self.users = users ?? []
                    } else {
                        self.errorMessage = "Failed to load users"
                    }
                }
            }
        }
    }
}

struct HeadShots_Previews: PreviewProvider {
    static var previews: some View {
        headshots()
    }
}







