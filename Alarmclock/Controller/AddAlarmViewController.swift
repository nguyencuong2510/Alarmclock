//
//  AddAlarmViewController.swift
//  Alarmclock
//
//  Created by cuongnv on 8/21/18.
//  Copyright © 2018 vn.com.vinicorp. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController {
    
    let listSetting: [(String,String)] = [("Repeat", "Never"), ("Label", "Alarm"),("Sound", "impove")]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource_Delegate()
        self.navigationController?.navigationBar.topItem?.title = "Add Alarm"
        NotificationCenter.default.addObserver(self, selector: #selector(handleUnwid(notification:)), name: Notification.Name.init(rawValue: "data"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func dataSource_Delegate(){
        tableView.dataSource = self
        tableView.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    //MARK: Action
    @objc func handleUnwid(notification: Notification) {
        switch notification.object {
        case let repeatData as [String]:
            print(repeatData)
        default:
            break
        }
        guard let index = tableView.indexPathForSelectedRow else { return }
        tableView.reloadRows(at: [index], with: .automatic)
    }
    
    @IBAction func tappedSave(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func tappedCancle(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedSwitch(_ sender: UISwitch) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}

extension AddAlarmViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? 24 : 59
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = row <= 9 ? "0\(row)" : "\(row)"
        return component == 0 ? "\(title)" : "\(title)"
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
}

extension AddAlarmViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSetting.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == listSetting.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "lastCell", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = listSetting[indexPath.row].0
            cell.detailTextLabel?.text = listSetting[indexPath.row].1
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case NumberCellTable.OneCell.rawValue: performSegue(withIdentifier: "RepeatViewController", sender: nil)
        case NumberCellTable.TwoCell.rawValue: performSegue(withIdentifier: "LabelviewController", sender: nil)
        case NumberCellTable.ThreeCell.rawValue: performSegue(withIdentifier: "SoundViewController", sender: nil)
        case NumberCellTable.FourCell.rawValue: performSegue(withIdentifier: "SnoozeViewConroller", sender: nil)
        default:
            break
        }
    }
}
