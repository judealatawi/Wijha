
import SwiftUI


struct category: View {
    let photos = [ photo(categoryphotos: "entertainmentPlaces",catg: "Entertaiment",catgoryDescription: "Have fun with your loved ones and go out to those places "),
                   photo(categoryphotos: "vegan friendly",catg: "Vegan Friendly",catgoryDescription: "Where you can find a places with a variety of vegan options"),
                   photo(categoryphotos: "budget friendly",catg: "Budget Friendly",catgoryDescription: "These places are friendly for people with small amount of budget"),
                   photo(categoryphotos: "memorable",catg: "Memrable Places",catgoryDescription: "Where you can party and have fun with your family & friends"),
                   photo(categoryphotos: "24Hour",catg: "24H",catgoryDescription: "You can go out late and these places are welcoming you"),
                   photo(categoryphotos: "studyCafe",catg: "Study Places",catgoryDescription: "Where you can get focused more with your work"),
                   photo(categoryphotos: "familyplaces",catg: "Childrn And Family ",catgoryDescription: "These places are suitable for big families and kids"),
                   photo(categoryphotos: "NewPlaces",catg: "New Places",catgoryDescription: "Isn’t it a good feeling to go to a new place?")
    ]
    
    var body: some View {
        NavigationView{
            
            
            VStack {

                Image("header")
                    .resizable()
                    .frame(height: 170)
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
                .environment(\.locale, Locale(identifier: "en"))
        }
    }
}
