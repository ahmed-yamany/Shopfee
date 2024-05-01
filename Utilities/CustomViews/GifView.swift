//
//  GifView.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 01/05/2024.
//

import SwiftUI
import WebKit

struct GifView: UIViewRepresentable {
    private var url: URL?
    private var request: URLRequest?
    
    init(_ url: URL) {
        self.url = url
    }
    
    init(request: URLRequest) {
        self.request = request
    }
   
    func makeUIView(context: Context) -> some WKWebView {
        let webView = WKWebView()
        
        if let url, let data = try? Data(contentsOf: url) {
            webView.load(
                data,
                mimeType: "image/gif",
                characterEncodingName: "UTF-8",
                baseURL: url.deletingLastPathComponent()
            )
        }
        
        if let request {
            webView.load(request)
        }
 
        webView.scrollView.isScrollEnabled = false
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.reload()
    }
}

#Preview {
    // swiftlint: disable all
    let url = Bundle.main.url(forResource: "loading", withExtension: "gif")!

    return GifView(url)
        .frame(width: 200, height: 200)
}
// swiftlint: enable all
