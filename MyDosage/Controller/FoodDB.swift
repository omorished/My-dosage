

import Foundation



class FoodDB{
    
    static var foodBasket: [Food] = []
    
    static var insulin: Double? = nil
    static var carbResult: Double? = nil
    
    //(1) PROTEIN LIST
    static var proteinList: [Food] =
    [
Food(foodType: .protein, foodName: "لحم", amountUnit: "٥٠ جم", numberInArray: 0, carb: "٢.٥"),
Food(foodType: .protein, foodName: "دجاج", amountUnit: "١٠٠ جم", numberInArray: 1, carb: "٠"),
Food(foodType: .protein, foodName: "السمك", amountUnit: "١٧٥ جم", numberInArray: 2, carb: "٣.٢"),
Food(foodType: .protein, foodName: "بيض", amountUnit: "حبة متوسطة", numberInArray: 3, carb: "٠.٥"),
Food(foodType: .protein, foodName: "الجوز", amountUnit: "كوب واحد", numberInArray: 4, carb: "٨"),
Food(foodType: .protein, foodName: "اللوز", amountUnit: "كوب واحد", numberInArray: 5, carb: "٨.٣"),
Food(foodType: .protein, foodName: "فستق", amountUnit: "كوب واحد", numberInArray: 6, carb: "١٥"),
Food(foodType: .protein, foodName: "الفول السوداني", amountUnit: "كوب واحد", numberInArray: 7, carb: "٧"),
Food(foodType: .protein, foodName: "البندق", amountUnit: "كوب واحد", numberInArray: 8, carb: "٦"),
Food(foodType: .protein, foodName: "بذور الكتان", amountUnit: "كوب واحد", numberInArray: 9, carb: "١.٨"),
Food(foodType: .protein, foodName: "بذور اليقطين", amountUnit: "كوب واحد", numberInArray: 10, carb: "٩.٧"),
Food(foodType: .protein, foodName: "كاجو", amountUnit: "كوب واحد", numberInArray: 11, carb: "٢٦"),
Food(foodType: .protein, foodName: "كستناء", amountUnit: "كوب واحد", numberInArray: 12, carb: "٦٠"),
Food(foodType: .protein, foodName: "العدس", amountUnit: "كوب واحد", numberInArray: 13, carb: "١٥"),
Food(foodType: .protein, foodName: "الفول", amountUnit: "كوب واحد", numberInArray: 14, carb: "١٤"),
Food(foodType: .protein, foodName: "لوبيا", amountUnit: "كوب واحد", numberInArray: 15, carb: "٢"),
Food(foodType: .protein, foodName: "فاصوليا", amountUnit: "كوب واحد", numberInArray: 16, carb: "١٣.٩"),
Food(foodType: .protein, foodName: "حمص", amountUnit: "كوب واحد", numberInArray: 17, carb: "١٢"),
Food(foodType: .protein, foodName: "بازيلا", amountUnit: "كوب واحد", numberInArray: 18, carb: "٥.١")
        ]

    //(2) MILK AND DIARY
    static var milkAndDairyList: [Food] = [
Food(foodType: .milkAndDairy, foodName: "زبادي كامل الدسم", amountUnit: "١٠٠ مل", numberInArray: 0, carb: "٦.٢"),
Food(foodType: .milkAndDairy, foodName: "زبادي قليل الدسم", amountUnit: "١٠٠ مل", numberInArray: 1, carb: "٧"),
Food(foodType: .milkAndDairy, foodName: "زبادي خالي الدسم", amountUnit: "١٠٠ مل", numberInArray: 2, carb: "٦.٣"),
Food(foodType: .milkAndDairy, foodName: "زبادي يوناني ساده", amountUnit: "١٠٠ جم", numberInArray: 3, carb: "٨.٥"),
Food(foodType: .milkAndDairy, foodName: "قشطة طازجة", amountUnit: "١٠٠ جم", numberInArray: 4, carb: "٣.٤"),
Food(foodType: .milkAndDairy, foodName: "لبنة كاملة الدسم", amountUnit: "١٠٠ جم", numberInArray: 5, carb: "٨"),
Food(foodType: .milkAndDairy, foodName: "لبنة قليلة الدسم", amountUnit: "١٠٠ جم", numberInArray: 6, carb: "٨.٥"),
Food(foodType: .milkAndDairy, foodName: "حليب كامل الدسم", amountUnit: "كوب واحد", numberInArray: 7, carb: "١١.٧٥"),
Food(foodType: .milkAndDairy, foodName: "حليب قليل الدسم", amountUnit: "كوب واحد", numberInArray: 8, carb: "١١.٧٥"),
Food(foodType: .milkAndDairy, foodName: "لبن كامل الدسم", amountUnit: "كوب واحد", numberInArray: 9, carb: "١١.٧٥"),
Food(foodType: .milkAndDairy, foodName: "لبن قليل الدسم", amountUnit: "كوب واحد", numberInArray: 10, carb: "١١.٧٥"),
Food(foodType: .milkAndDairy, foodName: "لبن خالي الدسم", amountUnit: "كوب واحد", numberInArray: 11, carb: "١٢")
]
    
    //(3) Veg
    static var vegList: [Food] = [
Food(foodType: .veg, foodName: "جزر", amountUnit: "كوب واحد", numberInArray: 0, carb: "٥"),
Food(foodType: .veg, foodName: "جزر مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 1, carb: "٥"),
Food(foodType: .veg, foodName: "بروكلي", amountUnit: "كوب واحد", numberInArray: 2, carb: "٥"),
Food(foodType: .veg, foodName: "بروكلي مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 3, carb: "٥"),
Food(foodType: .veg, foodName: "شمندر", amountUnit: "كوب واحد", numberInArray: 4, carb: "٥"),
Food(foodType: .veg, foodName: "شمندر مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 5, carb: "٥"),
Food(foodType: .veg, foodName: "فلفل رومي", amountUnit: "كوب واحد", numberInArray: 6, carb: "٥"),
Food(foodType: .veg, foodName: "فلفل رومي مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 7, carb: "٥"),
Food(foodType: .veg, foodName: "طماطم", amountUnit: "كوب واحد", numberInArray: 8, carb: "٥"),
Food(foodType: .veg, foodName: "طماطم مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 9, carb: "٥"),
Food(foodType: .veg, foodName: "بصل", amountUnit: "كوب واحد", numberInArray: 10, carb: "٥"),
Food(foodType: .veg, foodName: "بصل مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 11, carb: "٥"),
Food(foodType: .veg, foodName: "فطر", amountUnit: "كوب واحد", numberInArray: 12, carb: "٥"),
Food(foodType: .veg, foodName: "فطر مطبوخ", amountUnit: "نصف كوب مطبوخ", numberInArray: 13, carb: "٥"),
Food(foodType: .veg, foodName: "سبانخ", amountUnit: "كوب واحد", numberInArray: 14, carb: "٥"),
Food(foodType: .veg, foodName: "سبانخ مطبوخة", amountUnit: "نصف كوب مطبوخ", numberInArray: 15, carb: "٥"),
Food(foodType: .veg, foodName: "كوسة", amountUnit: "كوب واحد", numberInArray: 16, carb: "٥"),
Food(foodType: .veg, foodName: "كوسة مطبوخة", amountUnit: "نصف كوب مطبوخ", numberInArray: 17, carb: "٥"),
Food(foodType: .veg, foodName: "ذرة مسلوقة", amountUnit: "نص كوب", numberInArray: 18, carb: "١٨"),
Food(foodType: .veg, foodName: "بطاطس", amountUnit: "حبة صغيرة جدا", numberInArray: 19, carb: "٧.٦"),
Food(foodType: .veg, foodName: "بطاطا حلوة", amountUnit: "حبة صغيرة", numberInArray: 20, carb: "١١.٥"),
Food(foodType: .veg, foodName: "باذنجان", amountUnit: "حبة كبيرة", numberInArray: 21, carb: "١٩"),
Food(foodType: .veg, foodName: "قرع", amountUnit: "حبة واحدة", numberInArray: 22, carb: "٢.٥"),
Food(foodType: .veg, foodName: "خس", amountUnit: "كوب واحد", numberInArray: 23, carb: "٠.٧"),
Food(foodType: .veg, foodName: "خيار", amountUnit: "حبة كبيرة", numberInArray: 24, carb: "٧.١"),
Food(foodType: .veg, foodName: "ملفوف", amountUnit: "كوب واحد", numberInArray: 25, carb: "٣.٢"),
Food(foodType: .veg, foodName: "بقدونس", amountUnit: "كوب واحد", numberInArray: 26, carb: "١.٨"),
Food(foodType: .veg, foodName: "جرجير", amountUnit: "كوب واحد", numberInArray: 27, carb: "٠.٣"),
    ]

    //(4) Fruit
    static var fruitList: [Food] = [
Food(foodType: .fruit, foodName: "تفاحة", amountUnit: "حبة واحدة", numberInArray: 0, carb: "١٥"),
Food(foodType: .fruit, foodName: "مشمش", amountUnit: "حبة واحدة", numberInArray: 1, carb: "٣.٧٥"),
Food(foodType: .fruit, foodName: "توت اسود", amountUnit: "كوب", numberInArray: 2, carb: "١٥"),
Food(foodType: .fruit, foodName: "توت ازرق", amountUnit: "٣/٤ الكوب", numberInArray: 3, carb: "١٥"),
Food(foodType: .fruit, foodName: "كزر", amountUnit: "١٢ حبة", numberInArray: 4, carb: "١٥"),
Food(foodType: .fruit, foodName: "كيوي", amountUnit: "حبة واحدة", numberInArray: 5, carb: "١٥"),
Food(foodType: .fruit, foodName: "كمثرى", amountUnit: "حبة واحدة", numberInArray: 6, carb: "٣٠"),
Food(foodType: .fruit, foodName: "برتقال", amountUnit: "حبة واحدة", numberInArray: 7, carb: "١٥"),
Food(foodType: .fruit, foodName: "خوخ", amountUnit: "حبة واحدة", numberInArray: 8, carb: "١٥"),
Food(foodType: .fruit, foodName: "موز", amountUnit: "حبة واحدة", numberInArray: 9, carb: "١٥"),
Food(foodType: .fruit, foodName: "عنب", amountUnit: "١٧ حبة", numberInArray: 10, carb: "١٥"),
Food(foodType: .fruit, foodName: "مانجو", amountUnit: "حبة واحدة", numberInArray: 11, carb: "٣٠"),
Food(foodType: .fruit, foodName: "برقوق", amountUnit: "حبة واحدة", numberInArray: 12, carb: "٧.٥"),
Food(foodType: .fruit, foodName: "يوسفي", amountUnit: "حبة واحدة", numberInArray: 13, carb: "٧.٥"),
Food(foodType: .fruit, foodName: "فراولة", amountUnit: "كوب وربع", numberInArray: 14, carb: "١٥"),
    ]
    
    
    //(5) Carbo
    static var carboList: [Food] = [
    
Food(foodType: .carbo, foodName: "ارز ابيض", amountUnit: "٦ ملاعق", numberInArray: 0, carb: "١٥"),
Food(foodType: .carbo, foodName: "ارز بني", amountUnit: "كوب واحد", numberInArray: 1, carb: "٤٥"),
Food(foodType: .carbo, foodName: "كينوا", amountUnit: "كوب واحد", numberInArray: 2, carb: "٢٠"),
Food(foodType: .carbo, foodName: "خبز ابيض", amountUnit: "رغيف واحد", numberInArray: 3, carb: "٤٢"),
Food(foodType: .carbo, foodName: "خبز بالنخالة", amountUnit: "رغيف واحد", numberInArray: 4, carb: "٢٧"),
Food(foodType: .carbo, foodName: "خبز اسمر", amountUnit: "ربع خبز", numberInArray: 5, carb: "١١.٦"),
Food(foodType: .carbo, foodName: "خبز بالشوفان", amountUnit: "شريحة صغيرة", numberInArray: 6, carb: "١٣.١"),
Food(foodType: .carbo, foodName: "خبز البرجر", amountUnit: "الطبقة الاولى", numberInArray: 7, carb: "١٥"),
Food(foodType: .carbo, foodName: "خبز البرجر", amountUnit: "الطبقة الثانية", numberInArray: 8, carb: "١٥"),
Food(foodType: .carbo, foodName: "خبز التوست الابيض", amountUnit: "قطعة واحدة", numberInArray: 9, carb: "١٢"),
Food(foodType: .carbo, foodName: "خبز التوست الاسمر", amountUnit: "قطعة واحدة", numberInArray: 10, carb: "١٠"),
Food(foodType: .carbo, foodName: "خبز صامولي", amountUnit: "نصف صامولي", numberInArray: 11, carb: "١٥"),
Food(foodType: .carbo, foodName: "شوفان", amountUnit: "ملعقة واحدة", numberInArray: 12, carb: "٦"),
Food(foodType: .carbo, foodName: "المعكرونة", amountUnit: "نصف كوب", numberInArray: 13, carb: "١٥"),
Food(foodType: .carbo, foodName: "الفشار", amountUnit: "٣ كوب", numberInArray: 14, carb: "١٥"),
Food(foodType: .carbo, foodName: "كورن فليكس", amountUnit: "نصف كوب", numberInArray: 15, carb: "١٥"),
Food(foodType: .carbo, foodName: "بسكويت", amountUnit: "شريحتين", numberInArray: 16, carb: "١٥"),
Food(foodType: .carbo, foodName: "شابورة", amountUnit: "شريحتين", numberInArray: 17, carb: "١٥"),
Food(foodType: .carbo, foodName: "حمص", amountUnit: "نصف كوب", numberInArray: 18, carb: "١٦"),


    
    ]
    
    
     static func getProteinList() -> [Food]{
        return proteinList
    }
    
    static func getMilkAndDairyList() -> [Food] {
        return milkAndDairyList
    }
    
    static func getVegList() -> [Food] {
        return vegList
    }
    
    static func getFruitList() -> [Food] {
        return fruitList
    }
    
    static func getCarboList() -> [Food] {
        return carboList
    }
    
    static func checkOrUncheckOnOriginalList(food: Food, isChecked: Bool){
        
        switch("\(food.foodType)"){
        case "protein":
        proteinList[food.numberInArray].checked = isChecked
        case "milkAndDairy":
        milkAndDairyList[food.numberInArray].checked = isChecked
        case "veg":
        vegList[food.numberInArray].checked = isChecked
        case "fruit":
        fruitList[food.numberInArray].checked = isChecked
        default :
        carboList[food.numberInArray].checked = isChecked

        }
    }
    
     static func getProperList(passTagNum: Int) -> [Food] {
        
        switch(passTagNum) {
               case 1: return proteinList
               case 2: return milkAndDairyList
               case 3: return vegList
               case 4: return fruitList
               default : return carboList
               }
        
    }
        
        static func addToBasket(food: Food) {
            foodBasket.append(food)
        }
        
        static func removeFromBasket(food: Food) {
            if foodBasket.count > 0 {
            for num in 0...(foodBasket.count-1) {
                if foodBasket[num].foodName == food.foodName {
                    foodBasket.remove(at: num)
                    return //if you found it get off from the method
                    }
            
                }
            }
    }
    
    static func findInBasket(food: Food) -> Int {
        
        if foodBasket.count > 0 {
        for num in 0...(foodBasket.count-1) {
            if foodBasket[num].foodType == food.foodType &&
                foodBasket[num].foodName == food.foodName {
                return num
                }
            }
        }
        return -1
        
    }
    
    //
    static func findInOriginalList(foodName: String) -> [Int] {
        
        //First is foodType number the second is number of food in array
        
        //check in protein
        for food in getProperList(passTagNum: 0) {
            if foodName == food.foodName {
                return [0,food.numberInArray]
            }
        }
       //check in milk and dairy
           for food in getProperList(passTagNum: 1) {
               if foodName == food.foodName {
                   return [1,food.numberInArray]
               }
           }
        //check in milk and dairy
        for food in getProperList(passTagNum: 2) {
            if foodName == food.foodName {
                return [2,food.numberInArray]
            }
        }
        //check in veg
        for food in getProperList(passTagNum: 3) {
            if foodName == food.foodName {
                return [3,food.numberInArray]
            }
        }
        //check in fruit
        for food in getProperList(passTagNum: 4) {
            if foodName == food.foodName {
                return [4,food.numberInArray]
            }
        }
        //check in carbo
        for food in getProperList(passTagNum: 5) {
            if foodName == food.foodName {
                return [5,food.numberInArray]
            }
        }
        return [-1,-1]
    }
    
 
    static func convertFromArabicNumToEnglish(arabicNum: String) -> Double {
        //
        let formatter: NumberFormatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
        //
        let englishNum = formatter.number(from: arabicNum)
        let doubleEnglishNum = Double(englishNum!)
        
        return doubleEnglishNum
    }
    
    static func getDataForSearchResults() -> [String] {
        
        var result = [String]()
        
        for protein in getProteinList() {
            result.append(protein.foodName)
        }
        for milkAndDairy in getMilkAndDairyList() {
            result.append(milkAndDairy.foodName)
        }
        for veg in getVegList() {
            result.append(veg.foodName)
        }
        for fruit in getFruitList() {
            result.append(fruit.foodName)
        }
        for carbo in getCarboList() {
            result.append(carbo.foodName)
        }
                
        return result
        
    }
    
 
    
    
    
    
    }


