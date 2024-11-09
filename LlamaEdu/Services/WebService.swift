//
//  WebService.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(Int)
    case decodingError
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .invalidResponse:
            return "Resposta inválida do servidor"
        case .httpError(let code):
            return "Erro \(code) do servidor"
        case .decodingError:
            return "Erro ao processar resposta"
        case .serverError(let message):
            return message
        }
    }
}

class WebService {
    private let baseURL: String = "https://edu-bff.fly.dev"
    private let decoder: JSONDecoder
    
    init() {
        self.decoder = JSONDecoder()
        //decoder.dateDecodingStrategy = .iso8601
    }
    
    func test() async throws {
        print("oi")
        let endpoint = "/health"
        let url = baseURL + endpoint
        
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
           let jsonDict = jsonObject as? [String: Any] {
            print(jsonDict)
        } else {
            print("Failed to decode JSON")
        }
    }
    
    func uploadImage(file: URL, subject: String) async throws -> Essay {
        let endpoint = "/essays/upload"
        let fileData = try Data(contentsOf: file)
        print(subject)
        
        guard let url = URL(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var bodyData = Data()
        
        bodyData.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        bodyData.append("Content-Disposition: form-data; name=\"\(subject)\"\r\n\r\n".data(using: .utf8)!)
        bodyData.append("\(subject)\r\n".data(using: .utf8)!)
        //print(subject.data(using: .utf8)!)
        
        // Add file data
        bodyData.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(file.absoluteString)\"\r\n".data(using: .utf8)!)
        bodyData.append("Content-Type: application/octet-stream\r\n\r\n".data(using: .utf8)!)
        bodyData.append(fileData)
        
        // Add boundary suffix
        bodyData.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        // Set the body
        request.httpBody = bodyData
        
        print("Request body (preview):", String(data: bodyData.prefix(1000), encoding: .utf8) ?? "")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            // Try to parse error message if available
            //if let errorMessage = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
            //throw APIError.serverError(errorMessage.message)
            // }
            throw APIError.httpError(httpResponse.statusCode)
        }
        
        do {
            let result = try decoder.decode(Essay.self, from: data)
            return result
        } catch {
            print("Decoding error:", error)
            throw APIError.decodingError
        }
    }
    
    func fetchEssays() async throws -> [Essay] {
        let endpoint = "/essays"
        guard let url = URL(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.httpError(httpResponse.statusCode)
        }
        
        do {
            return try decoder.decode([Essay].self, from: data)
        } catch {
            print("Decoding error:", error)
            throw APIError.decodingError
        }
    }
}
