//
//  AddAlarmView.swift
//  Clock App
//
//  Created by MACBOOK PRO 13 on 07/09/2023.
//

import SwiftUI

struct AddAlarmView: View {
    
    @Binding var alarms: [Alarm]
    @State private var date = Date()
    @State private var label = ""
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            
            VStack{
                DatePicker("Select Time", selection: $date, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                GroupBox{
                    TextField("Alarm title", text: $label)
                        .multilineTextAlignment(.center)
                }.padding()
                
                Spacer()
            }.padding(.top, 50)
                .preferredColorScheme(.dark)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            alarms.append(Alarm(time: date, label: label, isOn: true ))
                            dismiss()
                        } label: {
                            Text("Save")
                                .font(.title3)
                                .foregroundColor(.orange)
                                .bold()
                        }

                    }
                }
        }
    }
}

struct AddAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        let alarms = Binding.constant([Alarm]())
        AddAlarmView(alarms: alarms)
    }
}
