//
//  ProgressRing.swift
//  TimerIOS
//
//  Created by Connor Groen on 2022-10-05.
//

import SwiftUI

struct ProgressRing: View {
   
    var ringPercentage: Double // State variables are a different type of varibale, they don't interact the same way other variables -- possibly only declared at the start and not refreshed.
    
    var body: some View {
        VStack {
            ZStack {
                    Circle()
                        .stroke(
                            Color.green.opacity(0.5),
                            lineWidth: 15
                        )
                        Circle()
                        .trim(from: 0, to: ringPercentage)
                        .stroke(
                            Color.green,
                            style: StrokeStyle (
                                lineWidth: 15,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut, value: ringPercentage)
            }
        }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing(ringPercentage: 1)
    }
}

