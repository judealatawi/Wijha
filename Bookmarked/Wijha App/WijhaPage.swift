
import SwiftUI
import CloudKit



struct WijhaPage: View {
    
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    @State var isSelected = false
    @StateObject private var vm = CKViewModel()
    @State private var  bkk: Int64 = 0
    @State private var  trend: Int64 = 1
    
    
    init() {
        vm.fetchItemsCKViewModel()
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .systemBackground
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = .black
        UISearchBar.appearance().tintColor = UIColor.white
    }
    
    
    var body: some View {
        NavigationView{
            NavigationStack{
                
                ZStack{
                    VStack{
                        
                        Image("header")
                            .resizable()
                            .frame(width: 400, height: 170)
                            .ignoresSafeArea()
                            .padding([.top],-150)
                        
                        ScrollView(.vertical){
                            
                            
                            HStack{
                                
                                Text("Category")
                                    .font(.custom("", fixedSize: 18))
                                    .fontWeight(.medium)
                                
                                
                                
                                Spacer()
                                
                                Button{
                                }label: {
                                    NavigationLink(destination: category()){
                                        Text("more")
                                            .foregroundColor(Color(red: 0.977, green: 0.53, blue: 0.434))
                                            .fontWeight(.medium)
                                    }
                                    
                                    Image(systemName: "chevron.backward")                                   .foregroundColor(.orange)
                                        .rotationEffect(.degrees(180))
                                    
                                }
                                
                            }.padding(.horizontal)
                            ScrollView(.horizontal){
                                
                                HStack{
                                    Image("v2")
                                    Image("u8")
                                    Image("t8")
                                    Image("ms0")
                                    Image("cj")
                                    
                                    
                                    
                                }.padding(.horizontal)
                                
                                
                                
                            }
                            Divider()
                            
                            Text("Trending")
                                .foregroundColor(.white)
                                .frame(width: 77, height: 22)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.969, green: 0.47, blue: 0.385)/*@END_MENU_TOKEN@*/)
                                .cornerRadius(7.5)
                                .font(.custom("", fixedSize: 16))
                                .fontWeight(.medium)
                                .padding(.leading,-185)
                            
                            
                            HStack{
                                ZStack{
                                    ScrollView(.horizontal){
                                        LazyHGrid (rows: [GridItem(.fixed(130))]) {
                                            
                                            ForEach(vm.place,id:\.self) { sub in
                                                
                                                if(sub.trend == trend){
                                                    VStack(alignment: .leading){
                                                        
                                                        
                                                        NavigationLink(destination: PlaceDeatil(p: sub)){
                                                            if let url = sub.imageURL, let data = try? Data (contentsOf: url),
                                                               let image = UIImage(data: data) {
                                                                Image (uiImage: image)
                                                                    .resizable()
                                                                    .cornerRadius(10)
                                                                    .frame(width: 80, height: 100)
                                                                    .padding(.top,-40)
                                                                    .frame(width: 96, height: 153)
                                                                    .background()
                                                                    .cornerRadius(8)
                                                                
                                                            }
                                                        }
                                                        Text(LocalizedStringKey(sub.name))
                                                            .font(.custom("", fixedSize: 12))
                                                            .fontWeight(.medium)
                                                            .padding(.top,-50)
                                                        
                                                        Text(sub.rate)
                                                            .font(.custom("", fixedSize: 12))
                                                            .padding(.top,-40)
                                                            .padding(.leading,5)
                                                            .fontWeight(.medium)
                                                        
                                                        Image(systemName:"star.fill")
                                                            .padding(.top,-50).padding(.leading,25)
                                                            .foregroundColor(.yellow)
                                                        
                                                        
                                                        
                                                    }
                                                }
                                            }
                                        }.padding(.leading)
                                    }
                                }
                                
                            }
                            
                            Divider()
                            
                            Text("Latest")
                                .font(.custom("", fixedSize: 18))
                                .fontWeight(.medium)
                                .padding(.horizontal,-175)
                            
                            ZStack{
                                ScrollView{
                                    
                                    ForEach(self.vm.place,id:\.self) { p in
                                        
                                        VStack(alignment: .leading){
                                            NavigationLink(destination: PlaceDeatil(p: p)){
                                                
                                                if let url = p.imageURL, let data = try? Data (contentsOf: url),
                                                   let image = UIImage(data: data) {
                                                    Image (uiImage: image)
                                                        .resizable().cornerRadius(10).frame(width: 358.51, height: 290).padding(.top,-40)
                                                }
                                            }
                                            Image("rectangletTag").padding(.top,-66)
                                            
                                            Text(p.name).padding(.top,-66).padding(.leading,5).foregroundColor(.white).bold()
                                            Text(p.rate).padding(.top,-60).padding(.leading,5).foregroundColor(.white)
                                            Image(systemName:"star.fill").padding(.top,-73).padding(.leading,35).foregroundColor(.yellow)
                                            
                                            
                                            Button {
                                                isSelected.toggle()
                                                if(isSelected == true){
                                                    vm.updatebktrue(placef: p)
                                                    
                                                }else{vm.updatebkfalse(placef: p)}
                                            } label: {
                                                if(p.bk == bkk){
                                                    Image(systemName:"bookmark")
                                                }else{
                                                    Image(systemName:"bookmark.fill")
                                                    
                                                }
                                                
                                            }.font(.system(size: 30)).foregroundColor(Color("secondaryColor")).padding(.top,-330).padding(.leading,320)
                                            
                                            
                                            
                                            
                                        }
                                   }
                                }.padding(.top,40)
                                
                                
                                
                            }
                            
                        }
                    }
                    
                    
                }
                .searchable(text: $searchText, prompt: "What is new in Riyadh")
                .background(Color("background1"))
                .navigationBarItems(trailing:
                                        Button(action: {
                    
                }) {
                    NavigationLink(destination: BookmarkView()){
                        Image(systemName: "bookmark.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("secondaryColor"))
                        
                    }
                }
                )
                
            }.accentColor(.white)
            
        }.navigationBarBackButtonHidden()
    }
}


struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        WijhaPage()
    }
}

