import SwiftUI

struct Headshots: View {
    @State private var users: [User] = []
    @State private var errorMessage: String?
    @State private var isRefreshing = false

    var body: some View {
        NavigationView {
            VStack {
                Text("CLASS OF 2024")
                    .font(.custom("varsity", size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.bay)
                    .padding(.top, 20)
                    .padding(.bottom, 10)

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    TabView {
                        ForEach(users.chunked(into: 9), id: \.self) { chunk in
                            ScrollView {
                                LazyVGrid(columns: [
                                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
                                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32),
                                    GridItem(.flexible(minimum: 100, maximum: 200), spacing: 32)
                                ], spacing: 30) {
                                    ForEach(chunk) { user in
                                        VStack(spacing: 5) {
                                            if let urlString = user.profilePicture, let url = URL(string: urlString) {
                                                let cacheBustedUrl = url.appendingQueryItem("cacheBuster", value: UUID().uuidString)
                                                AsyncImage(url: cacheBustedUrl) { phase in
                                                    switch phase {
                                                    case .success(let image):
                                                        image.resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 120, height: 175)
                                                            .clipped()
                                                            .background(Color.black)
                                                            .overlay(
                                                                Rectangle()
                                                                    .stroke(Color.white)
                                                            )
                                                    case .failure(_):
                                                        Color.black
                                                            .frame(width: 120, height: 175)
                                                            .overlay(
                                                                Rectangle()
                                                                    .stroke(Color.white)
                                                            )
                                                    case .empty:
                                                        Color.black
                                                            .frame(width: 120, height: 175)
                                                            .overlay(
                                                                Rectangle()
                                                                    .stroke(Color.white)
                                                            )
                                                    @unknown default:
                                                        EmptyView()
                                                    }
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
                                                VStack {
                                                    Text(user.firstName)
                                                        .font(.custom("varsity TEAM", size: 09))
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(.white)
                                                    Text(user.lastName)
                                                        .font(.custom("varsity TEAM", size: 09))
                                                        .multilineTextAlignment(.center)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                            Text(user.specialty)
                                                .font(.custom("CaviarDreams", size: 10))
                                                .fontWeight(.semibold)
                                                .frame(width: 109, height: 24)
                                                .background(Color.black)
                                                .foregroundColor(.white)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 4)
                                                        .stroke(Color.white)
                                                )
                                            Text("PM ADA")
                                                .font(.custom("CaviarDreams", size: 10))
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
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle())
                }
            }
            .background(
                Image("splash")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .onAppear {
                fetchUsers()
            }
        }
    }

    private func fetchUsers() {
        isRefreshing = true
        HeadshotFunction.fetchRecentUsers { success, users in
            DispatchQueue.main.async {
                if success {
                    self.users = users ?? []
                    self.errorMessage = nil
                } else {
                    self.errorMessage = "Failed to load users"
                }
                self.isRefreshing = false
            }
        }
    }

    private func refreshView() {
        self.users.removeAll()
        fetchUsers()
    }
}

extension URL {
    func appendingQueryItem(_ name: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return self }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ?? []
        let queryItem = URLQueryItem(name: name, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

struct Headshots_Previews: PreviewProvider {
    static var previews: some View {
        Headshots()
    }
}
