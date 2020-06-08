//
//  UserData.swift
//  Exam1
//
//  Created by Abdul Chathil on 6/7/20.
//  Copyright © 2020 Abdul Chathil. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showMineOnly = false
    @Published var pets = petData
}
