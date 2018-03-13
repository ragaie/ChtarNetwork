//
//  ViewController.swift
//  ChtarNetwork
//
//  Created by Ragaie alfy on 3/11/18.
//  Copyright © 2018 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewShow: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        ChtarNetwork.LoaderIndicator.startAnimate()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    
    }

    
    
    
    override func viewDidAppear(_ animated: Bool) {
        ChtarNetwork.shared.renderImageWith(urlString: "https://www.cheatsheet.com/wp-content/uploads/2017/05/Puppy-basset-at-the-beach.jpg", imageView: imageViewShow, placeHolderImageName: "placeholder.png")
        super.viewDidAppear(true)
    }

}

