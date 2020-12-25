//
//  ContentView.swift
//  Exam1
//
//  Created by Abdul Chathil on 6/7/20.
//  Copyright © 2020 Abdul Chathil. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject private var userData: UserData
    let currentUser: User
    @State private var navBarHidden: Bool = true
    @State private var action: Int? = 0
    var body: some View {
        NavigationView {
            List {
                AccountSnippet(user: currentUser).padding(EdgeInsets(top: 32, leading: 0, bottom: 0, trailing: 0))
                PetHeader()
                ForEach(userData.pets) { pet in
                    NavigationLink(destination: PetDetailScreen(pet: pet).navigationBarTitle(Text("")).navigationBarBackButtonHidden(false)) {
                        PetRow(pet: pet)
                    }
                }
            }.environment(\.defaultMinListRowHeight, 132).listSeparatorStyleNone()
                .navigationBarTitle("")
                .navigationBarHidden(self.navBarHidden)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                    self.navBarHidden = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                self.navBarHidden = false
            }
        }.phoneOnlyStackNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(currentUser: User(firstName: "John", lastName: "Doe", photo: "me", email: "abdc@fg.com")).environmentObject(UserData())
    }
}
