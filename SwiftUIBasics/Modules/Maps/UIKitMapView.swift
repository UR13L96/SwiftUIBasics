//
//  UIKitMapView.swift
//  SwiftUIBasics
//
//  Created by Uriel Olascoaga on 19/04/24.
//

import SwiftUI

struct UIKitMapView: View {
    var body: some View {
        MapRepresentable()
    }
}

#Preview {
    UIKitMapView()
}

struct MapRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Maps", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController")
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
