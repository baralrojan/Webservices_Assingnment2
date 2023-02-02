//
//  DogCodable.swift
//  A2_WebServices
//
//  Created by user231854 on 2/1/23.
//

import Foundation

struct DogsResponse: Decodable {
  let message: [String: [String]]
}

struct Dog {
  let name: String
}
