////
////  CodableSpaceShipView.swift
////  ReplicateUI
////
////  Created by Damian Jardim on 5/2/25.
////
//
//import SwiftUI
//
//// step 1 - Codable Data Model
//struct CodableAppUser: Identifiable {
//    let id:UUID
//    let name: String
//    let age: Int
//    
//    init(name: String, age: Int){
//        self.id = UUID()
//        self.name = name
//        self.age = 0
//    }
//}
//
//// step 2 - view model
//struct CodableAppUser: ObservableObject {
//    @Published var users: [] = []
//    
//    init(){
//        loadUsers()
//    }
//    
//    func loadUsers() {
//        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
//            print("JSON file not found")
//            return
//        }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            let decodedUsers = try JSONDecoder().decode([AppUser].self, from: data)
//            users = decodedUsers
//        } catch {
//            print("Error decoding JSON: \(error)")
//        }
//    }
//}
//
//// step 3 - create the view
//
//// step 4 - read json file
//struct CodableSpaceShipView: View {
//    
//    let json = """
//    [
//        {
//            "id": 1,
//            "name": "Paul",
//            "age": 38
//        },
//        {
//            "id": 2,
//            "name": "Andrew",
//            "age": 40
//        }
//    ]
//    """
//    
//    var jsonData = json.data(using: .utf8)
//    
//    
//    
//    var body: some View {
//        VStack{
//            Text("CodableSpaceShipView")
//            
//            Button("ENCODE"){
//                do {
//                    let appUser = AppUser(name:"John", age:31)
//                    let encoder = JSONEncoder()
//                    let data = try encoder.encode(appUser)
//
//                } catch {
//                    print("Whoops, an error occured: \(error)")
//                }
//            }
//            
//            Button("DECODE"){
//                let decoder = JSONDecoder()
//                let secondUser = try decoder.decode(AppUser.self, from: data)
//            }
//            
//            
//        }
//        
//    }
//}
//
//
//#Preview {
//    CodableSpaceShipView()
//}
