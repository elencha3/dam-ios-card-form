

import SwiftUI

struct CardView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    @State private var bgColor = Color(.systemIndigo)
    @State private var fgColor = Color(.black)
    @State var fontArray = ["PartyLetPlain", "Helvetica","Palatino-Roman", "NotoNastaliqUrdu", "Kailasa"]
    
    
    @State var colorArray = [
        Color(.systemIndigo),
        Color(.systemGreen),
        Color(.systemTeal),
        Color(.systemPink),
        
    ]
    
    @State private var selectedIndex = 0
    @State private var customFont = "Montserrat-Medium"
    
    @State var flipped = false // state variable used to update the card
    
    
    var body: some View {
        VStack  {
            ZStack {
                VStack {
                    Text(userInfo.name.prefix(1))
                        .font(.largeTitle)
                        .frame(width: 80, height: 80)
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding()
                    Spacer().frame(height:10)
                    VStack(alignment: .leading) {
                        if !flipped {
                            Text(userInfo.name)
                            Text(userInfo.job)
                        } else {
                            Text(userInfo.phone)
                            Text(userInfo.email)
                            Text(userInfo.adress)
                        }
                    }
                }.frame(width:300, height: 200)
                .padding()
                .foregroundColor(fgColor)
                .background(bgColor)
                .cornerRadius(16)
                .shadow(color: Color.gray, radius: 16, x:14, y:14)
                .rotation3DEffect(Angle(degrees:self.flipped ? 180 : 0), axis: (x:0,y:1,z:0))
                .onTapGesture {
                    withAnimation(.easeIn(duration: 0.5)){
                        self.flipped.toggle()
                    }
                }
                
            }.padding(.top, 60)
            .font(Font.custom(customFont, size: 20))
            .rotation3DEffect(Angle(degrees:self.flipped ? 180 : 0), axis: (x:0,y:1,z:0))
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.5)){
                    self.flipped.toggle()
                }
            }
            Divider().frame(height: 30)
            
            Text("Personaliza tu tarjeta")
                .font(Font.custom("Montserrat-Light", size: 30))
            VStack {
                HStack {
                    ForEach(colorArray, id:\.self) { color in
                        Circle()
                            .frame(width:50, height:50)
                            .foregroundColor(color)
                            .onTapGesture {
                                bgColor = color
                            }
                    }
                }
                VStack {
                    ColorPicker("Más colores de fondo", selection: $bgColor).frame(width:300, height:30)
                    ColorPicker("Color de texto", selection: $fgColor).frame(width:300, height:20)
                }.font(Font.custom("Montserrat-Light", size: 15))
            }
            
            List {
                
               
                HStack {
                    Text("Fuente personalizada")
                    Picker("Selecciona ", selection:$customFont) {
                        ForEach(fontArray, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(MenuPickerStyle())
                }
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
