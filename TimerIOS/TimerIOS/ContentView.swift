//
//  ContentView.swift
//  TimerIOS
//
//  Created by Connor Groen on 2022-10-05.
//

import SwiftUI

struct ContentView: View {
   
    @State var countdownTimer: Int = 60
    @State var timerCounting: Bool = true
    @State var timerMax: Int = 60
    @State var startStop: String = "Stop"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    var body: some View {
        
        let completionRing = Double(countdownTimer) / Double(timerMax)

        VStack {
            
            Spacer()
            
            ZStack {
                ProgressRing(ringPercentage: completionRing)
                    .frame(width: 300, height: 300)

                Text("\(countdownTimer)")
                    .onReceive(timer) { _ in
                        if countdownTimer > 0 && timerCounting {
                            countdownTimer -= 1
                        } else {
                            timerCounting = false
                        }
                }
                .font(.system(size: 100))
                
                
            }
            
            Spacer()
            
            HStack {
                Button("Pause") {
                    if timerCounting == true {
                        timerCounting = false
                    }
                    else if timerCounting == false {
                        timerCounting = true
                    }
                }
            }
            
//            Spacer()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
