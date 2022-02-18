

import SwiftUI

struct Navigator: View {
    
    @State var showMainView:Bool = false
    
    var body: some View {
        VStack {
            if self.showMainView {
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
                    .bold()
            }
        }.onAppear {
            // after three seconds, system will change the value of the
            // showMainView variable
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.showMainView = true
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
