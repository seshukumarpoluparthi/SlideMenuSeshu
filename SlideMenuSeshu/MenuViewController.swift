//
//  MenuViewController.swift
//  SlideMenuSeshu
//
//  Created by apple on 11/15/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController {
    var delegate : SlideMenuDelegate?
    
    var options = ["one","two","three","four","five","six","seven"]
    
    @IBOutlet weak var menutableView: UITableView!
    
    @IBOutlet weak var btnCloseMenuOverlay: UIButton!
    
    var btnMenu : UIButton!
    
    @IBAction func onCloseMenuClick(_ button:UIButton!) {
         btnMenu.tag = 0
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menutableView.delegate = self
        menutableView.dataSource = self
        menutableView.reloadData()
        menutableView.tableFooterView = UIView()
    }
}

extension MenuViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.slideMenuItemSelectedAtIndex(Int32(indexPath.row))
    }
}

extension MenuViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let opt = options[indexPath.row]
        cell.lbl_Title.text = opt
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
