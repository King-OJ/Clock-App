//
//  ContentView.swift
//  Clock App
//
//  Created by MACBOOK PRO 13 on 29/08/2023.
//

import SwiftUI

struct StopwatchView: View {
    
    @State private var time = 0.0
    @State private var isRunning = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(time, specifier: "%.1f")")
                .foregroundColor(.white)
                .padding()
                .font(.system(size: 50))
            
            HStack{
                Button {
                    time = 0.0
                    isRunning = false
                } label: {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray)
                        .overlay(
                            Text("Reset")
                                .foregroundColor(.white)
                                .bold()
                        )
                }.padding()
                
                Spacer()
                
                Button {
                    isRunning.toggle()
                } label: {
                    Circle()
                        .frame(width: 90, height: 90)
                        .foregroundColor(isRunning ? .red : .green)
                        .overlay(
                            Text(isRunning ? "Pause": "Start")
                                .foregroundColor(.white)
                                .bold()
                        )
                }.padding()

            }
        }.preferredColorScheme(.dark)
            .onReceive(timer) { _ in
                if isRunning == true {
                    time += 0.1
                }
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
