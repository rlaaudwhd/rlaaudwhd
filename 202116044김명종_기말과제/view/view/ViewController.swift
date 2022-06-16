//
//  ViewController.swift
//  view
//
//  Created by 203a38 on 2022/06/16.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var mywebview: WKWebView!
    func loadWebPage(_ url : String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        mywebview.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWebPage("https://sports.news.naver.com/kbaseball/index")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!,withError error: Error) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
            
        }
        return strUrl
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    
    @IBAction func btnGoSite1(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "doosan", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        mywebview.load(myRequest)
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "samsung", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        mywebview.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        mywebview.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        mywebview.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        mywebview.goBack()
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        mywebview.goForward()
    }
    

}

