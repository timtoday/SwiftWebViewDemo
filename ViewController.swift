//
//  ViewController.swift
//  SwiftWebViewDemo
//
//  Created by haiwang on 16/5/14.
//  Copyright © 2016年 wang12. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet var wv: UIWebView!
    @IBOutlet var loading: UIActivityIndicatorView!
    var success_load:Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://www.baidu.com");
        let request = NSURLRequest(URL: url!);
        wv.delegate = self;
        loading.hidesWhenStopped = true;
        loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray;
        loading.startAnimating();
        wv.loadRequest(request);
    }
    override func viewDidLayoutSubviews() {
        loading.center=self.view.center;
    }
    
    func exit_app(alert: UIAlertAction!) {
        // Do something...
        exit(0);
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        if(success_load<1){
            loading.stopAnimating();
            let alertController = UIAlertController(title: "网络错误", message: "请连接到网络后重新打开应用", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "确定", style: .Default, handler: exit_app)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    override func shouldAutorotate() -> Bool {
        return false;
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        success_load = success_load+1;
        loading.stopAnimating()
    }
    


}

