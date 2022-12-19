
//
//  CloudKitCrud.swift
//  MC
//
//  Created by Jude Alatawi on 14/05/1444 AH.
//

import SwiftUI
import CloudKit

class CKViewModel: ObservableObject{
    @Published var text : String = ""
    @Published var place: [phhotos] = []
    
    init(){
        fetchItemsCKViewModel()
    }
    private func saveItem(record: CKRecord) {
        CKContainer(identifier:"iCloud.MC2").publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")

            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                self?.text = ""
                self?.fetchItemsCKViewModel()
            }
        }
    }
    
    func fetchItemsCKViewModel() {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "photos", predicate: predicate)
        let queryOperation = CKQueryOperation (query: query)

        var returnedItems: [phhotos] = []
        

            queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
                switch returnedResult {
                case.success (let record):
                    guard let name = record["itemText"] as? String else { return }
                    let imageAsset = record["itemPic"] as? CKAsset
                    let imageURL = imageAsset?.fileURL
                    
                    let rate = record["itemSubText"] as? String ?? "N/A"
                    let cat = record["category"] as? String ?? "N/A"
                    let bk = record["bookmark"] as? Int64 ?? 2

                    
                    print(record)
                    returnedItems.append(phhotos(name: name, record: record,imageURL: imageURL, rate: rate, cat : cat,bk: bk))
                case .failure (let error):
                    print("Error recordMatchedBlock: \(error)")
                }
            }
                queryOperation.queryResultBlock = { [weak self] returnedResult in
                    print("RETURNED queryResultBlock: \(returnedResult)")
                    DispatchQueue.main.async {
                    self?.place = returnedItems
                    }
                    
                }
        
        addOperationCKViewModel(operation: queryOperation)
    }
  
    func addOperationCKViewModel(operation: CKDatabaseOperation) {
        CKContainer(identifier:"iCloud.MC2").publicCloudDatabase.add(operation)
    }

    func updatebkfalse(fruit: phhotos) {
        let record = fruit.record
        record ["bookmark"] = 0
        saveItem(record: record)
        }
    func updatebktrue(fruit: phhotos) {
        let record = fruit.record
        record ["bookmark"] = 1
        saveItem(record: record)
        }
        
        func deleteItemCKViewModel(indexSet: IndexSet) {
            guard let index = indexSet.first else { return }
            let place = place[index]
            let record = place.record
            CKContainer(identifier:"iCloud.MC2").publicCloudDatabase.delete (withRecordID: record.recordID) { [weak self]
                returnedRecordID, returnedError in
                self?.place.remove(at: index)
            }

        }
    
  
}

struct CKCrud: View {
    
    @StateObject private var vm = CKViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //header
                //textField
                //button
                List{
                    ForEach(vm.place, id: \.self) { h in
                        
                        
                        
                        HStack {
                        Text(h.cat)
                        Text(h.name)
                        Text(h.rate)
                        Image(systemName: "star")
                            
                        if let url = h.imageURL, let data = try? Data (contentsOf: url),
                        let image = UIImage(data: data) {
                        Image (uiImage: image)
                        .resizable()
                        .frame(width: 50, height: 50)
                            
                            
                        }
                            
                        }   .onTapGesture {
                                vm.updatebkfalse(fruit: h)
                            }

                    } .onDelete (perform: vm.deleteItemCKViewModel)
                }.listStyle(PlainListStyle())
            }.padding()
                .navigationBarHidden(true)
            
        }
        
    }
    
}


struct CKCrud_Previews: PreviewProvider {
    static var previews: some View {CKCrud()}
}//Preview

extension CKCrud {
    
    private var header: some View {
        Text("CloudKit CRUD")
            .font(.headline)
            .underline()
    }
    
    private var textField : some View{
        TextField("Add somthign here...", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
}

struct phhotos: Hashable{
    let name: String
    let record: CKRecord
    let imageURL: URL?
    let rate : String
    let cat : String
    let bk:Int64
    
}

