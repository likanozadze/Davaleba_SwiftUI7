//
//  ContentView.swift
//  DavalebaSwiftUI7
//
//  Created by Lika Nozadze on 12/22/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var magnificationValue = CGFloat.zero
    @State var rotationValue = Angle(degrees: 0)
    @State var offsetSize = CGSize.zero
    @State var longPressGestureValue = 0
    @State var tapGestureValue = 0
    
    
    var body: some View {
        
        
        ScrollView {
            VStack(spacing: 20) {
                // MARK: - Magnification Gesture
                Text("Magnification Gesture")
                Image("merlin")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .scaleEffect(1 + magnificationValue)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { number in
                                magnificationValue = number - 1
                            }
                    )
                
                //  MARK: - Rotation
                Text("Rotation Gesture")
                Image("pearl")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .rotationEffect(rotationValue)
                    .gesture(
                        RotationGesture()
                            .onChanged { value in
                                rotationValue = value
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    rotationValue = (Angle(degrees: 0)
                                    )}
                                
                            }
                    )
                
                // MARK: - DRAG
                Text("Drag Gesture")
                Image("monaliza")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(offsetSize)
                    .gesture(
                        DragGesture()
                            .onChanged { offsetSize = $0.translation }
                    )
            }
            
            // MARK: - Long Press Gesture
            
            Text("Long Press Gesture")
            Image("starrynight")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onLongPressGesture {
                    withAnimation(.spring) {
                        longPressGestureValue += 100
                    }
                }
            
            
            // MARK: - tap Gesture
        
            Text("Tap Gesture")
            Image("grantwood")
                .resizable()
                .frame(width: CGFloat(200 + tapGestureValue), height: CGFloat(200 + tapGestureValue))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .onTapGesture {
                    withAnimation {
                        self.tapGestureValue += 100
                    }
                }
        }
        
        .scrollIndicators(.hidden)
    }
}
#Preview {
    ContentView()
}
