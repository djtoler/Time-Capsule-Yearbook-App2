import SwiftUI
import UIKit

struct UpdateResponse: Codable {
    let message: String
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct UserProfileView: View {
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
    @State private var portfolioLink = ""
    @State private var gitHubLink = ""

    @State private var user: User
    @State private var isSubmitting = [Bool](repeating: false, count: 7)
    @State private var imageUpdated = [Bool](repeating: false, count: 7)

    init(user: User) {
        self._user = State(initialValue: user)
        self._portfolioLink = State(initialValue: user.link01 ?? "")
        self._gitHubLink = State(initialValue: user.link02 ?? "")
    }
    

    var body: some View {
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
                                Rectangle()
                                    .frame(height: 5)
                                    .foregroundColor(.white)
                                    .offset(y: -25)
                                Spacer()
                            }
                        }
                    }
                    
                    Spacer()
                    VStack {
                        ZStack {
                            if let image = profileImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 81, height: 79)
                                    .clipShape(Circle())
                                    .clipped()
                            } else if let urlString = user.profilePicture, let url = URL(string: urlString) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .success(let image):
                                        image.resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .frame(width: 81, height: 79)
                                             .clipShape(Circle())
                                             .clipped()
                                    case .failure(_):
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 81, height: 79)
                                    case .empty:
                                        Circle()
                                            .fill(Color.gray)
                                            .frame(width: 81, height: 79)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            } else {
                                Image("addimage")
                                    .resizable()
                                    .frame(width: 81, height: 79)
                                    .background(Color.gray)
                                    .clipShape(Circle())
                                    .clipped()
                            }
                            Circle()
                                .fill(Color.black.opacity(0.5))
                                .frame(width: 25, height: 25)
                                .overlay(
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(Color(hex: "#24D1B7"))
                                        .frame(width: 25, height: 25)
                                )
                                .offset(x: 25, y: 25)
                                .onTapGesture {
                                    self.activeImageSelection = 0
                                    self.imagePickerShowing = true
                                }
                        }
                        if profileImage != nil && !isSubmitting[0] && imageUpdated[0] {
                            Button("Submit") {
                                isSubmitting[0] = true
                                uploadImage(image: profileImage, imageNumber: 0, email: user.email, firstName: user.firstName, lastName: user.lastName)
                            }
                            .background(Color(hex: "#24D1B7"))
                            .cornerRadius(5)
                            .padding(5)
                            .foregroundColor(Color.black)
                        
                        }
                    }
                }
                .padding()
                
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            ZStack {
                                if let image = image01 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 162, height: 314)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                } else if let urlString = user.image01, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .frame(width: 162, height: 314)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                        case .failure(_):
                                            Image("addimage")
                                                .resizable()
                                                .frame(width: 162, height: 314)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                        case .empty:
                                            Image("addimage")
                                                .resizable()
                                                .frame(width: 162, height: 314)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                } else {
                                    Image("addimage")
                                        .resizable()
                                        .frame(width: 162, height: 314)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                }
                                Circle()
                                    .fill(Color.black.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color(hex: "#24D1B7"))
                                            .frame(width: 25, height: 25)
                                    )
                                    .offset(x: 70, y: 140) // Adjust the offset to position at bottom right
                                    .onTapGesture {
                                        self.activeImageSelection = 1
                                        self.imagePickerShowing = true
                                    }
                            }
                            if image01 != nil && !isSubmitting[1] && imageUpdated[1] {
                                Button("Submit") {
                                    isSubmitting[1] = true
                                    uploadImage(image: image01, imageNumber: 1, email: user.email, firstName: user.firstName, lastName: user.lastName)
                                }
                                .background(Color.white)
                                .cornerRadius(5)
                                .padding(5)
                            }
                        }
                        VStack {
                            ZStack {
                                if let image = image02 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 198, height: 174)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                        .offset(y: -68)
                                } else if let urlString = user.image02, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .frame(width: 198, height: 174)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -68)
                                        case .failure(_):
                                            Image("addimage12")
                                                .resizable()
                                                .frame(width: 198, height: 174)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -68)
                                        case .empty:
                                            Image("addimage12")
                                                .resizable()
                                                .frame(width: 198, height: 174)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -68)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .onTapGesture {
                                        self.activeImageSelection = 2
                                        self.imagePickerShowing = true
                                    }
                                } else {
                                    Image("addimage12")
                                        .resizable()
                                        .frame(width: 198, height: 174)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                        .offset(y: -68)
                                        .onTapGesture {
                                            self.activeImageSelection = 2
                                            self.imagePickerShowing = true
                                        }
                                }
                                Circle()
                                    .fill(Color.gray.opacity(1))
                                    .frame(width: 25, height: 20)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color(hex: "#24D1B7"))
                                            .frame(width: 25, height: 25)
                                        
                                    )
                                    .offset(x: 85, y: -20)
                                    .onTapGesture {
                                        self.activeImageSelection = 1
                                        self.imagePickerShowing = true
                                    }
                                if image02 != nil && !isSubmitting[2] && imageUpdated[2] {
                                    Button("Submit") {
                                        isSubmitting[2] = true
                                        uploadImage(image: image02, imageNumber: 2, email: user.email, firstName: user.firstName, lastName: user.lastName)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(5)
                                }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            ZStack {
                                if let image = image03 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 162, height: 267)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                } else if let urlString = user.image03, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .frame(width: 162, height: 267)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                        case .failure(_):
                                            Image("addimage4")
                                                .resizable()
                                                .frame(width: 162, height: 267)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                        case .empty:
                                            Image("addimage4")
                                                .resizable()
                                                .frame(width: 162, height: 267)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .onTapGesture {
                                        self.activeImageSelection = 3
                                        self.imagePickerShowing = true
                                    }
                                } else {
                                    Image("addimage4")
                                        .resizable()
                                        .frame(width: 162, height: 267)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                        .onTapGesture {
                                            self.activeImageSelection = 3
                                            self.imagePickerShowing = true
                                        }
                                }
                                Circle()
                                    .fill(Color.black.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color(hex: "#24D1B7"))
                                            .frame(width: 25, height: 25)
                                    )
                                    .offset(x: 70, y: 90)
                                    .onTapGesture {
                                        self.activeImageSelection = 3
                                        self.imagePickerShowing = true
                                    }
                                if image03 != nil && !isSubmitting[3] && imageUpdated[3] {
                                    Button("Submit") {
                                        isSubmitting[3] = true
                                        uploadImage(image: image03, imageNumber: 3, email: user.email, firstName: user.firstName, lastName: user.lastName)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(5)
                                }
                            }
                        }
                        VStack {
                            ZStack {
                                if let image = image04 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 198, height: 250)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                            )
                                        .offset(y: -176)
                                } else if let urlString = user.image04, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .frame(width: 198, height: 250)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -176)
                                        case .failure(_):
                                            Image("addimage8")
                                                .resizable()
                                                .frame(width: 198, height: 250)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -176)
                                        case .empty:
                                            Image("addimage8")
                                                .resizable()
                                                .frame(width: 198, height: 250)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -176)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .onTapGesture {
                                        self.activeImageSelection = 4
                                        self.imagePickerShowing = true
                                    }
                                } else {
                                    Image("addimage8")
                                        .resizable()
                                        .frame(width: 198, height: 250)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                            )
                                            .offset(y: -176)
                                        .onTapGesture {
                                            self.activeImageSelection = 4
                                            self.imagePickerShowing = true
                                        }
                                }
                                Circle()
                                    .fill(Color.black.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color(hex: "#24D1B7"))
                                            .frame(width: 25, height: 25)
                                    )
                                    .offset(x: 85, y: -70)
                                    .onTapGesture {
                                        self.activeImageSelection = 4
                                        self.imagePickerShowing = true
                                    }
                                if image04 != nil && !isSubmitting[4] && imageUpdated[4] {
                                    Button("Submit") {
                                        isSubmitting[4] = true
                                        uploadImage(image: image04, imageNumber: 4, email: user.email, firstName: user.firstName, lastName: user.lastName)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(5)
                                }
                            }
                        }
                        Spacer()
                    }
                    HStack {
                        VStack {
                            ZStack {
                                if let image = image05 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 162, height: 193)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                            )
                                        .offset(y: -107)
                                } else if let urlString = user.image05, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .frame(width: 162, height: 193)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -107)
                                        case .failure(_):
                                            Image("addimage2")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 162, height: 193)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -107)
                                        case .empty:
                                            Image("addimage2")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 162, height: 193)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -107)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .onTapGesture {
                                        self.activeImageSelection = 5
                                        self.imagePickerShowing = true
                                    }
                                } else {
                                    Image("addimage2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 162, height: 193)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                            )
                                            .offset(y: -107)
                                        .onTapGesture {
                                            self.activeImageSelection = 5
                                            self.imagePickerShowing = true
                                        }
                                }
                                Circle()
                                    .fill(Color.black.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color(hex: "#24D1B7"))
                                            .frame(width: 25, height: 25)
                                    )
                                    .offset(x: 65, y: -35)
                                    .onTapGesture {
                                        self.activeImageSelection = 5
                                        self.imagePickerShowing = true
                                    }
                                if image05 != nil && !isSubmitting[5] && imageUpdated[5] {
                                    Button("Submit") {
                                        isSubmitting[5] = true
                                        uploadImage(image: image05, imageNumber: 5, email: user.email, firstName: user.firstName, lastName: user.lastName)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(5)
                                }
                            }
                        }
                        VStack {
                            ZStack {
                                if let image = image06 {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 198, height: 345)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                            )
                                            .offset(y: -183)
                                } else if let urlString = user.image06, let url = URL(string: urlString) {
                                    AsyncImage(url: url) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image.resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 198, height: 345)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -183)
                                        case .failure(_):
                                            Image("addimage")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 198, height: 345)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -183)
                                        case .empty:
                                            Image("addimage")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 198, height: 345)
                                                .background(Color.black)
                                                .overlay(
                                                    Rectangle()
                                                        .stroke(Color.white, lineWidth: 3)
                                                )
                                                .offset(y: -183)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                    .onTapGesture {
                                        self.activeImageSelection = 6
                                        self.imagePickerShowing = true
                                    }
                                } else {
                                    Image("addimage")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 198, height: 345)
                                        .background(Color.black)
                                        .overlay(
                                            Rectangle()
                                                .stroke(Color.white, lineWidth: 3)
                                            )
                                            .offset(y: -183)
                                        .onTapGesture {
                                            self.activeImageSelection = 6
                                            self.imagePickerShowing = true
                                        }
                                }
                                Circle()
                                    .fill(Color.black.opacity(0.5))
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(Color(hex: "#24D1B7"))
                                            .frame(width: 25, height: 25)
                                    )
                                    .offset(x: 80, y: -37)
                                    .onTapGesture {
                                        self.activeImageSelection = 6
                                        self.imagePickerShowing = true
                                    }
                                if image06 != nil && !isSubmitting[6] && imageUpdated[6] {
                                    Button("Submit") {
                                        isSubmitting[6] = true
                                        uploadImage(image: image06, imageNumber: 6, email: user.email, firstName: user.firstName, lastName: user.lastName)
                                    }
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .padding(5)
                                }
                            }
                        }
                    }
                    .padding(.bottom, -150)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("LINKS")
                        .font(.custom("varsity", size: 45))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.bay)
                    Rectangle()
                        .frame(width: 140, height: 5)
                        .foregroundColor(.white)
                        .offset(y: -23)

                    HStack {
                        Image(systemName: "link")
                        Button(action: {
                            withAnimation {
                                showPortfolioTextField.toggle()
                            }
                        }) {
                            Text("Portfolio")
                                .font(.custom("Helvetica", size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(width: 352, height: 34)
                    .multilineTextAlignment(.center)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(4)
                    
                    if showPortfolioTextField {
                        HStack {
                            TextField("Enter your Portfolio link", text: $portfolioLink)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button(action: {
                                updateLink(linkType: "link01", link: portfolioLink)
                            }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.horizontal)
                    }

                    HStack {
                        Image(systemName: "link")
                        Button(action: {
                            withAnimation {
                                showGitHubTextField.toggle()
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
                    
                    if showGitHubTextField {
                        HStack {
                            TextField("Enter your GitHub link", text: $gitHubLink)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            Button(action: {
                                updateLink(linkType: "link02", link: gitHubLink)
                            }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(30)
                NotificationsView2(user: user)
                    .background(Color.green)
                    .frame(height: 600)
                    .padding(.top, 20)
                    .padding(.leading, 20)
            }
        }
        .background(Color.black)
        .sheet(isPresented: $imagePickerShowing) {
            ImagePicker(selectedImage: self.$activeImageSelection, images: [0: $profileImage, 1: $image01, 2: $image02, 3: $image03, 4: $image04, 5: $image05, 6: $image06], imageUpdated: $imageUpdated)
        }
        .sheet(isPresented: $showWebView) {
            if let urlToOpen = urlToOpen {
                WebView(url: urlToOpen)
            }
        }
        .onAppear {
            fetchUserComments()
        }
    }

    func fetchUserComments() {
        guard let url = URL(string: "http://54.197.82.22:8000/users/\(user.email)/comments") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch comments: \(error?.localizedDescription ?? "No error description")")
                return
            }

            // Log the raw data response for debugging
            if let rawResponse = String(data: data, encoding: .utf8) {
                print("Raw response: \(rawResponse)")
            }

            do {
                let comments = try JSONDecoder().decode([Comment].self, from: data)
                DispatchQueue.main.async {
                    user.comments = comments
                }
            } catch {
                print("Failed to decode comments: \(error)")
            }
        }.resume()
    }

    func updateLink(linkType: String, link: String) {
        guard let url = URL(string: "http://54.197.82.22:8000/updateLink") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let updateDetails: [String: Any] = [
            "email": user.email,
            "linkType": linkType,
            "link": link
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: updateDetails, options: []) else { return }

        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network request failed: \(error?.localizedDescription ?? "No error description")")
                return
            }

            do {
                let response = try JSONDecoder().decode(UpdateResponse.self, from: data)
                DispatchQueue.main.async {
                    print("Link update successful: \(response.message)")
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

    func uploadImage(image: UIImage?, imageNumber: Int, email: String, firstName: String, lastName: String) {
        guard let image = image, let imageData = image.jpegData(compressionQuality: 0.8) else {
            print("No image to upload")
            return
        }

        let url = URL(string: "http://54.197.82.22:8000/upload")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 60 // Increase timeout interval to 60 seconds

        let boundary = "Boundary-\(UUID().uuidString)"
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image\(imageNumber).jpeg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"email\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(email)\r\n".data(using: .utf8)!)
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"imageNumber\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(imageNumber)\r\n".data(using: .utf8)!)
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"firstName\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(firstName)\r\n".data(using: .utf8)!)
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"lastName\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(lastName)\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        // Debugging prints
        print("Starting image upload...")
        print("URL: \(url)")
        print("User Email: \(email)")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Image Number: \(imageNumber)")
        print("Request headers: \(request.allHTTPHeaderFields ?? [:])")
        print("Request body size: \(body.count) bytes")

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Upload error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    isSubmitting[imageNumber] = false
                }
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response: \(httpResponse.statusCode)")
            } else {
                print("No HTTP Response received")
            }
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Server response: \(responseString)")
                // Update the user's image URL based on imageNumber
                DispatchQueue.main.async {
                    switch imageNumber {
                    case 0:
                        user.profilePicture = responseString
                    case 1:
                        user.image01 = responseString
                    case 2:
                        user.image02 = responseString
                    case 3:
                        user.image03 = responseString
                    case 4:
                        user.image04 = responseString
                    case 5:
                        user.image05 = responseString
                    case 6:
                        user.image06 = responseString
                    default:
                        break
                    }
                    isSubmitting[imageNumber] = false // Reset the isSubmitting flag
                    imageUpdated[imageNumber] = false // Reset the imageUpdated flag
                }
            } else {
                print("No data received from the server")
                DispatchQueue.main.async {
                    isSubmitting[imageNumber] = false // Reset the isSubmitting flag
                }
            }
        }.resume()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Int?
    var images: [Int: Binding<UIImage?>]
    @Binding var imageUpdated: [Bool]

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                if let selectedImage = parent.selectedImage {
                    self.parent.images[selectedImage]?.wrappedValue = image
                    self.parent.imageUpdated[selectedImage] = true // Set the imageUpdated flag to true when a new image is selected
                }
            }
            picker.dismiss(animated: true)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        // Attempt to load user data from UserDefaults
        if let user = User.load() {
            UserProfileView(user: user)
        } else {
            // If no user is found, use the default user
            UserProfileView(user: User.default)
        }
    }
}
