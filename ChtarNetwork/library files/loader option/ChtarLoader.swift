//
//  ChtarLoader.swift
//  ChtarNetwork
//
//  Created by Ragaie alfy on 3/13/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

 class ChtarLoader: NSObject {
    private var loaderView : UIWebView!
    
    private  var  plurView : UIView!
    private var animate : Bool! = false
    var type : LoaderType! = .DefaultLoader
    
    enum LoaderType {
        case DefaultLoader
        case GifLoader
        case CustomLoader
        
    }
    
    override init() {
        super.init()
    }
    
    open func startAnimate(){
      
        if plurView == nil {
            loadLoaderDefault()
            
            animate = true
        }
        else{
            plurView.isHidden = false
            animate = true
        }
//        if loaderView == nil {
//            LoaderGif()
//            animate = true
//        }
//        else{
//           loaderView.isHidden = false
//            animate = true
//        }
    }
    
    
    
    open func stopAnimate(){
        
        plurView.isHidden = true

        //loaderView.isHidden = true
    }
    
    
    func loadLoaderDefault(){
        
        let viewWidth = (UIScreen.main.bounds.width / 8)
        
        let x = (UIScreen.main.bounds.width / 2) - (viewWidth / 2)
        let y = (UIScreen.main.bounds.height / 2) - (viewWidth / 2)
        
         plurView = UIView.init(frame: CGRect.init(x: x, y: y, width: viewWidth, height: viewWidth))
        plurView.backgroundColor = UIColor.black
        plurView.layer.cornerRadius = 12
       // plurView.alpha = 0.5
        
        let activity = UIActivityIndicatorView.init()
        activity.startAnimating()
        activity.activityIndicatorViewStyle = .whiteLarge
        activity.startAnimating()
        activity.center = CGPoint.init(x: plurView.frame.width / 2, y: plurView.frame.height / 2)
        
        plurView.addSubview(activity)
        
        UIApplication.shared.keyWindow?.addSubview(plurView)

    }
    
    func LoaderCustom(){
        
        
    }
    
    
    
    
    func LoaderGif(){
        
        
       // var backGroundView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
      //  backGroundView.backgroundColor = UIColor.clear
        // backGroundView.alpha = 0.1
        var viewHight = UIScreen.main.bounds.height / 13
        var viewWidth = (UIScreen.main.bounds.width / 10) * 8
        
        var x = (UIScreen.main.bounds.width / 8)
        var y = (UIScreen.main.bounds.height / 2) - (viewHight / 2)
        loaderView  = UIWebView.init(frame: CGRect.init(x: x, y: y, width: viewWidth, height: viewHight))
        
   
        let url = Bundle.main.url(forResource: "Loader", withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        loaderView.scalesPageToFit = true
        loaderView.contentMode = UIViewContentMode.scaleAspectFit
        loaderView.isUserInteractionEnabled = false
        loaderView.backgroundColor = UIColor.clear
        loaderView.isOpaque = false
        loaderView.allowsInlineMediaPlayback = true
        loaderView.allowsPictureInPictureMediaPlayback = true
        loaderView.allowsLinkPreview = true
        loaderView.load(data, mimeType: "image/gif", textEncodingName: "UTF-8", baseURL: NSURL() as URL)
        
        
      //  backGroundView.addSubview(loaderView)
        //SettingsController.loaderView = loaderView
        
        
        UIApplication.shared.keyWindow?.addSubview(loaderView)
        
        
    }
    
    
}
