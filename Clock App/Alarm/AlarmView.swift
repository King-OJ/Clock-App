//
//  AlarmView.swift
//  Clock App
//
//  Created by MACBOOK PRO 13 on 07/09/2023.
//

import SwiftUI

struct AlarmView: View {
    
    @State private var showAddAlarmView = false
    
    @State private var alarms: [Alarm] = []
    
    var body: some View {
        NavigationView{
            List {
                ForEach(alarms) { alarm in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(alarm.time, style: .time)
                                .font(.largeTitle)
                                .foregroundColor(alarm.isOn ? .white : .gray)
                            
                            Text(alarm.label)
                                .foregroundColor(alarm.isOn ? .white : .gray)
                        }
                        
                    Spacer()
                    
                        Toggle("", isOn: Binding<Bool>(
                            get: {
                                alarm.isOn
                            },
                            set: {
                                newValue in
                                if let index = alarms.firstIndex(of: alarm){
                                    alarms[index].isOn = newValue
                                }
                            }
                            )
                        )
                        
                    
                    }.swipeActions(edge: .leading) {
                        Button {
                            if let index = alarms.firstIndex(of: alarm){
                                alarms.remove(at: index)
                            }
                        } label: {
                            Image(systemName: "trash")
                        }.tint(.red)
                    }
                    .contextMenu{
                        Button {
                            if let index = alarms.firstIndex(of: alarm){
                                alarms[index].isOn.toggle()
                            }
                        } label: {
                            Label(alarm.isOn ? "Turn Off":"Turn On", systemImage: alarm.isOn ? "bell.slash.fill":"bell.fill")
                        }
                        
                        Button {
                            if let index = alarms.firstIndex(of: alarm){
                                alarms.remove(at: index)
                            }
                            } label: {
                            Label("Delete", systemImage: "trash")
                            }

                    }
                }
                
            }.navigationTitle("Alarms")
                .preferredColorScheme(.dark)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddAlarmView.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.orange)
                        }

                    }
                }
                .sheet(isPresented: $showAddAlarmView) {
                    AddAlarmView(alarms: $alarms)
                }
        }
    }
}

struct Alarm:Identifiable, Equatable {
    var id = UUID()
    var time: Date
    var label = ""
    var isOn:Bool
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
