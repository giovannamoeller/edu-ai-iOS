//
//  CultureView.swift
//  LlamaEdu
//
//  Created by Giovanna Moeller on 10/11/24.
//

import SwiftUI
import WebKit

struct CultureView: View {
    let url: URL
    
    var body: some View {
        NavigationStack {
            WebViewWrapper(url: url)
                .navigationTitle("Masbot Demo")
                .navigationBarTitleDisplayMode(.inline)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct WebViewWrapper: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        // Create WKWebView configuration
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        
        // Create and return WKWebView
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


#Preview {
    CultureView(url: URL(string: "https://hacka-cult-bot-production.up.railway.app/")!)
}
