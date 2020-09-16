//
//  PayDunyaStore.swift
//  Pods
//
//  Created by Mouhamed Camara on 8/26/20.
//

import Foundation
import UIKit
import Alamofire

public class PayDunyaStore
{
    public var name: String
    public var tagline: String
    public var postal_address: String
    public var phone: Int
    public var logo_url: String
    public var website_url: String
    public var total_amount: Int = 0
    public var description: String = ""
    public var items: [String: Any] = [:]
    public var taxes: [String: Any] = [:]
    
    
    public init(name: String, tagline: String, postal_address: String, phone: Int, logo_url: String,  website_url: String)
    {
        self.name = name
        self.tagline = tagline
        self.postal_address = postal_address
        self.phone = phone
        self.logo_url = logo_url
        self.website_url = website_url
        
    }
    
    
    public func store()->[String: Any]
    {
       
        let Parameters = [
           
            "store": [
                "name": self.name,
                "tagline": self.tagline,
                "postal_address": self.postal_address ,
                "phone": self.phone ,
                "logo_url": self.logo_url,
                "website_url": self.website_url
            ]
        ]
        return Parameters["store"]!
    }
   
    public func invoices()->[String: Any]
    {
        
        let invoice = [
            
            "items": [self.items],
            "taxes": [self.taxes],
            "total_amount": self.total_amount,
            
            "channels": ["card"],
            
            "description": self.description
            ] as [String : Any]
        
        return invoice
    }
}
