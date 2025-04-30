//
//  BirthdayTimeMachine.swift
//  ReplicateUI
//
//  Created by Damian Jardim on 4/23/25.
//

/*
 Challenge:
 You're building a Time Machine App that lets kids see how many days are left until their next birthday.
 🎯 Your task:
 Assume the user's birthday is August 7.
 Write Swift code that:
 Gets today’s date.
 Creates a date for the next August 7.
 Calculates the number of days left until that date.
 Prints a fun message like:
 "Only 106 days left until your birthday! 🎉"
 
 Challenge ( addition)
 
 - Dates are difficult to understand - so lets do more :(
 
 How long has it been since app.
 
 A number of common events will show up on the home screen.
 the events indicate when the last time an action has occured.
 
 "Take Out Trash" / 3 days 4 minutes
 "Dishes" / 8 hours
 "Cleaned the Toilet Bowl" - 3 weeks
 "Since I have been sick" - 4 months
 "Eaten" - 3 hours
 "Called my Mother" - 7 days
 
 Users should be able to create new Events / and edit preprogrammed events.
 
 Add a color scale indicating that the event should probably be done.
 
 - light scale for a task that doesn't have to be done for a while
 - dark - for a task that should be donee now.
 
 fields
 
 
 eventId
 eventName
 MaxTimeBetween
 MinimumTimeBetween -  allows us to define a thrreshold of when the color changes from light to dark
 
 */




import SwiftUI

extension Calendar {
    func numberOfDaysBetween(_ from: Date, and to: Date) -> Int {
        let fromDate = startOfDay(for: from) // <1>
        let toDate = startOfDay(for: to) // <2>
        let numberOfDays = dateComponents([.day], from: fromDate, to: toDate) // <3>
        
        return numberOfDays.day!
    }
}



struct BirthdayTimeMachine: View {
    
    @State private var numberOfDays: Int = 0
    @State private var displayMessage = ""
    
    func getYearFromDate(date: Date)->Int{
        return Calendar.current.component(.year, from: date)
    }
    
    func getMonthFromDate(date: Date)->Int{
        return Calendar.current.component(.month, from: date)
    }
    
    func getDayFromDate(date: Date)->Int{
        return Calendar.current.component(.day, from: date)
    }
    
    func getDateUsingDateComponents(year:Int, month:Int, day:Int)->Date{
        return Calendar.current
            .date(from:DateComponents(year:2025, month:4, day:30))!
    }
    
    func getDaysBetweenUsingStartEndDates(startDate: Date, endDate: Date) -> Int{
        let today = Date()
        let calendar = Calendar.current
        
        let currentYear = calendar.component(.year, from: today)
        
        var birthdayComponents = DateComponents(year: currentYear, month: 8, day: 7)
        var birthdayDate = calendar.date(from: birthdayComponents)!
        
        if birthdayDate < today {
            birthdayComponents.year! += 1
            birthdayDate = calendar.date(from: birthdayComponents)!
        }
        
        let daysLeft = calendar.dateComponents([.day], from: today, to: birthdayDate).day!
        return daysLeft
    }
    
    func getDayNumber()->Int{
        let today = Date()
        let calendar = Calendar.current
        
        let currentYear = calendar.component(.year, from: today)
        
        var birthdayComponents = DateComponents(year: currentYear, month: 4, day: 30, hour:1, minute:1, second:1)
        var birthdayDate = calendar.date(from: birthdayComponents)!
        
        if birthdayDate < today {
            birthdayComponents.year! += 1
            birthdayDate = calendar.date(from: birthdayComponents)!
        }
        
        let daysLeft = calendar.dateComponents([.day], from: today, to: birthdayDate).day!
        return daysLeft
    }
    
    
    var body: some View {
        
        VStack{
            Spacer()
            
            List{
                Text("days until my birthday: \(numberOfDays)")
                Text("Staring Date:  ")
                Text("Ending Date: ")
                Text(Date.now, format: .dateTime.day().month().year())
                // Oct 7, 2023
            }
            
            
            Spacer()
            
            Button{
                numberOfDays = getDayNumber()
            }label:{
                Text("Calculate").font(.title)
            }
        }
        
    }
}

struct MissingReminderChallenge: View {
    
    @State private var displayMessage = ""
    
    func calculate(){
        var reminderDateComponents = DateComponents(
            calendar: Calendar.current,
            year: 2025,
            month: 4,
            day: 24,
            hour: 8,
            minute: 30
        )
        
        // optional
        var reminderDate:Date? = Calendar.current.date(from: reminderDateComponents)
        
        
        // format message
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        displayMessage = formatter.string(from: reminderDate!)
    }
    
    var body: some View {
        Spacer()
        Text("Missing Reminder Challenge")
        Text("Results: \(displayMessage)")
        Spacer()
        Button{calculate()}label:{Text("Calculate")}
            .buttonStyle(.borderedProminent)
        
        Button("challenge"){
            let reminderDate = DateComponents(calendar: Calendar.current, year: 2025, month: 4, day: 24, hour: 8, minute: 30)
            let reminder = reminderDate.date!
            
            let now = Date()
            
            print("now: \(now)")
            print("reminder \(reminder)")
            
            if reminder > now {
                print("Reminder set for the future. ⏰")
            } else {
                print("Too late! 😱")
            }
        }
    }
}


struct DateExamples: View {
    @State private var wakeUp:Date = Date.now
//    
//    func addSeconds(secondsToAdd: Int){
//        Date.now.addingTimeInterval(secondsToAdd)
//    }
//    
//    func addSecondsToDate(secondsToAdd: Int, date:Date){
//        let resultDate = date + secondsToAdd
//        
//    }
//    
    var body: some View {
        VStack{
            Spacer()
            
            DatePicker(
                "Enter Date:",
                selection: $wakeUp,
                displayedComponents: [.date,.hourAndMinute]
            )
                .labelsHidden()
            
            Spacer()
            
            Button("click me!"){
                
            }
        }.padding()
    }
    
    
}

#Preview {
    //    BirthdayTimeMachine()
    //    MissingReminderChallenge2()
    DateExamples()
}
