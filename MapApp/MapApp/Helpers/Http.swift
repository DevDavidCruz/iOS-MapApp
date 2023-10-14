//
//  Http.swift
//  MapApp
//
//  Created by David Cruz on 10/14/23.
//

import Foundation


class Http {
    static public func Post<T: Encodable>(url: String, body: T?) async throws -> Data {
        do{
            let body_data = try JSONEncoder().encode(body)
            
            if let url = URL(string: url){
                var request = URLRequest(url:url)
                request.httpMethod = "Post"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = body_data
                
                let (result, response) = try await URLSession.shared.data(for: request)
                let http_response = response as! HTTPURLResponse
                
                switch http_response.statusCode{
                case 201,200:
                    return result
                case 404:
                    throw HttpError.unAuthorized
                case 400:
                    throw HttpError.badRequest
                default:
                    throw HttpError.unexpectedError
                }
                
            }
            else {
                throw HttpError.invalidURL
            }
        }
        catch{
            print(error.localizedDescription)
            throw HttpError.unexpectedError
        }
    }
}
