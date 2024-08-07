import SwiftUI
import WebKit

struct UserProfileViewAlt: View {
    @State private var image01: UIImage?
    @State private var image02: UIImage?
    @State private var image03: UIImage?
    @State private var image04: UIImage?
    @State private var image05: UIImage?
    @State private var image06: UIImage?
    @State private var profileImage: UIImage?
    @State private var imagePickerShowing = false
    @State private var activeImageSelection: Int?
    @State private var showWebView = false
    @State private var urlToOpen: URL?
    @State private var showPortfolioTextField = false
    @State private var showGitHubTextField = false
    @State private var newPortfolioLink = ""
    @State private var newGitHubLink = ""
    @State private var showPopup = false
    @State private var popupMessage = ""
    @State private var imageUpdated = Array(repeating: false, count: 7)

    @State var user: User

    var body: some View {
        ZStack{
            Image("BG3")
                .resizable()
                .ignoresSafeArea()
                .offset(x: -27)
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.custom("caviarDreams", size: 35))
                                .fontWeight(.semibold)
                                .font(.system(size: 32))
                                .foregroundColor(.white)
                            
                            Text("\(user.specialty)")
                                .font(.custom("caviarDreams", size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            HStack {
                                VStack {
                                    Spacer()
                                    Text("MEMORIES")
                                        .font(.custom("varsity", size: 45))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.bay)
                                        .offset(y: -15)
                                    
                                    Rectangle()
                                        .frame(height: 5)
                                        .foregroundColor(.white)
                                        .offset(y: -50)
                                    Spacer()
                                    
                                }
                            }
                        }
                        
                        Spacer()
                        
                        //                        if let urlString = user.profilePicture, let url = URL(string: urlString) {
                        //                            AsyncImage(url: url) { image in
                        //                                image.resizable()
                        //                                    .aspectRatio(contentMode: .fill)
                        //                                    .frame(width: 81, height: 79)
                        //                                    .clipShape(Circle())
                        //                                    .clipped()
                        //                            } placeholder: {
                        //                                Image("defaultprofile")
                        //                                    .resizable()
                        //                                    .aspectRatio(contentMode: .fill)
                        //                                    .frame(width: 81, height: 79)
                        //                                    .clipShape(Circle())
                        //                                    .clipped()
                        //                            }
                        //                        } else {
                        //                            Circle()
                        //                                .fill(Color.gray)
                        //                                .frame(width: 81, height: 79)
                        //                                .offset(x: 95, y: -55)
                        //                            Image("defaultprofile")
                        //                                .resizable()
                        //                                .aspectRatio(contentMode: .fill)
                        //                                .frame(width: 81, height: 79)
                        //                                .clipShape(Circle())
                        //                                .clipped()
                        //                                .offset(x: 5, y: -55)
                        //
                        //                        }
                        //                    }
                        //                    .padding()
                        //
                        
                        
                        VStack {
                            ZStack {
                                if let urlString = user.profilePicture, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 81, height: 79)
                                                .clipShape(Circle())
                                                .clipped()
                                        case .failure(_), .empty:
                                            Image("defaultprofile")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 81, height: 79)
                                                .background(Color.gray)
                                                .clipShape(Circle())
                                                .clipped()
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Image("defaultprofile2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 81, height: 79)
                                        .background(Color.gray)
                                        .clipShape(Circle())
                                        .clipped()
                                        .offset(x: 2, y: -28)
                                }
                            }
                        }}
                        .padding()


//                    VStack {
//                        HStack {
//                            Spacer()
//                            Image(uiImage: loadImage(urlString: user.image01, defaultImage: "addimage") ?? UIImage(named: "addimage")!)
//                                .resizable()
//                                .frame(width: 162, height: 314)
//                                .background(Color.black)
//                                .overlay(
//                                    Rectangle()
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
//                            Image(uiImage: loadImage(urlString: user.image02, defaultImage: "addimage12") ?? UIImage(named: "addimage12")!)
//                                .resizable()
//                                .frame(width: 198, height: 174)
//                                .background(Color.black)
//                                .overlay(
//                                    Rectangle()
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
//                                .offset(y: -68)
//                            Spacer()
//                        }
//                        HStack {
//                            Spacer()
//                            Image(uiImage: loadImage(urlString: user.image03, defaultImage: "addimage4") ?? UIImage(named: "addimage4")!)
//                                .resizable()
//                                .frame(width: 162, height: 267)
//                                .background(Color.black)
//                                .overlay(
//                                    Rectangle()
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
//                            Image(uiImage: loadImage(urlString: user.image04, defaultImage: "addimage8") ?? UIImage(named: "addimage8")!)
//                                .resizable()
//                                .frame(width: 198, height: 250)
//                                .background(Color.black)
//                                .overlay(
//                                    Rectangle()
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
//                                .offset(y: -176)
//                            Spacer()
//                        }
//                        HStack {
//                            Image(uiImage: loadImage(urlString: user.image05, defaultImage: "addimage2") ?? UIImage(named: "addimage2")!)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 162, height: 193)
//                                .background(Color.black)
//                                .overlay(
//                                    Rectangle()
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
//                                .offset(y: -107)
//                            Image(uiImage: loadImage(urlString: user.image06, defaultImage: "addimage") ?? UIImage(named: "addimage")!)
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 198, height: 345)
//                                .background(Color.black)
//                                .overlay(
//                                    Rectangle()
//                                        .stroke(Color.white, lineWidth: 3)
//                                )
//                                .offset(y: -183)
//                        }
//                        .padding(.bottom, -150)
//                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image(uiImage: loadImage(urlString: user.image01, defaultImage: "addimage") ?? UIImage(named: "addimage")!)
                                .resizable()
                                .frame(width: 162, height: 314)
                                .background(Color.black)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(y: -29)
                            Image(uiImage: loadImage(urlString: user.image02, defaultImage: "addimage12") ?? UIImage(named: "addimage12")!)
                                .resizable()
                                .frame(width: 198, height: 174)
                                .background(Color.black)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(y: -98)
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Image(uiImage: loadImage(urlString: user.image03, defaultImage: "addimage4") ?? UIImage(named: "addimage4")!)
                                .resizable()
                                .frame(width: 162, height: 267)
                                .background(Color.black)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(y: -30)
                            Image(uiImage: loadImage(urlString: user.image04, defaultImage: "addimage8") ?? UIImage(named: "addimage8")!)
                                .resizable()
                                .frame(width: 198, height: 250)
                                .background(Color.black)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(y: -176)
                            Spacer()
                        }
                        HStack {
                            Image(uiImage: loadImage(urlString: user.image05, defaultImage: "addimage8") ?? UIImage(named: "addimage8")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 162, height: 193)
                                .background(Color.black)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(y: -107)
                            Image(uiImage: loadImage(urlString: user.image06, defaultImage: "addimage4") ?? UIImage(named: "addimage4")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 198, height: 345)
                                .background(Color.black)
                                .overlay(
                                    Rectangle()
                                        .stroke(Color.white, lineWidth: 3)
                                )
                                .offset(y: -183)
                        }
                        .padding(.bottom, -150)
                    }
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("LINKS")
                            .font(.custom("varsity", size: 45))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.bay)
                            .offset(y: -63)
                        Rectangle()
                            .frame(width: 140, height: 5)
                            .foregroundColor(.white)
                            .offset(y: -90)
                        
                        HStack {
                            Image(systemName: "link")
                            Button(action: {
                                if let link01 = user.link01, !link01.isEmpty {
                                    print("Opening URL: \(link01)") // Debugging print statement
                                    if let url = URL(string: link01) {
                                        openURL(url)
                                    } else {
                                        showPopup(message: "Invalid URL")
                                    }
                                } else {
                                    showPopup(message: "No portfolio link yet")
                                }
                            }) {
                                Text("Portfolio")
                                    .font(.custom("Helvetica", size: 12))
                                    .fontWeight(.semibold)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(width: 352, height: 34)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(4)
                        .offset(y: -90)
                        
                        HStack {
                            Image(systemName: "link")
                            Button(action: {
                                if let link02 = user.link02, !link02.isEmpty {
                                    print("Opening URL: \(link02)") // Debugging print statement
                                    if let url = URL(string: link02) {
                                        openURL(url)
                                    } else {
                                        showPopup(message: "Invalid URL")
                                    }
                                } else {
                                    showPopup(message: "No GitHub link yet")
                                }
                            }) {
                                Text("GitHub")
                                    .font(.custom("Helvetica", size: 12))
                                    .fontWeight(.semibold)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(width: 352, height: 34)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(4)
                        .offset(y: -100)
                    }
                    .padding(30)
                    
                    Spacer()
                    CommentsView(viewModel: CommentsViewModel(targetUser: user))
                        .frame(height: 400)
                        .offset(y: -105)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(30)
//                .background(
//                    Image("splash")
//                        .resizable()
//                        .scaledToFill()
//                        .edgesIgnoringSafeArea(.all)
//                )
            }
        }
        .background(Color.black)
        .sheet(isPresented: $imagePickerShowing) {
            ImagePicker(selectedImage: self.$activeImageSelection, images: [0: $profileImage, 1: $image01, 2: $image02, 3: $image03, 4: $image04, 5: $image05, 6: $image06], imageUpdated: $imageUpdated)
        }
        .sheet(isPresented: $showWebView) {
            if let urlToOpen = urlToOpen {
                WebView(url: urlToOpen)
            } else {
                Text("Invalid URL")
            }
        }
        .overlay(
            VStack {
                if showPopup {
                    Text(popupMessage)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .transition(.opacity)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }

    func loadImage(urlString: String?, defaultImage: String) -> UIImage? {
        if let urlString = urlString, !urlString.isEmpty, let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            return image
        } else {
            return UIImage(named: defaultImage)
        }
    }

    func showPopup(message: String) {
        popupMessage = message
        showPopup = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showPopup = false
        }
    }

    func updateLink(linkType: String, link: String) {
        guard let url = URL(string: "http://54.197.82.22:8000/updateLink") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let updateDetails = [
            "email": user.email,
            "linkType": linkType,
            "link": link
        ]

        guard let jsonData = try? JSONEncoder().encode(updateDetails) else { return }

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network request failed: \(error?.localizedDescription ?? "No error description")")
                return
            }

            do {
                let updateResponse = try JSONDecoder().decode(UpdateResponse.self, from: data)
                DispatchQueue.main.async {
                    print("Link update successful: \(updateResponse.message)")
                    if linkType == "link01" {
                        user.link01 = link
                    } else if linkType == "link02" {
                        user.link02 = link
                    }
                    showPortfolioTextField = false
                    showGitHubTextField = false
                }
            } catch {
                print("Failed to decode update response: \(error)")
            }
        }.resume()
    }

    func openURL(_ url: URL) {
        print("Setting URL to: \(url)") // Debugging print statement
        self.urlToOpen = url
        self.showWebView = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.showWebView = true
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct UserProfileView_PreviewsAlt: PreviewProvider {
    static var previews: some View {
        UserProfileViewAlt(user: User.default)
    }
}




















//import SwiftUI
//import WebKit
//
//struct UserProfileViewAlt: View {
//    @State private var image01: UIImage?
//    @State private var image02: UIImage?
//    @State private var image03: UIImage?
//    @State private var image04: UIImage?
//    @State private var image05: UIImage?
//    @State private var image06: UIImage?
//    @State private var imagePickerShowing = false
//    @State private var activeImageSelection: Int?
//    @State private var showWebView = false
//    @State private var urlToOpen: URL?
//    @State private var showPortfolioTextField = false
//    @State private var showGitHubTextField = false
//    @State private var newPortfolioLink = ""
//    @State private var newGitHubLink = ""
//    @State private var showPopup = false
//    @State private var popupMessage = ""
//
//    @State var user: User // Make user a mutable state variable
//
//    var body: some View {
//        ZStack {
//            Image("memback")
//                .resizable()
//                .ignoresSafeArea()
//            ScrollView {
////                ZStack {
////                    Image("memback")
////                        .resizable()
////                        .ignoresSafeArea()
//            VStack(alignment: .leading) {
//                HStack {
//                    VStack(alignment: .leading) {
//                        Text("\(user.firstName) \(user.lastName)")
//                            .font(.custom("caviarDreams", size: 35))
//                            .fontWeight(.semibold)
//                            .font(.system(size: 32))
//                            .foregroundColor(.white)
//                        
//                        Text("\(user.specialty)")
//                            .font(.custom("caviarDreams", size: 20))
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                        HStack {
//                            VStack {
//                                Spacer()
//                                Text("MEMORIES")
//                                    .font(.custom("varsity", size: 45))
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.bay)
//                                    .offset(y: -15)
//                                Rectangle()
//                                    .frame(height: 5)
//                                    .foregroundColor(.white)
//                                    .offset(y: -35)
//                                Spacer()
//                            }
//                        }
//                    }
//                    
//                    Spacer()
//                    
//                    if let urlString = user.profilePicture, let url = URL(string: urlString) {
//                        AsyncImage(url: url) { image in
//                            image.resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 81, height: 79)
//                                .clipShape(Circle())
//                                .clipped()
//                        } placeholder: {
//                            Circle()
//                                .fill(Color.gray)
//                                .frame(width: 81, height: 79)
//                        }
//                    } else {
//                        Circle()
//                            .fill(Color.gray)
//                            .frame(width: 81, height: 79)
//                    }
//                }
//                .padding()
//                
//                VStack {
//                    HStack {
//                        Spacer()
//                        Image(uiImage: loadImage(urlString: user.image01, defaultImage: "addimage") ?? UIImage(named: "addimage")!)
//                            .resizable()
//                            .frame(width: 162, height: 314)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -29)
//                        Image(uiImage: loadImage(urlString: user.image02, defaultImage: "addimage12") ?? UIImage(named: "addimage12")!)
//                            .resizable()
//                            .frame(width: 198, height: 174)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -98)
//                        Spacer()
//                    }
//                    HStack {
//                        Spacer()
//                        Image(uiImage: loadImage(urlString: user.image03, defaultImage: "addimage4") ?? UIImage(named: "addimage4")!)
//                            .resizable()
//                            .frame(width: 162, height: 267)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -30)
//                        Image(uiImage: loadImage(urlString: user.image04, defaultImage: "addimage8") ?? UIImage(named: "addimage8")!)
//                            .resizable()
//                            .frame(width: 198, height: 250)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -176)
//                        Spacer()
//                    }
//                    HStack {
//                        Image(uiImage: loadImage(urlString: user.image05, defaultImage: "addimage2") ?? UIImage(named: "addimage2")!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 162, height: 193)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -107)
//                        Image(uiImage: loadImage(urlString: user.image06, defaultImage: "addimage") ?? UIImage(named: "addimage")!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 198, height: 345)
//                            .background(Color.black)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white, lineWidth: 3)
//                            )
//                            .offset(y: -183)
//                    }
//                    .padding(.bottom, -150)
//                }
//            
//                    VStack(alignment: .leading, spacing: 20) {
//                        Text("LINKS")
//                            .font(.custom("varsity", size: 45))
//                            .fontWeight(.semibold)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .foregroundColor(.bay)
//                            .offset(y: -60)
//                        Rectangle()
//                            .frame(width: 140, height: 5)
//                            .foregroundColor(.white)
//                            .offset(y: -85)
//                        
//                        HStack {
//                            Image(systemName: "link")
//                            Button(action: {
//                                if let link01 = user.link01, !link01.isEmpty {
//                                    print("Opening URL: \(link01)") // Debugging print statement
//                                    if let url = URL(string: link01) {
//                                        openURL(url)
//                                    } else {
//                                        showPopup(message: "Invalid URL")
//                                    }
//                                } else {
//                                    showPopup(message: "No portfolio link yet")
//                                }
//                            }) {
//                                Text("Portfolio")
//                                    .font(.custom("Helvetica", size: 12))
//                                    .fontWeight(.semibold)
//                                  
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                        .offset(y: -65)
//                        HStack {
//                            Image(systemName: "link")
//                            Button(action: {
//                                if let link02 = user.link02, !link02.isEmpty {
//                                    print("Opening URL: \(link02)") // Debugging print statement
//                                    if let url = URL(string: link02) {
//                                        openURL(url)
//                                    } else {
//                                        showPopup(message: "Invalid URL")
//                                    }
//                                } else {
//                                    showPopup(message: "No GitHub link yet")
//                                }
//                            }) {
//                                Text("GitHub")
//                                    .font(.custom("Helvetica", size: 12))
//                                    .fontWeight(.semibold)
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                        .offset(y: -75)
//                    }
//                    .padding(30)
//
//                Spacer()
//                
//                CommentsView(viewModel: CommentsViewModel(targetUser: user))
//                    .frame(height: 400)
//                    .frame(maxWidth: .infinity) // Center the CommentsView horizontally
//                    .offset(y: -75)
//                Spacer()
////                    .offset(y: 175)
//            }
//            .frame(maxWidth: .infinity) // Center the entire VStack
//            .padding(30)
////                .background(
////                    Image("splash")
////                        .resizable()
////                        .scaledToFill()
////                        .edgesIgnoringSafeArea(.all)
////                )
//            }
//        }
//        .background(Color.black)
//        .sheet(isPresented: $imagePickerShowing) {
//            ImagePicker(selectedImage: self.$activeImageSelection, images: [1: $image01, 2: $image02, 3: $image03, 4: $image04, 5: $image05, 6: $image06])
//        }
//        .sheet(isPresented: $showWebView) {
//            if let urlToOpen = urlToOpen {
//                WebView(url: urlToOpen)
//            } else {
//                Text("Invalid URL")
//            }
//        }
//        .overlay(
//            VStack {
//                if showPopup {
//                    Text(popupMessage)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                        .transition(.opacity)
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        )
//    }
//}
//    func loadImage(urlString: String?, defaultImage: String) -> UIImage? {
//        if let urlString = urlString, !urlString.isEmpty, let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
//            return image
//        } else {
//            return UIImage(named: defaultImage)
//        }
//    }
//
//    func showPopup(message: String) {
//        popupMessage = message
//        showPopup = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            showPopup = false
//        }
//    }
//
//    func updateLink(linkType: String, link: String) {
//        guard let url = URL(string: "http://54.197.82.22:8000/updateLink") else { return }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let updateDetails = [
//            "email": user.email,
//            "linkType": linkType,
//            "link": link
//        ]
//
//        guard let jsonData = try? JSONEncoder().encode(updateDetails) else { return }
//
//        request.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Network request failed: \(error?.localizedDescription ?? "No error description")")
//                return
//            }
//
//            do {
//                let updateResponse = try JSONDecoder().decode(UpdateResponse.self, from: data)
//                DispatchQueue.main.async {
//                    print("Link update successful: \(updateResponse.message)")
//                    if linkType == "link01" {
//                        user.link01 = link
//                    } else if linkType == "link02" {
//                        user.link02 = link
//                    }
//                    showPortfolioTextField = false
//                    showGitHubTextField = false
//                }
//            } catch {
//                print("Failed to decode update response: \(error)")
//            }
//        }.resume()
//    }
//
//    func openURL(_ url: URL) {
//        print("Setting URL to: \(url)") // Debugging print statement
//        self.urlToOpen = url
//        self.showWebView = false
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.showWebView = true
//        }
//    }
//
//}
//struct WebView: UIViewRepresentable {
//    let url: URL
//
//    func makeUIView(context: Context) -> WKWebView {
//        return WKWebView()
//    }
//
//    func updateUIView(_ uiView: WKWebView, context: Context) {
//        let request = URLRequest(url: url)
//        uiView.load(request)
//    }
//}
//
//struct UserProfileView_PreviewsAlt: PreviewProvider {
//    static var previews: some View {
//        UserProfileViewAlt(user: User.default)
//    }
//}
