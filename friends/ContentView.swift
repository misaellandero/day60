//
//  ContentView.swift
//  friends
//
//  Created by Francisco Misael Landero Ychante on 03/03/20.
//  Copyright © 2020 Francisco Misael Landero Ychante. All rights reserved.
//

import SwiftUI
 
// MARK: - User
struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company, email, address, about: String
    var tags: [String]
    var friends: [Friend]
}

// MARK: - Friend
struct Friend: Codable {
    var id, name: String
}


struct ContentView: View {
    @State var results = [User]()
    
    var body: some View {
        List(results, id: \.id) { item in
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.name)
            }
        }.onAppear(perform: loadData)
    }
    func loadData(){
        guard let url = URL(string:"https://www.hackingwithswift.com/samples/friendface.json") else {
            print("URL invalida")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.results = decodedResponse
                    }
                    return
                }
            }
            print("La solicitud fallo \(error?.localizedDescription ?? "Error desconocido")")
        }.resume()
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
