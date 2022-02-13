

import SwiftUI

struct CardView: View {
    @State private var bgColor = Color.green
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("E")
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Nombre")
                        Text("Puesto de trabajo")
                    }
                }.frame(width:300, height: 200)
                .padding()
                .background(bgColor)
                .shadow(radius: 5)
                .cornerRadius(10)
                Spacer()
            }.padding(.top, 60)
            
            HStack{
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(.green)
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(.red)
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(.yellow)
                
            }.padding(.top,300)
            ColorPicker("Personaliza el color", selection: $bgColor).frame(width:300, height:100)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
