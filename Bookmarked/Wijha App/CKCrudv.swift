
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
                    let detail = record["details"] as? String ?? "N/A"
                    let trend = record["trend"] as? Int64 ?? 2
                    
                    print(record)
                    returnedItems.append(phhotos(name: name, record: record,imageURL: imageURL, rate: rate, cat : cat,bk: bk,detail: detail,trend: trend))
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

    func updatebkfalse(placef: phhotos) {
        let record = placef.record
        record ["bookmark"] = 0
        saveItem(record: record)
        }
    func updatebktrue(placef: phhotos) {
        let record = placef.record
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


struct phhotos: Hashable{
    let name: String
    let record: CKRecord
    let imageURL: URL?
    let rate : String
    let cat : String
    let bk:Int64
    let detail : String
    let trend : Int64
    
}

