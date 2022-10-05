//
//  ContentView.swift
//  Timer
//
//  Created by Connor Groen on 2022-10-04.
//

import SwiftUI

struct ContentView: View {
    
    @State var countDownTimer = 60
    @State var timerCounting = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        
        VStack {
            ZStack {
//                Circle()
//                    .fill(.green)
//                    .opacity(0.05)
//                    .frame(width: 200, height: 200)
//                Circle()
//                    .trim(from: 0.0, to: 5)
//                    .stroke(Color.white, lineWidth: 5)
//                    .frame(width: 200, height: 200)
//
                
                ProgressRing()
                    .frame(width: 200, height: 200)
                                
                Text("\(countDownTimer)")
                    .onReceive(timer) { _ in
                        if countDownTimer > 0 && timerCounting {
                            countDownTimer -= 1
                        } else {
                            timerCounting = false
                        }
                    }
                    .font(.system(size: 80))
            }
            
        }
        .frame(width: 250, height: 500)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

