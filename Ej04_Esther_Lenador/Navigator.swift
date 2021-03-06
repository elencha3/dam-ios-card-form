

import SwiftUI

struct Navigator: View {
    
    //Show Splash screen onApppear
    @State var showSplash:Bool = false
    
    var body: some View {
        VStack {
            if self.showSplash {
                TabView{
                    FormView()
                        .tabItem {
                            Image(systemName: "person.crop.square")
                            Text("Form")
                        }
                    CardView()
                        .tabItem {
                            Image(systemName: "rectangle.on.rectangle.angled")
                            Text("Card")
                        }
                }
            } else {
                Text("Create Your Card")
                    .foregroundColor(Color.yellow)
                    .font(Font.custom(("Montserrat-Light"), size: 100))
                    .shadow(color: .gray, radius: 0.3, x:0.1, y: 1)
                   
            }
        }.onAppear {
            // after three seconds, system will change the value of the
            // showMainView variable
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showSplash = true
                }
            }
        }
    }
}


struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
