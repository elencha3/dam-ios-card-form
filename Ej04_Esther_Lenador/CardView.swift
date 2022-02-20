

import SwiftUI

struct CardView: View {
    
    //Var with class userInfo to get fields of form
    @EnvironmentObject var userInfo: UserInfo
    
    //Color vars to change with userinputs
    @State private var bgColor = Color(.yellow)
    @State private var fgColor = Color(.black)
    @State private var bgCircleColor = Color(.white)
    
    //Array with fonts and arrat with colors to costumize
    @State var fontArray = ["PartyLetPlain", "Galvji","Palatino-Roman", "GillSans", "Kailasa","Didot", "Copperplate"]
    
    @State var colorArray = [
        Color(.yellow),
        Color(.systemGreen),
        Color(.systemTeal),
        Color(.systemPink),
        
    ]
    
    @State private var selectedIndex = 0
    @State private var customFont = "Montserrat-Medium"
    
    @State var flipped = false // state variable used to update the card
    
    //Switchs to select which fields will appear in card
    @State var nameOn = true
    @State var jobOn = true
    @State var phoneOn = true
    @State var emailOn = true
    @State var addressOn = true
    
    
    
    var body: some View {
        
        /*SCROLL VIEW to make view responsive in landscape*/
        ScrollView {
            VStack {
                VStack {
                    Text("Personaliza tu tarjeta")
                        .font(Font.custom("Montserrat-Light", size: 30))
                        .padding(.top,30)
                    /*Card */
                    ZStack {
                        VStack {
                            Text(userInfo.name.prefix(1))
                                .font(.largeTitle)
                                .frame(width: 80, height: 80)
                                .background(bgCircleColor)
                                .clipShape(Circle())
                                .padding()
                            Spacer().frame(height:5)
                            /*Text in card with information depending on if form is filled or not and if it is flipped to see information behind.*/
                            VStack(alignment: .leading) {
                                if !flipped {
                                    if nameOn {
                                        userInfo.name.isEmpty ? Text("Nombre y apellidos") : Text(userInfo.name + " " + userInfo.surname)
                                    }
                                    if jobOn {
                                        userInfo.job.isEmpty ? Text("Trabajo") : Text(userInfo.job)
                                    }
                                    
                                } else {
                                    if phoneOn {
                                        HStack{
                                            Image(systemName: "phone")
                                            userInfo.phone.isEmpty ? Text("Teléfono") : Text(userInfo.phone)
                                        }
                                    }
                                    if emailOn {
                                        HStack{
                                            Image(systemName: "envelope")
                                            userInfo.email.isEmpty ? Text("Email") : Text(userInfo.email)
                                        }
                                    }
                                    if addressOn{
                                        HStack{
                                            Image(systemName: "map")
                                            userInfo.adress.isEmpty ? Text("Dirección") : Text(userInfo.adress)
                                        }
                                    }
                                }
                            }
                        }.frame(width:300, height: 200)
                        .foregroundColor(fgColor)
                        .background(bgColor)
                        .cornerRadius(16)
                        .shadow(color: Color.gray, radius: 16, x:14, y:14)
                        .rotation3DEffect(.degrees(self.flipped ? 180 : 0), axis: (x:0,y:1,z:0))
                        .onTapGesture {
                            /*Animation to rotate the text too*/
                            withAnimation(.easeIn(duration: 0.5)){
                                self.flipped.toggle()
                            }
                        }
                    }.padding(.top, 20)
                    .font(Font.custom(customFont, size: 16))
                    .rotation3DEffect(.degrees (self.flipped ? 180 : 0), axis: (x:0,y:1,z:0))
                    .onTapGesture {
                        /*Animation to rotate card*/
                        withAnimation(.easeIn(duration: 0.5)){
                            self.flipped.toggle()
                        }
                    }
                }
                Divider().frame(height: 40)
                
                VStack {
                    Text("Colores").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .leading)
                        .padding(.horizontal, 20)
                        .font(Font.custom("Montserrat-Medium", size: 20))
                    /*Horizontal stack with Preselected colors*/
                    HStack {
                        ForEach(colorArray, id:\.self) { color in
                            Circle()
                                .strokeBorder(bgColor == color ? Color.black : Color.clear, lineWidth: 2)
                                .background(Circle().fill(color))
                                .frame(width: 50, height: 50)
                                .onTapGesture {
                                    bgColor = color
                                }
                        }
                    }
                    /*CUSTOMIZING SECTION*/
                    
                    /*COLORS*/
                    VStack {
                        /*Pickers to change backgound, text and circle colors.*/
                        ColorPicker("Más colores de fondo", selection: $bgColor).frame(width:300, height:30)
                        ColorPicker("Color de texto", selection: $fgColor).frame(width:300, height:20).padding(.bottom, 5)
                        ColorPicker("Color de círculo", selection: $bgCircleColor).frame(width:300, height:20)
                    }.font(Font.custom("Montserrat-Light", size: 15))
                    .padding(.top,10)
                }
                /*FONTS*/
                VStack {
                    Text("Fuentes").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .leading)
                        .padding(.horizontal,20)
                        .font(Font.custom("Montserrat-Medium", size: 20))
                    HStack {
                        Text(customFont)
                        Spacer()
                        Picker("Cambiar", selection:$customFont) {
                            ForEach(fontArray, id:\.self) {
                                Text($0)
                            }
                        }.pickerStyle(MenuPickerStyle())
                    }
                    .font(Font.custom("Montserrat-Light", size: 15))
                    .padding(.horizontal,20)
                    
                }.padding(.top, 30)
                
                /*FIELDS IN CARD*/
                VStack {
                    Text("Campos").frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 30, alignment: .leading)
                        .padding(.horizontal,20)
                        .font(Font.custom("Montserrat-Medium", size: 20))
                    VStack{
                        Toggle("Nombre y Apellidos", isOn: $nameOn)
                        Toggle("Puesto de trabajo", isOn: $jobOn)
                        Toggle("Teléfono", isOn: $phoneOn)
                        Toggle("Email", isOn: $emailOn)
                        Toggle("Dirección", isOn: $addressOn)
                        
                    }.font(Font.custom("Montserrat-Light", size: 18))
                    .padding(.horizontal,20)
                }.padding(.top, 30)
            }
            Spacer()
        }.font(Font.custom("Montserrat-Light", size: 20))
    }
}



enum Style {
    case square, circle
    
    var sfSymbolName: String {
        switch self {
        case .square:
            return "square"
        case .circle:
            return "circle"
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
