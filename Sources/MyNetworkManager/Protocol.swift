//
//  Protocol.swift
//  MyNetworkManager
//
//  Created by Cotne Chubinidze on 11.11.24.
//

public protocol MyNetworkService {
    func fetchNewsData<T: Codable>(urlString: String, completion: @escaping @Sendable (Result<T, Error>) -> Void)
}
