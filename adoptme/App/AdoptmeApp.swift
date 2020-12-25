//
//  AdoptmeApp.swift
//  adoptme
//
//  Created by Abdul Chathil on 12/25/20.
//  Copyright © 2020 Abdul Chathil. All rights reserved.
//

import SwiftUI

@main
struct PackageTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen().environmentObject(UserData())
        }
    }
}
