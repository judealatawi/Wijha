
import SwiftUI


struct category: View {
    let photos = [ photo(categoryphotos: "entertainmentPlaces"),
                   photo(categoryphotos: "vegan friendly"), photo(categoryphotos: "budget friendly"), photo(categoryphotos: "memorable"), photo(categoryphotos: "24Hour"), photo(categoryphotos: "studyCafe"),photo(categoryphotos: "familyplaces"),photo(categoryphotos: "NewPlaces")]
    
    var body: some View {
        NavigationView{
            
            
            VStack {
//                Image("header")
//                    .resizable().position(x:195,y: 120)
//                    .frame(width: 391, height:275).ignoresSafeArea()
//
                Image("header")
                    .resizable()
                    .frame(width: 400, height: 170)
                    .padding(.top,-180)
                    //.ignoresSafeArea()
                
                ZStack{
                    ScrollView {
                        LazyVGrid (columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]){
                            ForEach(photos){ sub in
                                VStack(alignment: .leading){
                                    NavigationLink(destination: BookmarkView()){
                                        Image(sub.categoryphotos).resizable().frame(width: 200,height: 200).padding(.top,-40)
                                    }
                                }
                                
                            }
                        }.padding(.top,25)
                       
                    }
                    
                }
            }
          
        }
        //.navigationBarBackButtonHidden()//end of navigation view
    }
    struct photo: Identifiable {
        var id = UUID()
        var categoryphotos: String
        
    }
    
    struct category_Previews: PreviewProvider {
        static var previews: some View {
            category()
        }
    }
}
