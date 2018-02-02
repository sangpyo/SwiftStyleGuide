//: [Previous](@previous)
/*:
 ## 4.    코딩 스타일
 
 ### 4.1    일반 사항
 
 - Callout(4.1.1):
 가능하면 `var`보단 `let`을 사용
*/
/*:
 - Callout(4.1.2):
 하나의 컬렉션에서 다를 것으로 변환 하기 위해 반복 하는 것은 `map`, `filter`, `reduce` 를 조합한다.
 이때 이들 메소드를 사용할때 부작용이 있는 클로저는 사용하지 않는다.
 */
//: 좋은 예:
class GoodStyle {
    let stringOfInts = [1, 2, 4].flatMap { String($0) }
    
    let evenNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].filter { $0 % 2 == 0}
}
//: 나쁜 예:
class BadStyle {
    var stringOfInts = [String]()
    
    var evenNumbers = [Int]()
    
    init() {
        for integer in [1, 2, 4] {
            stringOfInts.append(String(integer))
        }
        
        for integer in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] {
            if integer % 2 == 0 {
                evenNumbers.append(integer)
            }
        }
    }
}
/*:

 - Callout(4.1.3):
 상수, 변수가 유추될 수 있으면, 그 타입을 기술하지 않는다.
 
 */
//: 좋은 예
let teamName = "Red Bull Formula One Team"

//: 나쁜 예
let driverName: String = "Sebastian Vettel"

/*:
 - Callout(4.1.4):
 함수가 다중 값을 반환하는 경우 튜플을 사용한다.
 반환할 내용을 명확히 하기 위해 레이블이 있는 튜플을 사용한다.
 특정 튜플을 두 번 이상 사용하는 경우 `typealias`를 사용하는 것을 고려 한다.
 튜플에 셋 이상 항목을 반환하는 경우 `struct` 또는 `class`를 고려 한다.
 */
//: 예:
func mainDriverName() -> (firstName: String, lastName: String) {
    return ("Sebastian", "Vettel")
}
let name = mainDriverName()
let firstName = name.firstName
let lastName = name.lastName
/*:
 - Callout(4.1.5):
 클래스를 위한 `delegate` 와 `protocol`을 생성할때 retain cycle을 주의하여야 한다.
 일반적으로 이런 속석에는 `weak`를 선언해야 한다.
 */
//: 예:
import UIKit
class ConnectionTableViewController: UIViewController {
    
}
extension ConnectionTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "id")!
    }
}
class MyConnectionTableViewController: UITableViewController {

    weak var dataSource = ConnectionTableViewController()
}

/*:
 -Callout(4.1.6):
 escaping closure에서 직접 `self` 를 호출할때 retain cycle을 발생 할 수 있으므로 주의 하여야 한다. - 이럴 경우 capture list를 사용하여야 한다.
 */
//: 예:
/*
class MyClass {
    func myFunctionWithEscapingClosure(closure: () -> Void) {
    
    }
    func doSomething() {
        
    }
}
let myClass: MyClass = MyClass()
myClass.myFunctionWithEscapingClosure { [weak self]  in
    self?.doSomething()
    
    guard let strongSelf = self else {
        return
    }
    
    strongSelf.doSomething()
}
 */
/*:
 - Callout(4.1.7):
 제어 흐름문에 괄호를 사용하지 않는다.
*/
//: 좋은 예:
func GoodStyeControlFlow(_ score1: Int, score2: Int) {
    if score1 == score2 {
        //...
    }
}
//: 나쁜 예:
func BadStyleControlFlow(_ score1: Int, score2: Int) {
    if (score1 == score2) {
        //...
    }
}
/*:
 - Callout(4.1.8)
 `enum`은 타입을 기술하지 않는다.
 */
//: 좋은 예:
import UIKit

let goodStyleTableView = UITableViewController(style: .grouped)
//: 나쁜 예:
let badStyelTableView = UITableViewController(style: UITableViewStyle.grouped)
/*:
 - Callout(4.19):
 `enum`과 달리 클래스 메소드에서 컨텍스트를 유추하는 것이 일반적으로 어려우므로 클래스 메소드에 대한 축약 표기를 사용하지 않는다.
 */
//: 좋은 예:
let imageView = UIImageView()

imageView.backgroundColor = UIColor.black
//: 나쁜 예:
// UIColor는 클래스이므로 컨텍스트를 생략하지 않는다.
imageView.backgroundColor = .black
/*:
 - Callout(4.1.10):
 꼭 필요한 경우에만 `.self`를 사용한다.
 */
/*:
 - Callout(4.1.11):
 메소드 작성시 메소드가 override 될지 여부를 고민하고 작성한다.
 override 되지 않아야 하는 경우 `final` 기술하여 테스트 등으로 메소드가 overwrite 되지 않도록 유의한다.
 일반적으로 `final`을 사용하면 컴파일 시간이 단축되므로, 이 용도로 사용하면 좋다.
 `final` 키워드를 라이브러리에 적용할때는 local project에서 `final`이 아닌 것을 변경하는 것과 반대로 라이브러리에서 무언가를 non-`final`로 변형하는 것이 중요하지 않기 때문에 주의해야 한다.
 */
//:  - Note: `final` 키워드 ???
/*:
 - Callout(4.1.12):
 `else`, `catch` 등의 구문을 사용하는 경우 블럭을 그 다음 블럭과 같은 행에 넣는다.
 [1TBS 스타일](https://en.m.wikipedia.org/wiki/Indentation_style#1TBS) 따른다.
 */
// 좋은 예:
let someBoolean = true
if someBoolean {
    // do something
} else {
    // do something else
}

do {
    let fileContent = try readFile(name: "Hello.txt")
    fileContent.count
} catch {
    print(error)
}
/*:
 - Callout(4.1.13):
 
 해당 클래스의 인스턴스가 아닌 클래스와 연결된 함수 또는 속성을 선언 할 때 클래스에 `static`을 선호 한다.
 하위 클래스에서 해당 함수를 재정의가 특별히 필요한 경우에만 'class`를 사용한다.
 가능하면 `protocol`을 사용하여 이를 구현하도록 한다.
 
 */
class MySomeClass {
    static var mySomeStaticValue = 100
    var mySomeValue = 300
    
    class func mySomeTypeMethod() {
        print("MySomeClass Type Method")
    }
    static func mySomeAnotherTypeMethod() {
        print("MySomeClass another type method")
    }
}

class MySomeSubclass: MySomeClass {
    class override func mySomeTypeMethod() {
        print("MySomeSubclass Type Method")
    }
    // 다음은 컴파일 오류가 발생한다.
    // Error: Cannot override static method
    /*
    static func mySomeAnotherTypeMethod() {
        print("MySomeSubclass another type method")
    }
     */
}

MySomeClass.mySomeTypeMethod()
let mySomeValue = MySomeClass.mySomeStaticValue
MySomeClass.mySomeStaticValue = 1_000
print("\(mySomeValue), \(MySomeClass.mySomeStaticValue)")
MySomeClass.mySomeAnotherTypeMethod()

MySomeSubclass.mySomeTypeMethod()
let mySomeValue2 = MySomeSubclass.mySomeStaticValue
MySomeSubclass.mySomeStaticValue = 2_000
print("\(mySomeValue2), \(MySomeSubclass.mySomeStaticValue)")
MySomeSubclass.mySomeAnotherTypeMethod()

/*:
 - Callout(4.1.14):

 어떤 객체, 값을 반환하는 인자가 없는 함수가 있다면, Computed Property로 변경을 고려할 필요가 있다.
 
 */
// 좋은 예:
class MyMoneyGoodCase {
    var showMeTheMoney: Int {
        return 2_000_000
    }
}
let myGoodMoney = MyMoneyGoodCase()
myGoodMoney.showMeTheMoney
// 나쁜 예:
class MyMoneyBadCase {
    func showMeTheMoney() -> Int {
        return 1_000_000
    }
}
let myBadMoney = MyMoneyBadCase()
myBadMoney.showMeTheMoney()

/*:
 - Callout(4.1.15):
 
 `static` 함수 또는 `static` 속성 집합의 네임스페이스를 지정하려면, `class` 또는 `struct`에 소문자 `enum`을 사용한다.
 이렇게 하면 컨테이너에 `private init() {}` 을 추가하지 않아도 된다.
 
 */
struct Bounus {
    enum bounusType {
        case
    }
}
/*:
 - - -
 
 ### 4.2    Access Modifier
 
 - - -
 

 ### 4.3    Custom Operation
 
 
 - - -
 

 ### 4.4    Switch Statements 와 `enum`
 
 - - -
 

 ### 4.5    Optional
 
 - - -
 

 ### 4.6    Protocol
 
 - - -
 

 ### 4.7    Properties
 
 - - -
 

 
 ### 4.8    Closure
 
 - - -
 

 
 ### 4.9    Array
 
 - - -
 

 
 ### 4.10    Error Handling
 
 - - -
 


 */
//: [Next](@next)
