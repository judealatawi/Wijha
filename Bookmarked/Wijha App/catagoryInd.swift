//
//  catagoryInd.swift
//  Wijha
//
//  Created by Jude Alatawi on 27/05/1444 AH.
//
import SwiftUI


let cnavBarAppearance = UINavigationBar.appearance()






struct catagoryInd: View {
    
    @State private var  bkk: Int64 = 1
    @State var isSelected = false
    @StateObject private var vm = CKViewModel()
    
    
    let img : String
    let catgory : String
    let catDescription : String
    
    
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
                        
                        Image(img)
                            .resizable()
                            .frame(width: 130,height: 130)
                            .padding(.top,70)
                        
                        
                    }.padding(.top,-170)
                    
                    VStack{
                        Text(catgory)
                        
                            .font(.custom("", fixedSize: 16))
                            .fontWeight(. heavy)
                            .padding(.vertical,0)
                        Text(catDescription)
                            .font(.custom("", fixedSize: 14))
                            .fontWeight(.medium)
                    }.padding(.top,-10)
                    ScrollView{
                        
                        LazyVGrid (columns: [GridItem(.fixed(130))]) {
                            
                            ForEach(vm.place,id:\.self) { p in
                                if(p.cat == catgory){
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
            
        }
        
    }
    
}

func ccustomNavBarTitle() {
    
    navBarAppearance.largeTitleTextAttributes = [
        .foregroundColor : UIColor(Color("greencolor")),
    ]
    
}
