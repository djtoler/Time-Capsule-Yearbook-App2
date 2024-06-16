
import SwiftUI

import SwiftUI

struct HeaderView: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
    var user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "chevron.left")
                        .font(.title2)
  
                    VStack(alignment: .leading) {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.custom("caviarDreams", size: 35))
                            .fontWeight(.semibold)
  
                        Text(user.specialty)
                            .font(.custom("caviarDreams", size: 20))
                            .fontWeight(.semibold)
  
                        HStack {
                            VStack {
                                Spacer()
                                Text("MEMORIES")
                                    .font(.custom("varsity", size: 40))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                Rectangle()
                                    .frame(height: 5)
                                    .foregroundColor(.white)
                                    .offset(y: -25)
                                Spacer()
                            }
                        }
                    }
  
                    Spacer()
  
                    if let imageUrl = user.profilePicture, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 81, height: 79)
                        .clipShape(Circle())
                    } else {
                        Image("defaultprofile") // Fallback image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 81, height: 79)
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {

        let sampleUser = User(
            email: "userPre@gmail.com",
            firstName: "JohnPre",
            lastName: "DoePre",
            specialty: "iOS DevelopmentPre",
            profilePicture: "https://example.com/defaultprofilePre"
        )
        
        // Use this sample user object for the preview of HeaderView
        HeaderView(user: sampleUser)
    }
}
