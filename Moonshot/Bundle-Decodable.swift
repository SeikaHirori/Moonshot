//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Seika Hirori on 4/9/23.
//

import Foundation

extension Bundle {
    func decode<T>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        
        return loaded
    }
}
