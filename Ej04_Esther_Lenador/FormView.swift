

import SwiftUI

//class UserInfo: ObservableObject {
//    @Published var name = ""
//    @Published var surname = ""
//    @Published var job = ""
//    @Published var phone = ""
//    @Published var email = ""
//    @Published var adress = ""
//}

struct FormView: View {
    
    //     var userInfo: UserInfo
    @State var name = ""
    @State var surname = ""
    @State var job = ""
    @State var phone = ""
    @State var email = ""
    @State var adress = ""
    
    var body: some View {
        
        
        Form {
            
            Section {
                Text("Información personal")
                TextField("Nombre", text: $name)
                TextField("Apellidos", text:$surname)
                TextField("Puesto de trabajo", text:$job)
            }
            Section{
                Text("Datos de contacto")
                TextField("Teléfono", text:$phone)
                TextField("Email", text:$email)
                TextField("Dirección", text:$adress)
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

