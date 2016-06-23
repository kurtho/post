//
//  ViewController.swift
//  FireBaseTest
//
//  Created by KurtHo on 2016/6/22.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
class ViewController: UIViewController {
    @IBAction func readWithCondiction(sender: AnyObject) {
        let ref = FIRDatabase.database().reference()
        let postRef = ref.child("posts")
        postRef.queryOrderedByChild("title").queryEqualToValue("title")
            .observeEventType(.ChildAdded, withBlock: {
                snapshot in
                print("title: \(snapshot.value!.objectForKey("title"))")
                print("uid: \(snapshot.value!.objectForKey("uid"))")
                print("message: \(snapshot.value!.objectForKey("message"))")
                
            })
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    
    @IBAction func write(sender: AnyObject) {
        if let user = FIRAuth.auth()?.currentUser{
            let ref = FIRDatabase.database().reference()
            let postRef = ref.child("posts").childByAutoId()
            postRef.setValue(["uid": user.uid, "title": titleTextField.text!, "message": messageTextField.text!])
            
            //透過id知道使用者的行為
        }else {
            //尚未登入的使用者行為可以給予一個alert
            
        }
    }
    
    @IBAction func read(sender: AnyObject) {
        let ref = FIRDatabase.database().reference()
        let postRef = ref.child("posts")
        postRef.observeEventType(.ChildAdded, withBlock: {
            snapshot in
            print("title: \(snapshot.value!.objectForKey("title"))")
            print("uid: \(snapshot.value!.objectForKey("uid"))")
            print("message: \(snapshot.value!.objectForKey("message"))")
            
            })
    }
    
    
    
    @IBOutlet weak var fbView: UIView!
    
    let logingButton = FBSDKLoginButton()
    
    @IBAction func writeData(sender: AnyObject) {
        
        let ref = FIRDatabase.database().reference()
        //reference指向firebase網站
//        ref.child("cust").child("cust1").setValue(["name": "Taipei 101"])
        let childRef = ref.child("cust").childByAutoId()
        childRef.child("cust2").setValue(["name": "Taipei 102"])
        //自動加
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logingButton.readPermissions = ["public_profile", "email", "user_friends"]
        logingButton.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        logingButton.center = self.fbView.center
        self.view.addSubview(logingButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: FBSDKLoginButtonDelegate {
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        let credential =  FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
        FIRAuth.auth()?.signInWithCredential(credential, completion: nil)
    }
    
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        do {
           try FIRAuth.auth()?.signOut()
        }catch {
            print("sign out error: \(error)")
        }
    }
    
}
