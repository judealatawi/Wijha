//
//import SwiftUI
//
//struct SwiftUIView: View {
//    @StateObject private var vm = CKViewModel()
//    
//    var body: some View {
//        NavigationView{
//            VStack{
//                
//                //button
//                List{
//                    ForEach(vm.place, id: \.self) { fruit in
//                        
//                        
//                        
//                        HStack {
//                            
//                        Text(fruit.name)
//                        Text(fruit.rate)
//                        Image(systemName: "star")
//                            
//                        if let url = fruit.imageURL, let data = try? Data (contentsOf: url),
//                        let image = UIImage(data: data) {
//                        Image (uiImage: image)
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                            
//                            
//                        }
//                            
//                        }   .onTapGesture {
//                               // vm.updateItemCKViewModel(fruit: fruit)
//                            }
//
//                    } .onDelete (perform: vm.deleteItemCKViewModel)
//                }.listStyle(PlainListStyle())
//            }.padding()
//                .navigationBarHidden(true)
//            
//        }
//        
//    }
//}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
