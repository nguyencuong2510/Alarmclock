//
//  RepeatViewController.swift
//  Alarmclock
//
//  Created by cuongnv on 8/21/18.
//  Copyright © 2018 vn.com.vinicorp. All rights reserved.
//

import UIKit

class RepeatViewController: UITableViewController {
    
    var allDay: [String] {
        return DateFormatter().weekdaySymbols
    }
    var listDayRepeat = [String](repeating: "", count: 7)
    
    var checkData: (index: Int,value: Bool) = (0, false) {
        didSet{
            listDayRepeat[checkData.index] = checkData.value ? allDay[checkData.index] : ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Repeat"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
    }
    
    @objc func handleSave() {
        NotificationCenter.default.post(name: Notification.Name.init(rawValue: "data"), object: listDayRepeat)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allDay.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(allDay[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.accessoryType = (cell.accessoryType == .checkmark ? .none : .checkmark)
        self.checkData.index = indexPath.row
        self.checkData.value = true
    }
}
