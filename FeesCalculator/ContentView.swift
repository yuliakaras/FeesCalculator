import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    @State private var totalCheck = 0
    @State private var numberOfPeople = 2
    @State private var feesPercentage = 0
    
    let feesPercentages = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let feeSelection = Double(feesPercentages[feesPercentage])
        let orderTotalSum = Double(totalCheck) 
        
        let feeValue = orderTotalSum / 100 * feeSelection
        let bill = feeValue + orderTotalSum
        let billPerPerson = bill / peopleCount

        return billPerPerson
       
       
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(value: $totalCheck, formatter: NumberFormatter(), prompt: Text("Sum required")) {  Text("Total check") }
                    Picker("Number of people",selection:  $numberOfPeople){
                        ForEach(2..<15){
                            Text("\($0) visitor(s)")
                        }
                    }
                   
                }.navigationTitle("Fees Calculator")
                
                Section(header:Text("How much fees do you want to leave?")){
                    Picker("Fees percentage",selection:  $feesPercentage){
                        ForEach(0..<feesPercentages.count){
                            Text("\(self.feesPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
       }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
