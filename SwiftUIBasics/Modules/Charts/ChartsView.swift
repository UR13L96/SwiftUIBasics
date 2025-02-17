//
//  ChartsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 10/02/25.
//

import SwiftUI

struct ChartsView: View {
    @State private var data: [ChartData] = [
        .init(sales: 0, day: "Mon"),
        .init(sales: 0, day: "Tue"),
        .init(sales: 0, day: "Wed"),
        .init(sales: 0, day: "Thu"),
        .init(sales: 0, day: "Fri")
    ]
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Bar chart")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .bold()
                
                Button {
                    data = getRandomData()
                } label: {
                    Text("Refresh")
                }
                .foregroundStyle(Color.white)

                
                HStack {
                    ForEach(data) { data in
                        BarView(value: data.sales, title: data.day)
                    }
                }
            }
        }
    }
    
    private func getRandomData() -> [ChartData] {
        Array(0...4).map { i in
            ChartData(sales: Double.random(in: 0...200), day: getDayForIndex(i))
        }
    }
    
    private func getDayForIndex(_ index: Int) -> String {
        let daysOfWeek: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        
        return daysOfWeek[index]
    }
}

#Preview {
    ChartsView()
}
