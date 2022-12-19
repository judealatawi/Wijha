

import SwiftUI
//import CloudKit

let navBarAppearance = UINavigationBar.appearance()



let tagsticker = [
    tagsContainer(tagName:"vagan", tagSymbol:"leaf.fill", tagColor:"greencolor"),
    tagsContainer(tagName:"24H", tagSymbol:"clock.fill", tagColor:"maincolorfont"),
    tagsContainer(tagName:"Children", tagSymbol:"figure.2.and.child.holdinghands", tagColor:"orangecolor"),
    tagsContainer(tagName:"Study", tagSymbol:"books.vertical.fill", tagColor:"marooncolor"),
    tagsContainer(tagName:"Entertainment", tagSymbol:"ticket.fill", tagColor:"yellowcolor"),
    tagsContainer(tagName:"Budget", tagSymbol:"dollarsign.circle.fill", tagColor:"muavecolor"),
    
]


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
                                //.ignoresSafeArea()
                                .padding(.top,-50)
                               // .padding([.top],-140)
                            
                            Image("bookmarkphoto")
                                .resizable()
                                .frame(width: 130,height: 130)
                                .padding(.top,70)
                                
                            
                        }.padding(.top,-170)
            
                    
                   // ZStack{
                        
                       
                    //}//.ignoresSafeArea()
                    ScrollView{
                        
                        LazyVGrid (columns: [GridItem(.fixed(130))]) {
                            
                            ForEach(vm.place,id:\.self) { p in
                                if(p.bk == bkk){
                                    ZStack{
                                        if let url = p.imageURL, let data = try? Data (contentsOf: url),
                                           let image = UIImage(data: data) {
                                            Image (uiImage: image)
                                                .resizable()
                                            .frame(width: 358.51, height: 290)}
                                        
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
                                            vm.updatebktrue(fruit: p)
                                            
                                        }else{vm.updatebkfalse(fruit: p)}
                                        
                                        
                                    } label: {
                                        if(p.bk == bkk){
                                            Image(systemName:"bookmark.fill")
                                        }else{
                                            Image(systemName:"bookmark")
                                            
                                        }
                                        
                                    }.padding(.top,-290).padding(.leading,310).font(.system(size: 30)).foregroundColor(Color("secondaryColor"))
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    //                                        if(p.bk == bkk ){
                                    //                                            Image(systemName:"bookmark").padding(.top,-290).padding(.leading,310).font(.system(size: 30)).foregroundColor(Color("secondaryColor"))
                                    //
                                    //
                                    //                                        }else{Image(systemName:"bookmark.fill") .padding(.top,-290).padding(.leading,310).font(.system(size: 30)).foregroundColor(Color("secondaryColor"))
                                    //
                                    //                                        }
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    //                                            Image(systemName: isSelected ? "bookmark.fill" : "bookmark")
                                    //                                                .font(.system(size: 30))
                                    //
                                    //                                                .foregroundColor(Color("secondaryColor"))
                                    //
                                    // }
                                }
                                
                            }
                        }.padding(.top,40)
                        
                    }
                        
                       
                        
                        
                        
            //.padding(.top, -300)
                    
                }//end of zstack
                }
            
        }//.navigationBarTitle(Text("My Profile"))
    
                    
        }
        
    }

//Place view

struct DetailView : View {
    let bk: bookmark
    var body: some View {
        
        VStack{
            ZStack{
                ScrollView{
                    
                    Image(bk.bookmarkImage)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode:.fill)
                        .frame(height: 390).padding(.top,-90)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                    ZStack{
                        RoundedRectangle(cornerRadius: 40).fill(Color("background1").gradient).frame(width: 390,height: 600).padding(.top,-50)
                        HStack{
                            
                        
                            VStack{
                                Text(bk.placeName)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("maincolorfont"))
                                    .padding(.trailing)
                                    .padding(.vertical,1.0)
                                Text(bk.placeDetail)
                                    .font(.callout)
                                    .foregroundColor(Color("caption"))
                                
                        
                       
                            }.padding(.top,-40)
                            
                               Spacer()
                            VStack{
                                HStack{
                                    Text(bk.rating)
                                        .foregroundColor(Color("caption"))
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color.yellow)
                                        .padding(.vertical,8.0)
                                    
                                }.padding(.top,-40)
                                
                                HStack{
                                    Text("100")
                                        .foregroundColor(Color("caption"))
                                    
                                    //                                    Image(systemName: "bookmark")
                                    //                                        .foregroundColor(Color("secondaryColor"))
                                    //                                        .padding(.bottom,1)
                                    Button{
                                        bk.isSelected.toggle()
                                        
                                    } label: {
                                        Image(systemName: bk.isSelected ? "bookmark.fill": "bookmark").foregroundColor(Color("secondaryColor")).font(.system(size: 22))
                                    }
                                    
                                }
                            }
                        }.padding(.horizontal, 17)
                            .padding(.bottom,480)
                        LazyHGrid(rows: rows, spacing: 5) {
                            ForEach(tagsticker){ tag in
                                          HStack {
                                              Text(tag.tagName)
                                                  .foregroundColor(Color(tag.tagColor))
                                              Image(systemName: tag.tagSymbol)
                                                  .foregroundColor(Color(tag.tagColor))
                      
                                          }.padding(6).background{
                                              RoundedRectangle(cornerRadius: 10)
                                                  .stroke(Color(tag.tagColor),lineWidth: 2)
                                                  .foregroundColor(.clear)
                                          }
                      
                                      }
                        }.padding(.top,-300)
                      
                    }
                }.frame(maxWidth: .infinity)
                //Spacer()
                
            }
           
            .navigationBarTitleDisplayMode(.inline)
            
        }
//        Text(bk.placeName)
//        Image(bk.bookmarkImage).resizable().cornerRadius(10).frame(width: 358.51, height: 290).padding(.top,-40)
//
//        Text(bk.rating)
//        Text(bk.tagImage)
        //Text(bk.)
           
    }
}

struct bookmark: Identifiable {
  var id = UUID()
  //var Id = Int()
  var bookmarkImage: String
  var tagImage: String
  var placeName: String
  var rating: String
    
//static let bm: bookmark = .init(bookmarkImage: "", tagImage: "", placeName: "hi", rating: "66", isSelected: false, placeDetail: "mmmmm")
    //static let bm: bookmark = .init(bookmarkImage: "", tagImage: "", placeName: "hi", rating: "66", isSelected: false, placeDetail: "mmmmm")
  @State var isSelected : Bool
  var placeDetail: String
  //static let bm: bookmark = .
    
}

//static let bm: bookmark = [book]





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}


struct tagsContainer: Identifiable{
    var id = UUID()
    var tagName: String
    var tagSymbol: String
    var tagColor: String
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
