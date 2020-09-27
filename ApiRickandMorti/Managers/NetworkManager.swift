//
//  NetworkManager.swift
//  ApiRickandMorti
//
//  Created by Никита Микрюков on 22.09.2020.
//  Copyright © 2020 Никита Микрюков. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    private let urlStringCharacter = "https://rickandmortyapi.com/api/character"
    private let urlStringEpisode = "https://rickandmortyapi.com/api/episode"
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getResultsCharacter(_ delivery: @escaping ([Result]) -> Void) {
        AF.request(urlStringCharacter)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let results = Result.getResult(from: value) else { return }
                    print(results)
                    delivery(results)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func getResultsEpisode(_ delivery: @escaping ([Result.Episode]) -> Void) {
        AF.request(urlStringEpisode)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let results = Result.getResultEpisode(from: value) else { return }
                    print(results)
                    delivery(results)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    
}
