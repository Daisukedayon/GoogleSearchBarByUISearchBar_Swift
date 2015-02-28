//
//  ViewController.swift
//  GoogleSearchByUISearchBar_Swift
//
//  Created by 岡大輔 on 2015/03/01.
//  Copyright (c) 2015年 岡大輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UISearchBarDelegate,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var mySearchBar: UISearchBar!

    @IBOutlet weak var myPickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myPickerView.delegate = self
        self.mySearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if searchBar.text == "" {
            return
        }
        
        var site:CountryOfGoogleSite
        
        if self.myPickerView.selectedRowInComponent(0) == 0 {
            site = .JapaneseGoogle
            
        }else if self.myPickerView.selectedRowInComponent(0) == 1{
            site = .AmericalGoogle
        }else{
            site = .JapaneseGoogle
        }
        
        var ViewController:GoogleSearchViewColtroller = GoogleSearchViewColtroller()
        ViewController.googlesite = site
        ViewController.SearchString = searchBar.text
        ViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(ViewController, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if(row == 0){
            return "日本のGoogle"
        }else if(row == 1){
            return "American Google"
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }


}

