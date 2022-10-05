//
//  ProgressRing.swift
//  Timer
//
//  Created by Connor Groen on 2022-10-04.
//

import SwiftUI

struct ProgressRing: View {
    
    @State var RingProgress: Double = 1
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(
                        Color.green.opacity(0.5),
                        lineWidth: 15
                )
                Circle()
                    .trim(from: 0, to: RingProgress)
                    .stroke(
                        Color.green,
                        style: StrokeStyle (
                            lineWidth: 15,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: RingProgress)

            }
        
            Button("Change") {
                RingProgress = 0.25
            }
            Button("Reset") {
                RingProgress = 1
            }
    }
    }
}

struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
        ProgressRing()
    }
}
