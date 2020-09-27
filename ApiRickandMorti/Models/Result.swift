//
//  Character.swift
//  ApiRickandMorti
//
//  Created by Никита Микрюков on 22.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//

struct Character: Decodable {
  let results: [Result]
}

struct Result: Decodable {
    let id: Int?
    let name: String?
    let species: String?
    let gender: String?
    let image: String?
    var episode: Episode?
    
    
    
    init(value: [String: Any]) {
        
        id = value["id"] as? Int
        name = value["name"] as? String
        species = value["species"] as? String
        gender = value["gender"] as? String
        image = value["image"] as? String

        
    }
    static func getResult(from value: Any) -> [Result]? {
        guard let value = value as? [String : Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { Result(value: $0)}
    }
    
    static func getResultEpisode(from value: Any) -> [Result.Episode]? {
        guard let value = value as? [String : Any] else { return [] }
        guard let results = value["results"] as? [[String: Any]] else { return [] }
        return results.compactMap { Result.Episode(value: $0)}
    }
    
    struct Episode: Decodable {
        let id: Int?
        let name: String?
        let air_date: String?
        let episode: String?
        
        init(value: [String: Any]) {
            
            id = value["id"] as? Int
            name = value["name"] as? String
            air_date = value["air_date"] as? String
            episode = value["episode"] as? String
        }
        
    }
}

