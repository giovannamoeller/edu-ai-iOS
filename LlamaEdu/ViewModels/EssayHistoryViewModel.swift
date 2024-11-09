//
//  EssayHistoryViewModel.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import Foundation

enum HistoryState: Equatable {
    case idle
    case loading
    case success([Essay])
    case error(EssayCorrectionError)
    case empty
    
    static func == (lhs: HistoryState, rhs: HistoryState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.success, .success), (.error, .error), (.empty, .empty):
            return true
        default:
            return false
        }
    }
}

@MainActor
final class EssayHistoryViewModel: ObservableObject {
    @Published var essays: [Essay] = []
    @Published var state: HistoryState = .idle
    
    let webService: WebService
    
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
    
    func getEssays() async {
        self.state = .loading
        do {
            let result = try await webService.fetchEssays()
            self.state = .success(result)
            self.essays = result
        } catch {
            print(error.localizedDescription)
            if let apiError = error as? APIError {
                self.state = .error(.other(apiError.localizedDescription))
            } else {
                self.state = .error(.other("An unknown error occurred"))
            }
        }
    }
}
