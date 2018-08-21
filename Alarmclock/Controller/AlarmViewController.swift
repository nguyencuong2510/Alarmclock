//
//  ViewController.swift
//  Alarmclock
//
//  Created by cuongnv on 8/21/18.
//  Copyright © 2018 vn.com.vinicorp. All rights reserved.
//

import UIKit
import UserNotifications

class AlarmViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addBtnAlarm: UIBarButtonItem!
    var listAlarm = [AlarmData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib.init(nibName: "AlarmCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AlarmCollectionViewCell")
        self.setConflowLayout()
    }
    
    func setConflowLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    @IBAction func TappedAdd(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let addVC = storyboard.instantiateViewController(withIdentifier: "AddAlarmViewController") as! AddAlarmViewController
        addVC.preferredContentSize = CGSize(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.5)
        setUpPopOverNavigation(to: addVC, barItem: addBtnAlarm)
    }
}

extension AlarmViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCollectionViewCell", for: indexPath) as? AlarmCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.timeView.text = "18:00"
        cell.timeZone.text = "AM"
        cell.alarmLabel.text = "Alarm"
        cell.repeatLabel.text = "Repeat: Never"
        cell.soundLabel.text = "Sound: Radar"
        cell.snoozeLabel.isOn = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 2);
    }
}

