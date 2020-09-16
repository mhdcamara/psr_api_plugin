//
//  PayDunyaSetup.swift
//  Pods
//
//  Created by Mouhamed Camara on 8/26/20.
//

import Foundation
import UIKit
import Alamofire

public class PayDunyaSetup
{
    public let MasterKey: String
    public let PrivateKey: String
    public let Token: String
    public let cancel_url: String
    public let return_url: String
    public let callback_url: String

    
    public init(MasterKey: String, PrivateKey: String, Token: String, cancel_url: String, return_url: String, callback_url: String)
    {
        self.MasterKey = MasterKey
        self.PrivateKey = PrivateKey
        self.Token = Token
        self.cancel_url = cancel_url
        self.return_url = return_url
        self.callback_url = callback_url
        
    }
    
    public func Action()->[String: Any]
    {
        let actions: [String: Any] = [
            "cancel_url": self.cancel_url,
            "return_url": self.return_url,
            "callback_url": self.callback_url
        ]
        return actions
    }
    
    
    public func setup()->HTTPHeaders
    {
        let Headers: HTTPHeaders = [
            "User-Agent": "paydunya-ios/v1.0",
            "Content-Type": "application/json",
            "PAYDUNYA-MASTER-KEY": self.MasterKey,
            "PAYDUNYA-PRIVATE-KEY": self.PrivateKey,
            "PAYDUNYA-TOKEN": self.Token,
            
        ]
        return Headers
    }
    
    public func Channels()->[String]
    {
        let channels: [String] = [
            "card",
        ]
        
        return channels
    }
}
