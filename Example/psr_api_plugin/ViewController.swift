//
//  ViewController.swift
//  psr_api_plugin
//
//  Created by mhdcamara on 08/24/2020.
//  Copyright (c) 2020 mhdcamara. All rights reserved.
//

import UIKit
import psr_api_plugin


class ViewController: UIViewController
{

    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setp 3: - Call the circleImageView & downloadedFrom fuctions
        
        testImageView.circleImageView(borderColor: UIColor.white , borderWidth: 2.0)
        testImageView.downloadedFrom(link: "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg")
    }

}

