////
////  CloudKitUser.swift
////  MC
////
////  Created by Jude Alatawi on 11/05/1444 AH.
//
//
//import SwiftUI
//import CloudKit
//
//class CloudKitUserViewModel : ObservableObject {
//    @Published var premitionStates: Bool  = false
//    @Published var isSignedIniCloud: Bool  = false
//
//
//    @Published var error: String = ""
//    @Published var userName: String=""
//
//    init(){
//        getiCloudStates()
//        requstPremisstion()
//        fitchiCloudUserRecored()
//    }
//
//    private func getiCloudStates(){
//        CKContainer(identifier: "iCloud.MC2").accountStatus { [weak self ] returnedStates, returnedError in
//            DispatchQueue.main.async{
//                switch returnedStates {
//                case .available :
//                    self?.isSignedIniCloud = true
//                case .restricted :
//                    self?.error = CloudKitError.iCloudAccountRestrected.rawValue
//                case .noAccount :
//                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
//                case .couldNotDetermine :
//                    self?.error = CloudKitError.iCloudAccountNotDetermend.rawValue
//                default:
//                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
//                }
//            }
//        }
//    }
//
//    enum CloudKitError :String, LocalizedError{
//        case iCloudAccountNotFound
//        case iCloudAccountNotDetermend
//        case iCloudAccountRestrected
//        case iCloudAccountUnknown
//
//    }
//    func requstPremisstion(){
//        CKContainer(identifier: "iCloud.MC2").requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStates, returnedError in
//            DispatchQueue.main.async {
//                if returnedStates == .granted{
//                    self?.premitionStates = true
//                }
//            }
//        }
//    }
//
//    func fitchiCloudUserRecored(){
//        CKContainer(identifier: "iCloud.MC2").fetchUserRecordID {[weak self] returnedID, returnedError in
//            if let id = returnedID{
//                self?.discoveriCloudUser(id: id)
//            }
//        }
//    }
//
//
//    func discoveriCloudUser(id: CKRecord.ID){
//        CKContainer(identifier: "iCloud.MC2").discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnrdError in
//            DispatchQueue.main.async{
//                if let name = returnedIdentity?.nameComponents?.givenName{
//                    self?.userName = name
//
//                }
//                    //returnedIdentity?.lookupInfo?.emailAddress
//            }
//        }
//
//    }
//
//}
//
//struct CloudKitUser: View {
//
//    @StateObject private var vm = CloudKitUserViewModel()
//
//
//    var body: some View {
//        VStack{
//            Text("IS Signed In: \(vm.isSignedIniCloud.description.uppercased())")
//            Text(vm.error)
//            Text("Prmetion: \(vm.premitionStates.description.uppercased())")
//            Text("NAME: \(vm.userName)")
//        }
//
//    }
//}
//
//struct CloudKitUser_Previews: PreviewProvider {
//    static var previews: some View {
//        CloudKitUser()
//    }
//}
//
