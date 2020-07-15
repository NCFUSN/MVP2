//
//  NetworkService.swift
//  MVPwithNetworking
//
//  Created by SilentObserver on 15/07/2020.
//  Copyright © 2020 Nathan Furman. All rights reserved.
//

import Foundation

protocol NetworkServiceProtocol {
    func getComments(completion: @escaping(Result<[Comment]?, Error>) ->())
}

class NetworkService: NetworkServiceProtocol {
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let object = try JSONDecoder().decode([Comment].self, from: data!)
                completion(.success(object))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
