//
//  CodableViewModel.swift
//  SwiftUI_Concepts
//
//  Created by KANISHK VIJAYWARGIYA on 06/03/22.
//

import Foundation

/// CODABLE = Decodable + Encodable

struct CustomerModel: Identifiable, Codable {
    let id: String // reason for using String in place of UUID(), as ID will come from internet, most often.
    let name: String
    let points: Int
    let isPremium: Bool
    
    // these all the steps are done by Codable protocol behind the seen.
    /**
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        case isPremium
        // case isPremium = "is_premium" // if we require to customize the enum keys.
    }
    
    // default initializer that we are using down below in getData() let newCustomer = CustomerModel(...)
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    // explicitly decode
    // this will decode for us
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    // explicitly encode
    // inbult func ...just opposite of decodable
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(points, forKey: .points)
        try container.encode(isPremium, forKey: .isPremium)
    }
     **/
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    // making a decodable protocol data
    func getData() {
        guard let data = getJSONData() else { return }
        // for decodable -> GET
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
        /** or
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print("Error Decoding: \(error.localizedDescription)")
        }
         */
        
        //print("JSON Data: \(data)")
        //let jsonString = String(data: data, encoding: .utf8)
        //print("JSON String: \(jsonString)")
        
        // manually decoded the data.
        /**
        if
            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = localData as? [String: Any],
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let points = dictionary["points"] as? Int,
            let isPremium = dictionary["isPremium"] as? Bool {
            
            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
            customer = newCustomer
        }
         **/
        
    }
    
    // making a fake data, converting into json data & then returning it to our app.
    func getJSONData() -> Data? {
        // for encodable -> POST
        let customer = CustomerModel(id: "111", name: "Emily", points: 100, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
        /**
        let dictionary: [String: Any] = [
            "id" : "12345",
            "name" : "Joe",
            "points" : 5,
            "isPremium" : true
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
         **/
        
        return jsonData
    }
}
