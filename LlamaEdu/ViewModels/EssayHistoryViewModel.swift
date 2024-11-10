//
//  EssayHistoryViewModel.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 09/11/24.
//

import SwiftUI

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
    private var pollingTask: Task<Void, Never>?
    
    init(webService: WebService = WebService()) {
        self.webService = webService
    }
    
    func getEssays() async {
        self.state = .loading
        do {
            let result = try await webService.fetchEssays()
            withAnimation {
                self.essays = result
            }
            
            if result.contains(where: { $0.totalScore == nil }) {
                startPolling()
            }
            
            withAnimation {
                if essays.isEmpty {
                    self.state = .empty
                } else {
                    self.state = .success(result)
                }
            }
        } catch {
            print(error.localizedDescription)
            if let apiError = error as? APIError {
                self.state = .error(.other(apiError.localizedDescription))
            } else {
                self.state = .error(.other("An unknown error occurred"))
            }
        }
    }
    
    private func startPolling() {
        // Cancel existing polling if any
        stopPolling()
        
        pollingTask = Task {
            while !Task.isCancelled {
                do {
                    // Wait 30 seconds before polling
                    try await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    
                    // Fetch updated essays
                    let updatedEssays = try await webService.fetchEssays()
                    self.essays = updatedEssays
                    self.state = .success(updatedEssays)
                    
                    // If no essays are still processing, stop polling
                    if !updatedEssays.contains(where: { $0.totalScore == nil }) {
                        stopPolling()
                        break
                    }
                } catch {
                    print(error)
                    // Continue polling even if there's an error
                    continue
                }
            }
        }
    }
    
    func stopPolling() {
        pollingTask?.cancel()
        pollingTask = nil
    }
}
