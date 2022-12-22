
import SwiftUI

enum AnimationState{
    case normal
    case compress
    case expand
    
}

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State private var animationState: AnimationState = .normal
    @State private var done: Bool = false
    
    func calculate() -> Double{
        switch animationState {
        case .normal:
            return 0.2
        case .compress:
            return 0.1
        case .expand:
            return 10
        }
    }
    var body: some View {
        NavigationView{
            
            ZStack{
                OnBording().scaleEffect(done ? 1: 0.95)
                
                VStack{
                    VStack{
                        Image("WijhaLogo").resizable().aspectRatio(contentMode: .fit).scaleEffect(calculate())
                        
                        
                        
                        
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("thirdColor-o  nboarding")).opacity(done ? 0: 1)
                }//.navigationBarHidden(done ? false: true)
                
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        withAnimation(.spring()){
                            animationState = .compress
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                withAnimation(.spring()){
                                    animationState = .expand
                                    
                                    withAnimation(.interpolatingSpring(stiffness: 100.0, damping: 10.0, initialVelocity: 0)){
                                        done = true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
