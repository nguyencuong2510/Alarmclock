//
//  AlarmData.swift
//  Alarmclock
//
//  Created by cuongnv on 8/21/18.
//  Copyright © 2018 vn.com.vinicorp. All rights reserved.
//

import Foundation

class AlarmData {
    var titleTime: String
    var timeZone: String
    var alarmTime: String
    var repeatTime: String
    var soundTime: String
    var soozeTime: Bool
    
    init(titleTime: String,timeZone: String, alarmTime: String, repeatTime: String, soundTime: String, soozeTime: Bool) {
        self.titleTime = titleTime
        self.alarmTime = alarmTime
        self.repeatTime = repeatTime
        self.soundTime = soundTime
        self.soozeTime = soozeTime
        self.timeZone = timeZone
    }
}
