//
//  ReadJsonData.swift
//  dataDisplayJson
//
//  Created by Abraham Morales Arroyo on 3/27/24.
//

import Foundation
// in the json file there are a bunch of different objects we can dislplay we are going to be
// having 2 for the start

struct User: Codable, Identifiable {
    // we also need to make coding keys
    
    enum CodingKeys: CodingKey {
        case COMMUNITY_AREA
        case numbercalls
    }
    // we need tomake an ID for each item
    var id = UUID()
    var COMMUNITY_AREA: String
    var numbercalls: String // we could run into some issues
    
}
// class for reading data
class ReadJsonData: ObservableObject {
    @Published var users = [User]()
    init(){// function inside init, when we call this class it must work so we upload data function here
        loadData()
    }
    func loadData(){
        guard let url = Bundle.main.url(forResource: "march311json", withExtension: "json")
        else{
            print("json file not found")
            return
        }
        // we make a json decoder to find objects in jhson
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
    }
}
