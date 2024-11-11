//
//  Protocol.swift
//  MyNetworkManager
//
//  Created by Cotne Chubinidze on 11.11.24.
//

public protocol MyNetworkService {
    func fetchNewsData(urlString: String, completion: @escaping @Sendable (Result<NewsResponse, Error>) -> Void)
}
