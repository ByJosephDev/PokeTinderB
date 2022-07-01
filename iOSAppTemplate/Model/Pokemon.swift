//
//  Pokemon.swift
//  iOSAppTemplate
//
//  Created by Joseph Puma on 01/07/2022.
//

struct Pokemon: Codable {
     let count: Int?
     let next: String?
     let results: [Result]
 }

 struct Result: Codable {
     let name: String
     let url: String
 }
