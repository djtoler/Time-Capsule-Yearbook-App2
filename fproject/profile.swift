//import SwiftUI
//
//struct fullpage: View {
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
//                        Text("BREA PRYOR")
//                            .font(.custom("caviarDreams", size: 35))
//                            .fontWeight(.semibold)
//                            .font(.system(size: 32))
//                           
//                        Text("UI/UX DESIGNER")
//                            .font(.custom("caviarDreams", size: 20))
//                            .fontWeight(.semibold)
//                        HStack {
//                            VStack {
//                                Spacer()
//                                Text("MEMORIES")
//                                    .font(.custom("varsity", size: 45))
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.red)
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
//                    Image("defaultprofile")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 81, height: 79)
//                        .clipShape(Circle())
//                }
//                .padding()
//                
//                // difframe section
//                VStack {
//                    
//                    HStack {
//                        Spacer()
//                        
//                        Rectangle()
//                            .fill(Color.black)
//                            .frame(width: 162, height: 314)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white)
//                        )
//                            .offset(y: -29)
//                        Rectangle()
//                            .fill(Color.black)
//                            .frame(width: 198, height: 174)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white)
//                        )
//                            .offset(y: -98) // Move blue square up
//                        
//                        Spacer()
//                    }
//                    
//                    HStack {
//                        Spacer()
//                        
//                        Rectangle()
//                            .fill(Color.black)
//                            .frame(width: 162, height: 267)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white)
//                        )
//                            .offset(y: -30) // Adjusted offset for green square
//                        Rectangle()
//                            .fill(Color.black)
//                            .frame(width: 198, height: 250)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white)
//                        )
//                            .offset(y: -176) // Adjusted offset for orange square
//                        Spacer()
//                    }
//                    
//                    HStack {
//                        Spacer()
//                        
//                        Rectangle()
//                            .fill(Color.black)
//                            .frame(width: 162, height: 193)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white)
//                        )
//                            .offset(y: -107) // Move purple square down
//                        
//                        Rectangle()
//                            .fill(Color.black)
//                            .frame(width: 198, height: 345)
//                            .overlay(
//                                Rectangle()
//                                    .stroke(Color.white)
//                        )
//                            .offset(y: -183)
//                        Spacer()
//                    }
//                }
//                .padding()
//                
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("LINKS")
//                        .font(.custom("varsity", size: 45))
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.red)
//                    Rectangle()
//                        .frame(width: 140, height: 5)
//                        .foregroundColor(.white)
//                        .offset(y: -23)
//                    HStack {
//                        Image(systemName: "link")
//                        Text("Portfolio")
//                            .font(.custom("Helvetica", size: 12))
//                            .fontWeight(.semibold)
//                    }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                    HStack {
//                        Image(systemName: "link")
//                        Text("Github")
//                            .font(.custom("Helvetica", size: 12))
//                            .fontWeight(.semibold)
//                    }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                    Text("SHARE A MEMORY")
//                        .font(.custom("varsity", size: 40))
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.red)
//                    Rectangle()
//                        .frame(width: 340, height: 5)
//                        .foregroundColor(.white)
//                        .offset(y: -20)
//                    
//                       
//                }
//                .padding(30)
//                
//                commentbox()
//            }
//            
//            .background(
//                Image("splash")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//            )
//                
//        }
//        
//    }
//}
//
//#Preview {
//    fullpage()
//}
//
















//import SwiftUI
//
//struct fullpage: View {
//    var user: User
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
//                        Text("BREA PRYOR")
//                            .font(.custom("caviarDreams", size: 35))
//                            .fontWeight(.semibold)
//                            .font(.system(size: 32))
//                           
//                        Text("UI/UX DESIGNER")
//                            .font(.custom("caviarDreams", size: 20))
//                            .fontWeight(.semibold)
//                        HStack {
//                            VStack {
//                                Spacer()
//                                Text("MEMORIES")
//                                    .font(.custom("varsity", size: 45))
//                                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.red)
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
//                    Image("defaultprofile")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 81, height: 79)
//                        .clipShape(Circle())
//                }
//                .padding()
//                
//                // difframe section
//                VStack {
//                     
//                     HStack {
//                         Spacer()
//                         
//                         Rectangle()
//                             .fill(Color.clear) // Changed from black to clear
//                             .frame(width: 162, height: 314)
//                             .background( // Set image background
//                                 AsyncImage(url: URL(string: user.image01)) { image in
//                                     image.resizable()
//                                 } placeholder: {
//                                     ProgressView()
//                                 }
//                                 .clipShape(Rectangle())
//                             )
//                             .overlay(
//                                 Rectangle()
//                                     .stroke(Color.white)
//                             )
//                             .offset(y: -29)
//
//                         Rectangle()
//                             .fill(Color.clear) // Changed from black to clear
//                             .frame(width: 198, height: 174)
//                             .background( // Set image background
//                                 AsyncImage(url: URL(string: user.image02)) { image in
//                                     image.resizable()
//                                 } placeholder: {
//                                     ProgressView()
//                                 }
//                                 .clipShape(Rectangle())
//                             )
//                             .overlay(
//                                 Rectangle()
//                                     .stroke(Color.white)
//                             )
//                             .offset(y: -98) // Move up
//                         
//                         Spacer()
//                     }
//                     
//                     HStack {
//                         Spacer()
//                         
//                         Rectangle()
//                             .fill(Color.clear) // Changed from black to clear
//                             .frame(width: 162, height: 267)
//                             .background( // Set image background
//                                 AsyncImage(url: URL(string: user.image03)) { image in
//                                     image.resizable()
//                                 } placeholder: {
//                                     ProgressView()
//                                 }
//                                 .clipShape(Rectangle())
//                             )
//                             .overlay(
//                                 Rectangle()
//                                     .stroke(Color.white)
//                             )
//                             .offset(y: -30)
//
//                         Rectangle()
//                             .fill(Color.clear) // Changed from black to clear
//                             .frame(width: 198, height: 250)
//                             .background( // Set image background
//                                 AsyncImage(url: URL(string: user.image04)) { image in
//                                     image.resizable()
//                                 } placeholder: {
//                                     ProgressView()
//                                 }
//                                 .clipShape(Rectangle())
//                             )
//                             .overlay(
//                                 Rectangle()
//                                     .stroke(Color.white)
//                             )
//                             .offset(y: -176)
//                         
//                         Spacer()
//                     }
//                     
//                     // Additional rows can repeat the same pattern for other images.
//                 }
//                .padding()
//                
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("LINKS")
//                        .font(.custom("varsity", size: 45))
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.red)
//                    Rectangle()
//                        .frame(width: 140, height: 5)
//                        .foregroundColor(.white)
//                        .offset(y: -23)
//                    HStack {
//                        Image(systemName: "link")
//                        Text("Portfolio")
//                            .font(.custom("Helvetica", size: 12))
//                            .fontWeight(.semibold)
//                    }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                    HStack {
//                        Image(systemName: "link")
//                        Text("Github")
//                            .font(.custom("Helvetica", size: 12))
//                            .fontWeight(.semibold)
//                    }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .frame(width: 352, height: 34)
//                        .multilineTextAlignment(.center)
//                        .background(Color.white)
//                        .foregroundColor(.black)
//                        .cornerRadius(4)
//                    Text("SHARE A MEMORY")
//                        .font(.custom("varsity", size: 40))
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .foregroundColor(.red)
//                    Rectangle()
//                        .frame(width: 340, height: 5)
//                        .foregroundColor(.white)
//                        .offset(y: -20)
//                    
//                       
//                }
//                .padding(30)
//                
//                commentbox()
//            }
//            
//            .background(
//                Image("splash")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//            )
//                
//        }
//        
//    }
//}
//
//#Preview {
//    fullpage()
//}
//
