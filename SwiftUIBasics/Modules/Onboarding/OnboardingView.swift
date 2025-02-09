//
//  OnboardingView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/02/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            ZStack {
                switch currentPage {
                case 0:
                    OnboardingOne()
                case 1:
                    OnboardingTwo()
                default:
                    OnboardingThree()
                }
            }
            
            PageControl(currentPage: currentPage)
            
            HStack {
                Button {
                    if currentPage > 0 {
                        currentPage -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left.circle")
                        .foregroundStyle(Color.blue)
                        .font(.title)
                }

                Button {
                    if currentPage < 3 {
                        currentPage += 1
                    }
                } label: {
                    Image(systemName: "chevron.right.circle")
                        .foregroundStyle(Color.blue)
                        .font(.title)
                }
            }
        }
        .padding(.all)
        .animation(.default, value: currentPage)
    }
}

#Preview {
    OnboardingView()
}

struct PageControl: UIViewRepresentable {
    var currentPage = 0
    
    func makeUIView(context: Context) -> some UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.numberOfPages = 3
        return pageControl
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPage
    }
}
