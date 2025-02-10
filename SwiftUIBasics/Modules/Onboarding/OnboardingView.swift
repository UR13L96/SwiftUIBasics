//
//  OnboardingView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 06/02/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var skipOnboarding = false
    
    var body: some View {
        Group {
            if skipOnboarding {
                OnboardingHome()
            } else {
                VStack {
                    Spacer()
                    
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
                    
                    Spacer()
                    
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
                    
                    if currentPage == 2 {
                        Button {
                            self.skipOnboarding.toggle()
                            UserDefaults.standard.set(true, forKey: "Onboarding.SkipOnboarding")
                        } label: {
                            Text("Continue")
                        }
                    }

                }
                .padding(.all)
                .animation(.default, value: currentPage)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.width < 0 {
                            if currentPage < 3 {
                                currentPage += 1
                            }
                        }
                        
                        if value.translation.width > 0 {
                            if currentPage > 0 {
                                currentPage -= 1
                            }
                        }
                    })
                )
            }
        }
        .onAppear {
            if UserDefaults.standard.object(forKey: "Onboarding.SkipOnboarding") != nil {
                skipOnboarding.toggle()
            }
        }
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
