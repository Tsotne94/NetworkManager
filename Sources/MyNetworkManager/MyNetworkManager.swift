// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

enum NetworkError: Error {
    case invalidResponse
}

class NewsNetworkService: MyNetworkService {
    
    func fetchNewsData<T: Codable>(urlString: String, completion: @escaping @Sendable (Result<T, Error>) -> Void) {
        let url = URL(string: urlString)
        
        guard let url else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            if let error {
                completion(.failure(error))
            }
            
            guard let pasuxi = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard (200...299).contains(pasuxi.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            do {
                let returnedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(returnedData))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
