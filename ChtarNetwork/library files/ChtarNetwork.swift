//
//  ChtarNetwork.swift
//  ChtarNetwork
//
//  Created by Ragaie alfy on 3/11/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

open class ChtarNetwork: NSObject {
     static let shared = ChtarNetwork()
     static var LoaderIndicator : ChtarLoader!  = ChtarLoader()

    
    override init() {
        super.init()
    }
   
    
    open func request(requestWay : HTTPWay,urlString : String){
        
        
        
        
    }
    
    open func renderImageWith(urlString : String,imageView : UIImageView,placeHolderImageName : String){
        
        var activityondecator = UIActivityIndicatorView.init()
        activityondecator.activityIndicatorViewStyle = .whiteLarge
        activityondecator.color = UIColor.gray
        activityondecator.center = CGPoint.init(x: imageView.frame.width / 2, y: imageView.frame.height / 2)
        activityondecator.startAnimating()
        imageView.addSubview(activityondecator)
       
        URLSession.shared.dataTask(with: URL.init(string: urlString)!) { (data, response, error) in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async() {
                    imageView.image = UIImage.init(named: placeHolderImageName)
                   activityondecator.stopAnimating()
                }
                return
            }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
                activityondecator.stopAnimating()

            }
        }.resume()

    }

}
