//
//  WebLoginVKViewController.swift
//  VKNetworkClone
//
//  Created by Denis Kazarin on 28.05.2021.
//

import UIKit
import Alamofire
import WebKit


class WebLoginVKViewController: UIViewController {
    @IBOutlet weak var logInView: WKWebView! {
        didSet {
            logInView.navigationDelegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7865879"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value:
                            "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "offline,friends,photos,groups"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68") ]
        let request = URLRequest(url: urlComponents.url!)
        logInView.load(request)
    }
    
    func getInfoRequests() {
        
        AF.request("https://api.vk.com/method/friends.get?fields=online&access_token=\(Session.shared.token)&v=5.131").responseJSON{ response in
            print("FRIENDS",response.value as Any)
        }
        
        AF.request("https://api.vk.com/method/groups.get?extended=1&filter=groups&access_token=\(Session.shared.token)&v=5.131").responseJSON{ response in
            print("GROUPS",response.value as Any)
        }
        
        AF.request("https://api.vk.com/method/photos.get?album_id=wall&rev=0&access_token=\(Session.shared.token)&v=5.131").responseJSON{ response in
            print("IMAGES",response.value as Any)
        }
        
    }
    
}

extension WebLoginVKViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") } .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"] else { return }
        
        decisionHandler(.cancel)
        
        Session.shared.token = token
        
        getInfoRequests()
    }
}
