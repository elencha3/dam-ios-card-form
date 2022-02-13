

import SwiftUI

struct Navigator: View {
    var body: some View {
        
        
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
    }
}


struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
