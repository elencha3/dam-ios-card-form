

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Rectangle()
                        .frame(width:50, height:50)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Rectangle()
                        .frame(width:50, height:50)
                        .foregroundColor(.green)
                    Rectangle()
                        .frame(width:50, height:50)
                        .foregroundColor(.red)
                    Rectangle()
                        .frame(width:50, height:50)
                        .foregroundColor(.yellow)
                }.padding(.top,20)
                Divider()
                HStack {
                    Text("E")
                        .font(.largeTitle)
                        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .background(Color.blue)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .padding(.trailing)
                    VStack(alignment: .leading) {
                        Text("Nombre")
                        Text("Puesto de trabajo")
                    }
                }.frame(width:300, height: 200)
                .padding()
                .background(Color.gray)
                .shadow(radius: 5)
                .cornerRadius(10)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
