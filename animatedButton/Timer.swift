//
//  Timer.swift
//  animatedButton
//
//  Created by Manolescu Mihai Alexandru on 04/05/2018.
//  Copyright © 2018 AVP. All rights reserved.
//

import Foundation
import UIKit

var seconds = 3 //This variable will hold a starting value of seconds. It could be any amount above 0.
var timer = Timer()
var isTimerRunning = false //This will be used to make sure only one timer is created at a time.
var resumeTapped = false




