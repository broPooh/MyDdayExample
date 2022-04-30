//
//  ViewController.swift
//  MyDdayExample
//
//  Created by bro on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewContainer1: UIView!
    @IBOutlet var viewContainer2: UIView!
    @IBOutlet var viewContainer3: UIView!
    @IBOutlet var viewContainer4: UIView!
    
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var dateImg1: UIImageView!
    @IBOutlet var dateImg2: UIImageView!
    @IBOutlet var dateImg3: UIImageView!
    @IBOutlet var dateImg4: UIImageView!
    
    @IBOutlet var coverImg1: UIImageView!
    @IBOutlet var coverImg2: UIImageView!
    @IBOutlet var coverImg3: UIImageView!
    @IBOutlet var coverImg4: UIImageView!
    
    @IBOutlet var dateAfter100Label: UILabel!
    @IBOutlet var dateAfter200Label: UILabel!
    @IBOutlet var dateAfter300Label: UILabel!
    @IBOutlet var dateAfter400Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUISetting()
        initTodayDate()
    }
    
    func initTodayDate() {
        let date = Date()
        dateAfter100Label.text = calculateDate(date, 100)
        dateAfter200Label.text = calculateDate(date, 200)
        dateAfter300Label.text = calculateDate(date, 300)
        dateAfter400Label.text = calculateDate(date, 400)
    }
    
    func initUISetting() {
        setDatePickerStyleFromVersion()
        initViewCornerSetting()
        initViewShadowSetting()
    }
    
    
    func initViewCornerSetting() {
        setViewCorner(dateImg1)
        setViewCorner(dateImg2)
        setViewCorner(dateImg3)
        setViewCorner(dateImg4)
        
        setViewCorner(coverImg1)
        setViewCorner(coverImg2)
        setViewCorner(coverImg3)
        setViewCorner(coverImg4)
        
        setViewCorner(viewContainer1)
        setViewCorner(viewContainer2)
        setViewCorner(viewContainer3)
        setViewCorner(viewContainer4)
    }
    
    func initViewShadowSetting() {
        setViewShadow(viewContainer1)
        setViewShadow(viewContainer2)
        setViewShadow(viewContainer3)
        setViewShadow(viewContainer4)
    }
    
    func setViewCorner(_ view : UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
    }
    
    func setViewShadow(_ view : UIView) {
        //view.layer.borderWidth = 1
        view.layer.masksToBounds = false
        //view.clipsToBounds = true
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.8
        
    }
    
    
    func setDatePickerStyleFromVersion() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
    }


    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        
        dateAfter100Label.text = calculateDate(sender.date, 100)
        dateAfter200Label.text = calculateDate(sender.date, 200)
        dateAfter300Label.text = calculateDate(sender.date, 300)
        dateAfter400Label.text = calculateDate(sender.date, 400)
    }
    
    func calculateDate(_ date : Date, _ day : Double) -> String {
        
        let afterDate = Date(timeInterval: 86400 * day, since: date)
        
        let format = DateFormatter()
        format.dateFormat = "yyyy년\nMM월 dd일"
        
        return format.string(from: afterDate)
    }
}

