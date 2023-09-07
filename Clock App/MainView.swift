//
//  MainView.swift
//  Clock App
//
//  Created by MACBOOK PRO 13 on 07/09/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            StopwatchView()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("Stop watch")
                }
            
            AlarmView()
                .tabItem {
                    Image(systemName: "alarm")
                    Text("Alarm")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
