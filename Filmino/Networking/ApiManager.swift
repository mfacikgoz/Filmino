//
//  ApiManager.swift
//  Filmino
//
//  Created by Furkan Açıkgöz on 5.06.2024.
//

import Foundation
import Alamofire

class ApiManager {
    
    private var baseUrl : String {
        "https://api.themoviedb.org/3"
    }
    
    private var authToken: String {
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMDBiODExOWY1NWU0NmVhOTU3MDlhYjg2M2E3NGIyZiIsInN1YiI6IjY1OWVmODdkNjcyOGE4MDI1YjFmM2JiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YPBbPa_IZ8jiesax5_8s1WIYpXy3AVKvxiX8uGyZCpY"
    }
    
    static let shared: ApiManager = ApiManager()
    
   init() { }
    
    func execute<Response: Decodable>(path: String,
                                      method: HTTPMethod,
                                      parameters: [String: Any],
                                      expect: Response.Type) async throws -> Response {
        try await withCheckedThrowingContinuation { continuation in
            AF.request(URL(string: "\(baseUrl)\(path)")!,
                       method: method,
                       parameters: parameters,
                       headers: ["Authorization": "Bearer \(authToken)",
                                 "accept": "application/json"])
            .responseDecodable(of: Response.self) { response in
                continuation.resume(with: response.result.mapError { error in
                    error as Error
                })
            }
        }
    }
}
