//
//  HomeViewController.swift
//  app_cemig
//
//  Created by Alaene Rufino de Sousa on 20/04/18.
//  Copyright © 2018 Alaene Rufino de Sousa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logoffButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cpfLabel: UILabel!
    @IBOutlet var idadeLabel: UILabel!
    
    @IBAction func profileConsumerButton(_ sender: UIButton) {
        
        let viewController:UIViewController = UIStoryboard(name: "ConsumerProfile", bundle: nil).instantiateViewController(withIdentifier: "ConsumerProfileViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    @IBAction func editProfileButton(_ sender: UIButton) {
        let viewController:UIViewController = UIStoryboard(name: "ConsumerProfile", bundle: nil).instantiateViewController(withIdentifier: "ConsumerProfileViewStoryboard") as UIViewController
        
        self.present(viewController, animated: false, completion: nil)
        
    }
    @IBAction func deleteProfileButton(_ sender: UIButton) {

    }
}
