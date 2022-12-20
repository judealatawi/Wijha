import SwiftUI

import CloudKit

struct details: Hashable{
    
    
    
    
    
}

//class detailsplace : ObservableObject{
//    func show (name:String,imageURL : URL?){
//        VStack{
//            ZStack{
//                ScrollView{
//
//                    if let url = imageURL, let data = try? Data (contentsOf: url),
//                       let image = UIImage(data: data) {
//                        Image (uiImage: image)
//                            .renderingMode(.original)
//                            .resizable()
//                            .aspectRatio(contentMode:.fill)
//                            .frame(height: 390).padding(.top,-90)
//                        .frame(maxWidth: UIScreen.main.bounds.width)}
//
//
//
//
//
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 40).fill(Color("background1").gradient).frame(width: 390,height: 600).padding(.top,-50)
//                        HStack{
//
//
//                            VStack{
//                                Text(name)
//                                    .font(.title3)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(Color("maincolorfont"))
//                                    .padding(.trailing)
//                                    .padding(.vertical,1.0)
//                                Text("idk")
//                                    .font(.callout)
//                                    .foregroundColor(Color("caption"))
//
//
//
//                            }.padding(.top,-40)
//
//                            Spacer()
//                            VStack{
//                                HStack{
//                                    Text("")
//                                        .foregroundColor(Color("caption"))
//                                    Image(systemName: "star.fill")
//                                        .foregroundColor(Color.yellow)
//                                        .padding(.vertical,8.0)
//
//                                }.padding(.top,-40)
//
//                                HStack{
//                                    Text("100")
//                                        .foregroundColor(Color("caption"))
//
//                                    //                                    Image(systemName: "bookmark")
//                                    //                                        .foregroundColor(Color("secondaryColor"))
//                                    //                                        .padding(.bottom,1)
//
//
//
//
//
////
////                                    Button {
////                                        isSelected.toggle()
////
////                                        if(isSelected == true){
////                                            vm.updatebktrue(fruit: p)
////
////                                        }else{vm.updatebkfalse(fruit: p)
////
////                                        }
////                                    } label: {
////                                        if(p.bk == bkk){
////                                            Image(systemName:"bookmark")
////                                        }else{
////                                            Image(systemName:"bookmark.fill")
////
////                                        }
////
////                                    }.padding(.top,-290).padding(.leading,310).font(.system(size: 30)).foregroundColor(Color("secondaryColor"))
////
////                                    Button{
////                                        //bk.isSelected.toggle()
////
////                                    } label: {
////                                        Image(
////                                            systemName: bk.isSelected ? "bookmark.fill": "bookmark").foregroundColor(Color("secondaryColor")
////                                            ).font(.system(size: 22))
////
////                                    }
//
//
//
//
//
//                                }
//                            }
//                        }.padding(.horizontal, 17)
//                            .padding(.bottom,480)
//                        LazyHGrid(rows: rows, spacing: 5) {
//                            ForEach(tagsticker){ tag in
//                                HStack {
//                                    Text(tag.tagName)
//                                        .foregroundColor(Color(tag.tagColor))
//                                    Image(systemName: tag.tagSymbol)
//                                        .foregroundColor(Color(tag.tagColor))
//
//                                }.padding(6).background{
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color(tag.tagColor),lineWidth: 2)
//                                        .foregroundColor(.clear)
//                                }
//
//                            }
//                        }.padding(.top,-300)
//
//                    }
//                }.frame(maxWidth: .infinity)
//                //Spacer()
//
//            }
//
//            .navigationBarTitleDisplayMode(.inline)
//
//        }
//
//    }
//
//
//    }

struct PlaceDeatil: View {
    
    
    //@StateObject private var PlaceDetail =  HomePage()
   // let bk: bookmark
    //let trend: trending
   // let name: String
    //let record: CKRecord
    //let imageURL: URL?
    //let rate : String
    //let cat : String
   // let bk:Int64
    let p : phhotos
    
//    let name: String
//    let record: CKRecord
//    let imageURL: URL?
//    let rate : String
//    let cat : String
//    let bk:Int64
    
    var body: some View {
        
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
                                Text("idk")
                                    .font(.callout)
                                    .foregroundColor(Color("caption"))
                                
                                
                                
                            }.padding(.top,-40)
                            
                            Spacer()
                            VStack{
                                HStack{
                                    Text("")
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
                                    
                                    
                                    
                                    
                                    
//
//                                    Button {
//                                        isSelected.toggle()
//
//                                        if(isSelected == true){
//                                            vm.updatebktrue(fruit: p)
//
//                                        }else{vm.updatebkfalse(fruit: p)
//
//                                        }
//                                    } label: {
//                                        if(p.bk == bkk){
//                                            Image(systemName:"bookmark")
//                                        }else{
//                                            Image(systemName:"bookmark.fill")
//
//                                        }
//
//                                    }.padding(.top,-290).padding(.leading,310).font(.system(size: 30)).foregroundColor(Color("secondaryColor"))
//
//                                    Button{
//                                        //bk.isSelected.toggle()
//
//                                    } label: {
//                                        Image(
//                                            systemName: bk.isSelected ? "bookmark.fill": "bookmark").foregroundColor(Color("secondaryColor")
//                                            ).font(.system(size: 22))
//
//                                    }
                                    
                                    
                                    
                                    
                                    
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
        
    }
}

//extension PlaceDeatil{
//
//    private var detail : some View{
//
//
//
//
//
//
//
//
//    }
//
//
//}



//struct PlaceDeatil_Previews: PreviewProvider {
//    static var previews: some View {
////        PlaceDeatil(bk: bookmark(bookmarkImage: "", tagImage: "", placeName: "", rating: "", isSelected: false, placeDetail: ""))
//
//        PlaceDeatil()
//
//    }
//}
