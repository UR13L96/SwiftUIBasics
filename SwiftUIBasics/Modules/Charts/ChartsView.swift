//
//  ChartsView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 10/02/25.
//

import SwiftUI

struct ChartsView: View {
    var data: [ChartData] = [
        .init(sales: 50, day: "Mon"),
        .init(sales: 60, day: "Tue"),
        .init(sales: 70, day: "Wed"),
        .init(sales: 80, day: "Thu"),
        .init(sales: 90, day: "Fri")
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
                
                HStack {
                    ForEach(data) { data in
                        BarView(value: data.sales, title: data.day)
                    }
                }
            }
        }
    }
}

#Preview {
    ChartsView()
}
