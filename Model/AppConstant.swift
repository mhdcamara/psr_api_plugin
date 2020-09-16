//
//  AppContant.swift
//  Alamofire
//
//  Created by Mouhamed Camara on 8/26/20.
//

import Foundation
import UIKit


public class AppConstant
{
    public let master_key: String
    public let private_key: String
    public var token: String
    public var invoice_token: String
    public let cancel_url: String
    public let return_url: String
    public let callback_url: String
    public var payment_url: String
    
    public init(master_key: String, private_key: String, token: String, invoice_token: String, cancel_url: String, return_url: String, callback_url: String, payment_url: String)
    {
        self.master_key = master_key
        self.private_key = private_key
        self.token = token
        self.invoice_token = invoice_token
        self.cancel_url = cancel_url
        self.return_url = return_url
        self.callback_url = callback_url
        self.payment_url = payment_url
    }
    
//    public let master_key = "9iQ6hGxZ-Ln51-3TH5-rJ8w-Ywj7ofR1umMW"
//    public let private_key = "live_private_p2Sfz3iXvVkvQXqr8tNLBL5s5Pr"
//    public var token = "qkiNmADLj8fiFarnVqVd"
//    public var invoice_token = ""
//    public let cancel_url = ""
//    public let return_url =  ""
//    public let callback_url = ""
//    public var payment_url = ""
}
