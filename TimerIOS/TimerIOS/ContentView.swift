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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerMax: Int = 60
    
    
    var body: some View {
        
        let completionRing = Double(countdownTimer) / Double(timerMax)

        VStack {
            
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
