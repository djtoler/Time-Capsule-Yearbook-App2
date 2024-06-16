import SwiftUI

struct LinksAndMemoryView: View {
//    @EnvironmentObject var sessionManager: UserSessionManager
    // You might want to pass data using properties if needed
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("LINKS")
                .font(.custom("varsity", size: 45))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.red)
            Rectangle()
                .frame(width: 140, height: 5)
                .foregroundColor(.white)
                .offset(y: -23)
            HStack {
                Image(systemName: "link")
                Text("Portfolio")
                    .font(.custom("Helvetica", size: 12))
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: 352, height: 34)
            .multilineTextAlignment(.center)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(4)
            HStack {
                Image(systemName: "link")
                Text("Github")
                    .font(.custom("Helvetica", size: 12))
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(width: 352, height: 34)
            .multilineTextAlignment(.center)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(4)
            Text("SHARE A MEMORY")
                .font(.custom("varsity", size: 40))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.red)
            Rectangle()
                .frame(width: 340, height: 5)
                .foregroundColor(.white)
                .offset(y: -20)
        }
        .padding(30)
    }
}

struct LinksAndMemoryView_Previews: PreviewProvider {
    static var previews: some View {
        LinksAndMemoryView()
    }
}

