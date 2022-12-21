
import SwiftUI


struct category: View {
    let photos = [ photo(categoryphotos: "entertainmentPlaces",catg: "Entertaiment",catgoryDescription: "Here you can find Entertament places"),
                   photo(categoryphotos: "vegan friendly",catg: "Vigan Friendly",catgoryDescription: "Here you can find Vigan Frindly Places"),
                   photo(categoryphotos: "budget friendly",catg: "Budget Friendly",catgoryDescription: "Here you can find Budget Frindly Places"),
                   photo(categoryphotos: "memorable",catg: "Memrable Places",catgoryDescription: "Here you can find Fun Places for making memories"),
                   photo(categoryphotos: "24Hour",catg: "24H",catgoryDescription: "Here you can find Places that are open 24H"),
                   photo(categoryphotos: "studyCafe",catg: "Study Places",catgoryDescription: "Here you can find Quite Studing Places"),
                   photo(categoryphotos: "familyplaces",catg: "Childrn And Family ",catgoryDescription: "Here you can find Childern Frindly Places"),
                   photo(categoryphotos: "NewPlaces",catg: "New Places",catgoryDescription: "Here you can find New Places in Riyadh")
    ]
    
    var body: some View {
        NavigationView{
            
            
            VStack {

                Image("header")
                    .resizable()
                    .frame(width: 400, height: 170)
                    .padding(.top,-180)
                
                ZStack{
                    ScrollView {
                        LazyVGrid (columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]){
                            ForEach(photos){ sub in
                                VStack(alignment: .leading){
                                    NavigationLink(destination: catagoryInd(img: sub.categoryphotos,catgory: sub.catg, catDescription: sub.catgoryDescription)){
                                        Image(sub.categoryphotos).resizable().frame(width: 200,height: 200).padding(.top,-40)
                                    }
                                }
                                
                            }
                        }.padding(.top,25)
                       
                    }
                    
                }
            }
          
        }
    }
    struct photo: Identifiable {
        var id = UUID()
        var categoryphotos: String
        var catg : String
        var catgoryDescription : String
        
    }
    
    struct category_Previews: PreviewProvider {
        static var previews: some View {
            category()
        }
    }
}
