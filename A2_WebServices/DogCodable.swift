//
//  DogCodable.swift
//  A2_WebServices
//
//  Created by user231854 on 2/1/23.
//

import Foundation

struct DogBreed: Decodable {
  let message: [String: [String]]
}

struct Breed: Decodable {
  let name: String
}

