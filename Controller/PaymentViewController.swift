//
//  PaymentViewController.swift
//  psr_api_plugin
//
//  Created by Mouhamed Camara on 8/26/20.
//

import UIKit

public class PaymentViewController: UIViewController
{
    
    public func instantiate() -> PaymentViewController?
    {
        return UIStoryboard(name: "Payment", bundle: nil).instantiateViewController(withIdentifier: "\(PaymentViewController.self)") as? PaymentViewController
    }

    public override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
