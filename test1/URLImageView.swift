//
//  URLImageView.swift
//  test1
//
//  Created by И.В. Винокуров
//

import UIKit

class URLImageView: UIImageView {
    func downloadImage(withBaseURL baseURL: URL, cellForRowAt row: Int) {
        let imageIndex = row + 1
        var imageURL = URLComponents(string: baseURL.absoluteString)!
        imageURL.queryItems = [
          URLQueryItem(name: "text", value: String(imageIndex))
        ]
        
        var request = URLRequest(url: imageURL.url!)
        debugPrint(imageURL.url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                self.image = nil
                return
            }
            
            DispatchQueue.main.async {
                if let imageByURL = UIImage(data: data) {
                    self.image = imageByURL
                } else {
                    self.image = nil
                }
            }
        }.resume()
    }
}
