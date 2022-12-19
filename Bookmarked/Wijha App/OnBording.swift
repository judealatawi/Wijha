//
//  Home.swift
//  LiquidIntro
//
//  Created by Nouf  on 02/05/1444 AH.
//

import SwiftUI

struct OnBording: View {
    @StateObject private var vm = PushNotifciationViewModel()
    @State var intros: [Intro] = [
        Intro( title: "Welcome", subTitle: "intro1", description: "Let's take you to your  next favorite place ", pic: "Onboard1", color: Color("primaryColor 1")),
               Intro(title: "Search", subTitle: "intro2", description: "With our variety of categories you can easily find what your looking for", pic: "Onboard2", color: Color("secondaryColor")),
               Intro(title: "Enjoy", subTitle: "intro3", description: "And don’t forgot to share with your loved ones ", pic: "Onboard3", color: Color("thirdColor"))
           ]
    
    //gesture properties
    @GestureState var isDragging: Bool = false
    @State var fakeIndex: Int = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        NavigationView{
        ZStack{
            ForEach(intros.indices.reversed(),id: \.self){ index in
                //intro view
                IntroView(intro: intros[index])
                //cusome liquid swipe effect
                    .clipShape(LiquidShape(offset: intros[index].offset,curvePoint: fakeIndex == index ? 50 : 0))
                    .padding(.trailing, fakeIndex == index ? 15: 0)
                    .ignoresSafeArea()
                
            }
            HStack(spacing: 8){
                
                ForEach(0..<intros.count - 2, id: \.self){ index in
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 9, height: 9)
                        .scaleEffect(currentIndex == index ? 1.15: 0.85)
                        .opacity(currentIndex == index ? 1 : 0.25)
                }
                Spacer()
                
                NavigationLink(destination:WijhaPage()) {
                                    
                    Text("skip").foregroundColor(.white).font(.title3)
                                }
                
            }.padding(20)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        
        }
        //arrow with drag gesture..
//        //.overlay(
//            Button{
//                
//            }label: {
//                Image(systemName: "chevron.left")
//                    .font(.largeTitle)
//                    .frame(width: 50, height: 50)
//                    .foregroundColor(.white)
//                    .contentShape(Rectangle())
//                    .gesture(
//                    //drag gesture
//                        
//                        DragGesture()
//                            .updating($isDragging, body: { value, out, _ in
//                                out = true
//                                
//                            })
//                            .onChanged({ value in
//                                
//                                //updating offset
//                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.6, blendDuration: 0.6)){
//                                    
//                                    intros[fakeIndex].offset = value.translation
//                                    
//                                }
//                                
//                            })
//                            .onEnded({value in
//                                withAnimation(.spring()){
//                                    //checking
//                                    if -intros[fakeIndex].offset.width > getRect().width / 2{
//                                        intros[fakeIndex].offset.width = -getRect().height * 1.5
//                                        //updating index
//                                        fakeIndex += 1
//                                        
//                                        if currentIndex == intros.count - 3{
//                                            currentIndex = 0
//                                        }
//                                        else{
//                                            currentIndex += 1
//                                        }
//                                        
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
//                                            if fakeIndex == (intros.count - 2){
//                                                for index in 0..<intros.count - 2{
//                                                    intros[index].offset = .zero
//                                                    
//                                                }
//                                                
//                                                fakeIndex = 0
//                                                
//                                            }
//                                        }
//                                        
//                                    }
//                                    else{
//                                        intros[fakeIndex].offset = .zero
//                                        
//                                    }
//                                            
//                                    
//                                    
//                                }
//                            })
//                    )
//            }
//                  
//            
//            .offset(y: 53 )
//            .opacity(isDragging ? 0: 1)
//            .animation(.linear, value: isDragging)
//            //,alignment: .topTrailing
//        
        
        .onAppear{
            vm.PermissionsReq()
            
            guard let first = intros.first else{
                return
            }
            guard var last = intros.last else{
                return
            }
            last.offset.width = -getRect().height * 1.5
            
            intros.append(first)
            intros.insert(last, at: 0)
            
            fakeIndex = 1
        }
            
    }
   @ViewBuilder
    func IntroView(intro: Intro)-> some View{
        
        VStack{
            Image(intro.pic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
            
            VStack(alignment: .leading, spacing: 0 ){
                
                Text(intro.title)
                    .font(.system(size: 45)).foregroundColor(.white)
                //Text(intro.subTitle)
                    .font(.system(size: 50, weight: .bold)).foregroundColor(.white)
                Text(intro.description)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top)
                    .frame(width: getRect().width - 100)
                    .lineSpacing(8).foregroundColor(.white)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            intro.color
                
        )
       
    }
}
    

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}


struct Home_Previews: PreviewProvider {
    

    var welcomeScreenShown: Bool = false
    
    static var previews: some View {
        OnBording()
            .environment(\.locale, Locale(identifier: "en"))
    }
}

struct LiquidShape: Shape{
    
    var offset: CGSize
    var curvePoint: CGFloat
    
    //multiple animatable data
    
    
    var animatableData: AnimatablePair<CGSize.AnimatableData, CGFloat> {
        get{
            return AnimatablePair(offset.animatableData, curvePoint)
        }
        set{
            offset.animatableData = newValue.first
            curvePoint = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            
            let width = rect.width + (-offset.width > 0 ? offset.width : 0)
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            
            let from = 80 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 80 ? 80 : from))
            
            //adding heigh
            var to = 180 + (offset.height) + (-offset.width)
            to = to < 180 ? 180 : to
            
            //mid between 80 - 180
            let mid: CGFloat = 80 + ((to - 80 ) / 2)
            
            path.addCurve(to: CGPoint(x: rect.width, y: to), control1: CGPoint(x: width -  curvePoint, y: mid), control2: CGPoint(x: width - curvePoint, y: mid))


            
        }
    }
}



