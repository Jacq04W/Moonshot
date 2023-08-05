//
//  Bundle-Decodable .swift
//  Moonshot
//
//  Created by Jacquese Whitson on 8/5/23.
//

import Foundation

extension Bundle {
    // find the data on the users phone if we cant crash the app
    // using T because we want this method to be able to decode and Type no matter what 
    func decode<T:Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
// put the reults in data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        // this if for when we find dates in our data convert it to look like the formatter
        let formatter = DateFormatter()
        //use this to convert the data to whoevers time zone
//        formatter.timeZone
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

// the decoded data you can use in your app will be here
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
// return the decoded data 
        return loaded
    }
}
