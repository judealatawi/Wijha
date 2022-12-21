
import SwiftUI

struct OnBording: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPages {
            WijhaPage()
        }else{
            WalkthroughScreen()
        }
        
    }
}

struct OnBording_Previews: PreviewProvider {
    static var previews: some View {
        OnBording()
    }
}

struct Home: View{
    var body: some View{
        Text("kjhgfdyguhjk")
    }
}


struct WalkthroughScreen: View{
    @StateObject private var vm = PushNotifciationViewModel()
    @AppStorage("currentPage") var currentPage = 1
    var body: some View{
        ZStack{
            
            if currentPage == 1 {
                ScreenView(image: "Onboard1", title: "Welcome", detail: "Let's take you to your  next favorite place", bgColor: Color("primaryColor 1"))
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(image: "Onboard2", title: "Welcome", detail: "Let's take you to your  next favorite place", bgColor: Color("secondaryColor"))
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(image: "Onboard3", title: "Welcome", detail: "Let's take you to your  next favorite place", bgColor: Color("thirdColor"))
                    .transition(.scale)
                
            }
            
        }.onAppear{vm.PermissionsReq()}
        
            .overlay(
                
                Button(action: {
                    //changing views
                    withAnimation(.easeInOut){
                        //checking
                        if currentPage <= totalPages{
                            currentPage += 1
                            
                        }
                        else{
                            //for app testing
                            currentPage = 1
                        }
                    }
                    
                }, label: {
                    Image(systemName: "chevron.right").font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(
                            ZStack{
                                Circle().stroke(Color.black.opacity(0.04), lineWidth: 4)
                                
                                Circle().trim(from: 0, to: CGFloat(currentPage)/CGFloat(totalPages))
                                    .stroke(Color.white,lineWidth: 4)
                                    .rotationEffect(.init(degrees: -90))
                            }
                                .padding(-15)
                        )
                })
                .padding(.bottom,20)
                ,alignment: .bottom
            )
    }
}


struct ScreenView: View {
    var  image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                HStack{
                    if currentPage == 1{
                        Text("")
                            .font(.title)
                            .fontWeight(.semibold)
                        //letter spacing
                            .kerning(1.4)
                    }
                    else{
                        Button(action: {
                            withAnimation(.easeInOut){
                                currentPage -= 1
                            }
                            
                        }, label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(Color.black.opacity(0.4))
                                .cornerRadius(10)
                        })
                    }
                    
                    
                    Spacer()
                    NavigationLink(destination:WijhaPage()) {
                        Button(action: {
                            withAnimation(.easeInOut){
                                currentPage = 4
                            }
                        }, label: {
                            Text("Skip")
                            .fontWeight(.semibold)                                   }
                               
                        )
                    }
                    
                }.foregroundColor(.white)
                    .padding()
                
                Spacer()
                Image(image)
                    .resizable().aspectRatio(contentMode: .fit)
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white).padding(.top)
                
                Text(detail).font(.system(size: 26)).foregroundColor(.white).fontWeight(.medium).kerning(1.3).multilineTextAlignment(.center)
                
                Spacer(minLength: 120)
                
            }
            .background(bgColor.cornerRadius(15).ignoresSafeArea())}
    }
}

var totalPages = 3
