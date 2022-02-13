

import SwiftUI

struct CardView: View {
    @State private var bgColor = Color.green
    @State var fontArray = ["PartyLetPlain", "Helvetica","Palatino-Roman", "NotoNastaliqUrdu", "Kailasa"]
    @State private var selectedIndex = 0
    @State private var customFont = "Montserrat-Medium"
    
    
    var body: some View {
        VStack  {
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
                .cornerRadius(8)
                
            }.padding(.top, 60)
            .font(Font.custom(customFont, size: 20))
            Divider().frame(height: 10)
            Text("Personaliza tu tarjeta")
                .font(Font.custom("Montserrat-Light", size: 30))
            HStack {
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        bgColor = Color.blue
                    }
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(.green)
                    .onTapGesture {
                        bgColor = Color.green
                    }
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(.red)
                    .onTapGesture {
                        bgColor = Color.red
                    }
                Circle()
                    .frame(width:50, height:50)
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        bgColor = Color.yellow
                    }
                
            }.padding(.top, 15)
            ColorPicker("Color personalizado", selection: $bgColor).frame(width:300, height:100)
            HStack {
                Text("Fuente personalizada")
                Picker("Selecciona ", selection:$customFont) {
                    ForEach(fontArray, id:\.self) {
                        Text($0)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            Spacer()
        }.font(Font.custom("Montserrat-Light", size: 20))
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
