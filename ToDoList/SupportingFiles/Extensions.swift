//
//  Extensions.swift
//  ToDoList
//
//  Created by 房子祺 on 12/1/23.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String : Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            print("Warning: Failed to encode object. Empty dict returned.")
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        }catch {
            return [:]
        }
    }
}
