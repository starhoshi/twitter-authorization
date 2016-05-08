//
//  ViewController.swift
//  twitter-authorization
//
//  Created by Kensuke Hoshikawa on 2016/05/08.
//  Copyright © 2016年 star__hoshi. All rights reserved.
//

import UIKit
import SafariServices
import APIKit
import SVProgressHUD
let kCloseSafariViewControllerNotification = "kCloseSafariViewControllerNotification"

class ViewController: UIViewController,SFSafariViewControllerDelegate {
  
  var safariVC: SFSafariViewController?
  override func viewDidLoad() {
    super.viewDidLoad()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.safariLogin(_:)), name: kCloseSafariViewControllerNotification, object: nil)
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func clickLogin(sender: AnyObject) {
    safariVC = SFSafariViewController(URL:NSURL(string: "http://localhost:3000/users/sign_up")!, entersReaderIfAvailable: true)
    safariVC!.delegate = self
    presentViewController(safariVC!, animated: true, completion: nil)
  }
  
  func safariViewControllerDidFinish(controller: SFSafariViewController) {
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func safariLogin(notification: NSNotification) {
    // get the url form the auth callback
    let url = notification.object as! NSURL
    print("token: ",url.queryItems!["token"]!)
    KeychainManager.setToken(url.queryItems!["token"]!)
    self.safariVC!.dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func clickLogout(sender: AnyObject) {
    KeychainManager.clear()
    print("token removed")
  }
  
  @IBAction func clickFetch(sender: AnyObject) {
    let request = GetSongsRequest(token: KeychainManager.getToken())
    Session.sendRequest(request){result in
      
      SVProgressHUD.dismiss()
      switch result {
      case .Success(_):
        print("Success")
      case .Failure(let error):
        print(error)
      }
    }
  }
  
}
