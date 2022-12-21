import SwiftUI
import CloudKit
struct tagsContainer: Identifiable{
    var id = UUID()
    var tagName: String
    var tagSymbol: String
    var tagColor: String
}
let tagsticker = [
    tagsContainer(tagName:"vagan", tagSymbol:"leaf.fill", tagColor:"greencolor"),
    tagsContainer(tagName:"24H", tagSymbol:"clock.fill", tagColor:"maincolorfont"),
    tagsContainer(tagName:"Children", tagSymbol:"figure.2.and.child.holdinghands", tagColor:"orangecolor"),
    tagsContainer(tagName:"Study", tagSymbol:"books.vertical.fill", tagColor:"marooncolor"),
    tagsContainer(tagName:"Entertainment", tagSymbol:"ticket.fill", tagColor:"yellowcolor"),
    tagsContainer(tagName:"Budget", tagSymbol:"dollarsign.circle.fill", tagColor:"muavecolor"),
    
]


struct PlaceDeatil: View {
    
    
    let p : phhotos
    @State private var  bkk: Int64 = 0
    
    @State var isSelected = false
    @StateObject private var vm = CKViewModel()
    
    @State private var  vigan : String = "Vigan Friendly"
    @State private var  study : String = "Study Places"
    @State private var  enter : String = "Entertaiment"
    @State private var  budget : String = "Budget Friendly"
    @State private var  children : String = "Childrn And Family "
    @State private var  twintyfour : String = "24H"
    @State private var  mem : String = "Memrable Places"
    @State private var  new : String = "New Places"
    
    
    
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    ScrollView{
                        
                        if let url = p.imageURL, let data = try? Data (contentsOf: url),
                           let image = UIImage(data: data) {
                            Image (uiImage: image)
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode:.fill)
                                .frame(height: 390).padding(.top,-90)
                            .frame(maxWidth: UIScreen.main.bounds.width)}
                        
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 40).fill(Color("background1").gradient).frame(width: 390,height: 600).padding(.top,-50)
                            HStack{
                                
                                
                                VStack{
                                    Text(p.name)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("maincolorfont"))
                                        .padding(.trailing)
                                        .padding(.vertical,1.0)
                                    Text(p.detail)
                                        .font(.callout)
                                        .foregroundColor(Color("caption"))
                                    
                                    
                                    
                                }.padding(.top,-40)
                                
                                Spacer()
                                VStack{
                                    HStack{
                                        Text(p.rate)
                                            .foregroundColor(Color("caption"))
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color.yellow)
                                            .padding(.vertical,8.0)
                                        
                                    }.padding(.top,-40)
                                    
                                    HStack{
                                        
                                        if(p.bk == bkk){
                                            Image(systemName:"bookmark")                                    .foregroundColor(Color("secondaryColor"))
                                            
                                        }else{
                                            Image(systemName:"bookmark.fill")                                    .foregroundColor(Color("secondaryColor"))
                                            
                                        }
                                        
                                        
                                    }
                                }
                            }.padding(.horizontal, 17).padding(.bottom,480)
                            
                            LazyHGrid(rows: rows, spacing: 5) {
                                
                                if(p.cat == study){
                                    HStack {
                                        Text("Study")
                                            .foregroundColor(Color("marooncolor"))
                                        Image(systemName: "books.vertical.fill")
                                            .foregroundColor(Color("marooncolor"))
                                        
                                    }.padding(6).background{
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("marooncolor"),lineWidth: 2)
                                            .foregroundColor(.clear)
                                    }
                                    
                                }else if(p.cat == enter){
                                    HStack {
                                        Text("Entertainment")
                                            .foregroundColor(Color("yellowcolor"))
                                        Image(systemName: "ticket.fill")
                                            .foregroundColor(Color("yellowcolor"))
                                        
                                    }.padding(6).background{
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("yellowcolor"),lineWidth: 2)
                                            .foregroundColor(.clear)
                                    }
                                    
                                }else if(p.cat == vigan){
                                    HStack {
                                        Text("vagan")
                                            .foregroundColor(Color("greencolor"))
                                        Image(systemName: "leaf.fill")
                                            .foregroundColor(Color("greencolor"))
                                        
                                    }.padding(6).background{
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("greencolor"),lineWidth: 2)
                                            .foregroundColor(.clear)
                                    }
                                    
                                }else if(p.cat == children){
                                    HStack {
                                        Text("Children")
                                            .foregroundColor(Color("orangecolor"))
                                        Image(systemName: "figure.2.and.child.holdinghands")
                                            .foregroundColor(Color("orangecolor"))
                                        
                                    }.padding(6).background{
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("orangecolor"),lineWidth: 2)
                                            .foregroundColor(.clear)
                                    }
                                    
                                }else if(p.cat == budget){
                                    HStack {
                                        Text("Budget")
                                            .foregroundColor(Color("muavecolor"))
                                        Image(systemName: "dollarsign.circle.fill")
                                            .foregroundColor(Color("muavecolor"))
                                        
                                    }.padding(6).background{
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("muavecolor"),lineWidth: 2)
                                            .foregroundColor(.clear)
                                    }
                                    
                                }else if(p.cat == twintyfour){
                                    HStack {
                                        Text("24H")
                                            .foregroundColor(Color("maincolorfont"))
                                        Image(systemName: "clock.fill")
                                            .foregroundColor(Color("maincolorfont"))
                                        
                                    }.padding(6).background{
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("maincolorfont"),lineWidth: 2)
                                            .foregroundColor(.clear)
                                    }
                                    
                                }
                                
                            }.padding(.top,-300)
                            
                        }
                    }.frame(maxWidth: .infinity)
                    
                }
                
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
        }.accentColor(.white)
        
    }
}
