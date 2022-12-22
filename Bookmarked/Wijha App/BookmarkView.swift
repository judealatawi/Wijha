

import SwiftUI

let navBarAppearance = UINavigationBar.appearance()

struct BookmarkView: View {
    @State private var  bkk: Int64 = 1
    @State var isSelected = false
    @StateObject private var vm = CKViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            
            
            ZStack {
                
                VStack{
                    
                    ZStack{
                        Image("header")
                            .resizable()
                            .frame(height: 170)
                            .padding(.top,-50)
                        
                        Image("bookmarkphoto")
                            .resizable()
                            .frame(width: 130,height: 130)
                            .padding(.top,70)
                        
                        
                    }.padding(.top,-170)
                    VStack{
                        Text(LocalizedStringKey( "Bookmarked"))
                        
                            .font(.custom("", fixedSize: 16))
                            .fontWeight(. heavy)
                            .padding(.vertical,0)
                        Text(LocalizedStringKey("Here you can find your saved places"))
                            .font(.custom("", fixedSize: 14))
                            .fontWeight(.medium)
                    }.padding(.top,-10)
                    
                    ScrollView{
                        
                        LazyVGrid (columns: [GridItem(.fixed(130))]) {
                            
                            ForEach(vm.place,id:\.self) { p in
                                if(p.bk == bkk){
                                    ZStack{
                                        
                                        NavigationLink(destination: PlaceDeatil(p: p)){
                                            if let url = p.imageURL, let data = try? Data (contentsOf: url),
                                               let image = UIImage(data: data) {
                                                Image (uiImage: image)
                                                    .resizable()
                                                .frame(width: 358.51, height: 290)}
                                            
                                            
                                        }
                                        
                                        
                                        
                                        
                                        ZStack(alignment: .leading){
                                            Image("rectangletTag")
                                            VStack{
                                                Text(p.name)
                                                    .foregroundColor(.white).bold().padding(.leading)
                                                
                                                HStack{
                                                    Text(p.rate)
                                                        .foregroundColor(.white)
                                                    Image(systemName:"star.fill")
                                                    
                                                        .foregroundColor(.yellow)
                                                    
                                                }.padding(.leading)
                                            }
                                            
                                        }.position(x:63,y:260)
                                        
                                        
                                        
                                    }.padding(5)
                                    
                                    Button {
                                        isSelected.toggle()
                                        if(isSelected == true){
                                            vm.updatebktrue(placef: p)
                                            
                                        }else{vm.updatebkfalse(placef: p)}
                                        
                                        
                                    } label: {
                                        if(p.bk == bkk){
                                            Image(systemName:"bookmark.fill")
                                        }else{
                                            Image(systemName:"bookmark")
                                            
                                        }
                                        
                                    }.padding(.top,-290).padding(.leading,310).font(.system(size: 30)).foregroundColor(Color("secondaryColor"))
                                    
                                }
                                
                            }
                        }.padding(.top,40)
                        
                    }
                    
                    
                }
            }
            
        }.accentColor(.white)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
        
    }
}




let rows = [
    GridItem(.fixed(30), spacing: 1),
    GridItem(.flexible(minimum: 20, maximum: 50)),
]

func customNavBarTitle() {
    
    navBarAppearance.largeTitleTextAttributes = [
        .foregroundColor : UIColor(Color("greencolor")),
    ]
    
}
