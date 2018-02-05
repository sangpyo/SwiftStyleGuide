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
 - Callout(4.1.6):
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
 - Callout(4.1.8):
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
//: 좋은 예:
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
//: 좋은 예:
class MyMoneyGoodCase {
    var showMeTheMoney: Int {
        return 2_000_000
    }
}
let myGoodMoney = MyMoneyGoodCase()
myGoodMoney.showMeTheMoney
//: 나쁜 예:
class MyMoneyBadCase {
    func showMeTheMoney() -> Int {
        return 1_000_000
    }
}
let myBadMoney = MyMoneyBadCase()
myBadMoney.showMeTheMoney()

/*:
 - Callout(4.1.15):
 `static` 함수 또는 `static` 속성 집합의 네임스페이스를 지정하려면, `class` 또는 `struct`에 case가 없는 `enum`을 사용한다.
 이렇게 하면 컨테이너에 `private init() {}` 을 추가하지 않아도 된다.
 
 */
struct Olympic {
    enum OlympicEvent {
        static var nextWinterEvent: Int {
            return 2018
        }
        static var nextSummerEvent: Int {
            return 2020
        }
        static func winterOlympicEventOfYear(_ year: Int) -> String {
            switch year {
            case 2018:
                return "평창"
            default:
                return ""
            }
        }
        
        static func summerOlympicEventOfYear(_ year: Int) -> String {
            switch year {
            case 2016:
                return "Rio"
            default:
                return ""
            }
        }
    }
}

let winterOlympicEvent = Olympic.OlympicEvent.nextSummerEvent

/*:
 - - -
 
 ### 4.2    Access Modifier
*/
/*:
 - Callout(4.2.1):
 `access modifier`를 먼저 작성 한다.
 
 */
//: 좋은 예:
extension GoodStyle {
    private static let myPrivateNumber: Int = 222
}
//: 나쁜 예:
extension BadStyle {
    static private let myPrivateAnotherNumber: Int = 111
}
/*:
 - Callout(4.2.2):
 `access modifier`는 단독으로 표시 되지 않도록 한다.
 
 */
//: 좋은 예:
open class WinterOlympic {
    
}
//: 나쁜 예:
open
class SummerOlympic {
    
}
/*:
 - Callout(4.2.3):
 `internal`은 access modifier 의 기본값이므로 기술하지 않는다.
 
 */
//: 좋은 예:
class SuperCar {

}
//: 나쁜 예:
internal class SportsCar {
    
}
/*:
 - Callout(4.2.4):
 Unit Test 를 통해 속성에 접근해야 하는 경우 `@testable import ModuleName`을 사용하여 `internal`을 사용하도록 만든다.
 \
 속성을 `private` 으로 설정해야 하지만 unit test 목적으로 `internal` 로 해야 한다면, 주석에 이를 적절히 설명하도록 한다.
 이 주석에는 명확하게 구분하기 위해 `- warning: ` 마크업 구문을 사용한다.
 
 */
/**
 이 속성은 private 이름을 정의 한다.
 - warning: `@testable`에 대해서는 `private` 이 아니다.
 */
let privateName = "Apple Seed"
/*:
 - Callout(4.2.5):
 가능하면 `private` 보다 `fileprivate` 으로 지정한다.
 
 */
/*:
 - Callout(4.2.6):
 `public`과 `open` 을 선택할때,
 모듈 외부에서 어떤 것을 서브클래스가 가능하게 할려면 `open` 을 사용하고 그렇지 않은 경우 `public`을 사용 한다.
 `@testable import` 를 사용하여 테스트 하는 경우 `internal` 을 사용해도 서브클래싱이 가능하므로, 이와 같은 경우 `open` 을 사용하지 않아야 한다.
 \
 일반적으로, 라이브러리에 관해서는 `open`을 사용하는 것이 좀더 자유로운 방향으로 접근하지만, 동시에 여러 모듈에서 쉽게 변경할 수 있는 앱과 같은 코드베이스의 모듈에 대해서는 보수적으로 접근 한다.
 
 */
/*:
 - - -

 ### 4.3    Custom Operator
 
 - Callout(4.3.1):
 사용자 정의 연산자를 만들 경우 이름 지정 함수로 만든다.
 \
 사용자 정의 연산자를 도입 할 경우, 새 연사자의 도입이 다른 구조를 사용하는 것이 아니라 글로벌 스코프에서 왜 필요한지 매우 합당한 이유가 있어야 한다.
 \
 기존 연산자(특히 `==`)를 재 정의하여 새로운 타입을 지원할 수도 있다.
 그러나, 재 정의는 연산자의 의미를 보존해야 한다. 예를 들어 `==`는 동등성을 의미하고 boolean을 반환해야 한다.
 
 */
/*:
 - - -

 ### 4.4    Switch 문과 `enum`

 - Callout(4.4.1):
 switch 문을 유한 가능성 집합인 `enum`을 사용할때, `default` case는 사용하지 않는다. 절대로...
 \
 대신 사용하지 않는 case를 제일 아래에 두고 이 case가 실행되지 않도록 `break` 키워드를 사용한다.
*/
/*:
 - Callout(4.4.2):
 Swift에서 `switch` 케이스의 break 는 기본 값이므로, `break` 키워드는 필요한 경우를 제외하고 포함 시키지 않는다.
 
*/
/*:
 - Callout(4.4.3):
 `case` 문은 `switch` 문과 나란히 줄 세운다.
 
 */
/*:
 - Callout(4.4.4):
 value 와 관계된 case 를 정의할때, 이 값은 단순 타입을 기술하는 것과 반대로 적절히 레이블된 value 여야 한다.
 (예: `case hunger(Int)` 대신에 `case hunger(hungerLevel: Int)`)
 
 */
enum Problem {
    case attitude
    case hair
    case hunger(hungerLevel: Int)
    case etc
}

func handleProblem(problem: Problem) {
    switch problem {
    case .attitude:
        print("At leat I don't have a hair problem.")
    case .hair:
        print("Your barber didn't know when to stop.")
    case .hunger(let hungerLevel):
        print("The hunger level is \(hungerLevel).")
    case .etc:
        break
    }
}
/*:
 
 - Callout(4.4.5):
 가능성 목록에는 `fallthrough` 키워드 보다 case의 가능성 목록(예: case 1, 2, 3:)을 사용 한다.
 
 */
//: 좋은 예:
func goodStyleSwitchStatement(lengthUnit: LengthFormatter.Unit) {
    switch lengthUnit {
    case .centimeter, .kilometer, .meter, .millimeter:
        print("미터법")
    case .foot, .yard, .inch, .mile:
        print("야드파운드법")
    }
}
//: 나쁜 예:
func badStyleSwitchStatement(lengthUnit: LengthFormatter.Unit) {
    switch lengthUnit {
    case .centimeter: fallthrough
    case .kilometer: fallthrough
    case .meter: fallthrough
    case .millimeter:
        print("미터법")
    case .foot: fallthrough
    case .yard: fallthrough
    case .inch: fallthrough
    case .mile:
        print("야드파운드법")
    }
}
/*:
 - Callout(4.4.6):
 도달하지 않아야 할 default case 가 있는 경우 오류를 던지거나 assertion 처리하는것이 바람직 하다.
 
 */
enum DigitError: Error {
    case invalidDigit(Int)
}

func handleDigit(_ digit: Int) throws {
    switch digit {
    case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
        print("Yes, \(digit) is a digit")
    default:
        throw DigitError.invalidDigit(digit)
    }
}
/*:
 - - -

 ### 4.5    Optional
 
 - Callout(4.5.1):
 
 암시적 unwrap 된 optional 은 `@IBOutlet`에 대해서만 사용한다.
 그 외 다른 모든 경우에는 non-optional 또는 일반 optional 속성에 사용하는 것이 좋다.
 절대 `nil` 이 될 수 없는 경우가 있으나, 안전과 일관성을 위해 그렇게 하지 않는다.
 마찬가지로 force unwrap 은 사용하지 않는다.
*/
/*:
 - Callout(4.5.2):
 `as!` 또는 `try!` 는 사용하지 않는다.
 
 */
/*:
 - Callout(4.5.3):
 optional 에 저장된 값을 실제로 사용하지 않지만, 이 값이 `nil` 인지 여부를 결정할 필요가 있다.
 이 값이 `nil`인지 여부의 명시적 확인은 'if let`을 사용 한다.
 
 */
//: 좋은 예:
var someOptional: String?
if someOptional != nil {
    // do something
}
//: 나쁜 예:
if let _ = someOptional {
    // ...
}
/*:
 - Callout(4.5.4):
 `unowned`는 사용하지 않는다.
 \
 `unowned` 는 암시적인 unwrap된 `weak` property와 어느정도 동등하다고 생각할 수도 있다.(`unowned` 는 참조 카운터를 완전히 무시하므로 약간의 성능 향상이 있긴 하다.)
 암묵적 unwrap 된 것이 필요한것이 아니므로, `unowned` property 는 사용하지 않는다.
 
 */
//: 좋은 예:
weak var parentViewController: UIViewController?

//: 나쁜 예:
weak var grandParentViewController: UIViewController!
unowned var grandGrandParentViewController: UIViewController
/*:
 - Callout(4.5.5):
 optional 을 unwrap 할 때 상수 또는 변수와 unwrap 한 이름을 같은 이름으로 한다.
 
 */
//: 좋은 예:
func goodStyleWithOptionalParameter(parameter: String?) {
    guard let parameter = parameter else {
        return
    }
    // do something
    print("\(parameter)")
}
//: 나쁜 예:
func badStyleWithOptionalParameter(parameter: String?) {
    guard let myParameter = parameter else {
        return
    }
    // do something
    print("\(myParameter)")
}
/*:
 - - -

 ### 4.6    Protocol
 
 - Callout(4.6.1):
 프로토콜을 구현할 때 코드의 구성하는 다음의 두 가지 방법이 있다.
 \
 1: `// MARK: ` 주석을 사용하여 프로토콜 구현을 나머지 코드와 분리
 \
 2: `class` / `struct` 구현 코드 외부의 확장을 사용하지만 동일 소스에 둠
 \
 \
 extension 기능을 사용할 때 확장 기능의 메소드를 하위 클래스로 재 정의 할 수 없으므로 테스트가 어려워 질 수 있다. 이것은 일반적인 사용 사례라면 일관성을 위해 첫번째 방법을 사용하는 것이 좋다. 그렇지 않으면 두 번째 방법으로 관심사 분리로 깨끗하게 코드 관리가 가능하도록 구성 한다.
 \
 \
 두 번째 방법을 사용하는 경우에도 `// MARK: ` 를 추가하여 Xcode 의 UI 에서 메소드/퍼러퍼티/클래스/기타 로 목록화 하여 일목요연하게 읽을 수 있도록 한다.
 
 */
/*:
 - - -
 
 ### 4.7    Properties
 
 - Callout(4.7.1):
 읽기 전용의 계산된 속성을 만드는 경우, `get {}` 없이 getter를 제공한다.
 
 */
//: 좋은 예:
var goodStyleComputedProperty: String {
    if someBoolean {
        return "I love Ferrari."
    }
    return "I love Totoro."
}
//: 나쁜 예:
var badStyleComputedProperty: String {
    get {
        if someBoolean {
            return "I love Ferrari."
        }
        return "I love Totoro."
    }
}
/*:
 - Callout(4.7.2):
 `get {}`, `set {}`, `willSet`, `didSet`을 사용할때, 각 블럭에 들여 쓰기 한다.
 
 */
/*:
 - Callout(4.7.3):
 `willSet`, `didSet`, `set` 에서 새 값 또는 이전 값에 대해 사용자 정의 이름을 붙일 수 있다 하더라도, 기본값인 표준으로 제공되는 `newValue`, `oldValue` 식별자를 사용 한다.
 
 */
//: 좋은 예:
var goodStyleStoredProperty: String = "페라리" {
    willSet {
        print("\(newValue)으로 설정 될려고함.")
    }
    didSet {
        print("\(oldValue)를 \(goodStyleStoredProperty)로 설정 됨")
    }
}

var goodStyleComputed: String {
    get {
        if someBoolean {
            return ""
        }
        return goodStyleComputedProperty
    }
    set {
        goodStyleStoredProperty = newValue
    }
}
//: 나쁜 예:
var badStyleStoredProperty: String = "페라리" {
    willSet(newCar) {
        print("\(newCar)으로 설정 될려고함.")
    }
    didSet(oldCar) {
        print("\(oldCar)를 \(badStyleStoredProperty)로 설정 됨")
    }
}

var badStyleComputed: String {
    get {
        if someBoolean {
            return ""
        }
        return badStyleComputedProperty
    }
    set(newCar) {
        badStyleStoredProperty = newCar
    }
}
/*:
 - Callout(4.7.4):
 다음과 같이 싱글톤 속성을 선언 할 수 있다.
 
 */
class CarManager {
    static let shared = CarManager()
    
    // do something
}
/*:
 - - -
 
 ### 4.8    Closure
 
*/
/*:
 - Callout(4.8.1):
 매개 변수의 유형이 명백하면 유형 이름을 생략해도 좋지만 명시적으로 기술해도 좋다.
 가독성이 향상되고 명확한 세부 사항을 추가하고 때로는 반복적인 부분을 제거하여 최상의 판단력과 일관성을 유지하도록 한다.
 
 */
//: 사용 예:
func someDataTask(completionHandler: (Data, URLResponse) -> Void) -> Void {
    //...
}

someDataTask(completionHandler: { (data, response) in
    print("\(response)")
})

someDataTask { (data: Data, response: URLResponse) in
    print("\(response)")
}

[1, 2, 3].flatMap{ String($0) }
/*:
 - Callout(4.8.2):
 
 클로저를 유형으로 기술하면, 특별히 필요하지 않은 한, 중괄호{}로 묶을 필요가 없다. (예: 유형이 optional 이거나 또는 클로저가 다른 클로저 내부에 있는 경우)
 항상 클로저의 인수는 괄호()로 묶고, 인수가 없을때 괄호()로 표현하고, 반환값이 없을때 `Void`로 표시 한다.
 */
//: 예:
let completionBlock: (Bool) -> Void = { (success) in
    print("Success? \(success)")
}

let completionBlock2: () -> Void = {
    print("Completed")
}

let completionBlock3: (() -> Void)? = nil
/*:
 - Callout(4.8.3):
 가능한 경우 수평 오버플로우가 너무 많지 않도록 (가능하면 한줄이 160글자가 넘지 않도록) 매개 변수 이름을 클로저의 여는 중괄호와 같은 줄에 유지 한다.
 
 */
/*:
 - Callout(4.8.4):
 매개 변수 이름이 없이 클로저의 의미가 분명하지 않으면 trailing closure 구문을 사용한다.
 
 
 */
func doSomethingWithSuccessAndFailureHandler(with count: Double, successHandler: (String) -> Void, failure: (String) -> Void) {
    // do something
}
func doSomethingWithSuccessHandler(with count: Double, successHandler: (String) -> Void) {
    // do something
}
// trailing closure
doSomethingWithSuccessHandler(with: 1.0) { (parameter1) in
    print("Success with \(parameter1)")
}
// no trailing closure
doSomethingWithSuccessAndFailureHandler(with: 1.0,
                                        successHandler: { (parameter1) in
                                            print("Success with \(parameter1)")
},
                                        failure: { (parameter1) in
                                            print("Failure with \(parameter1)")
})
/*:
 - - -
 
 ### 4.9    Array
 
 - Callout(4.9.1):
 일반적으로 subscript 로 배열에 직접 접근 하지 않도록 한다. \
 가능하면 `.first` 또는 `.last` 처럼 optional 이고 크래쉬가 발생하지 않는 방법을 사용한다. \
 가능하면 `for i in 0 ..< items.count`보단 `for item in items` 사용하도록 한다. \
 subscript 로 직접 접근해야 하는 경우 반드시 경계 검사를 수행 한다. \
 `for (index, value) in items.enumerated()` 로 인덱스와 값을 모두 얻을 수 있다.
 
*/
/*:
 - Callout(4.9.2):
 배열을 추가/연결하기위해 `+=` 또는 `+` 연산자를 사용하지 않는다. \
 대신 `append()` 또는 `append(contentOf)` 을 사용한다. (현재 버전의 Swift에선 이 방법 성능이 우수하다.) \
 다른 배열을 기반으로하는 배열을 선언하고 이를 불변(immutable)으로 유지해야 하는 경우, \
 `let myNewArray = array1 + array2` 대신 let myNewArray = [array1, array2].joined()를 사용한다.
 
 */

//: 좋은 예:
func goodStyleAddArray() -> Array<Int> {
    var array1 = [1, 3, 5 ,7, 9]
    var array2 = [2, 4, 6, 8, 10]
    
    array1.append(11)
    print("\(array1)")
    array2.append(contentsOf: [12, 14, 16])
    print("\(array2)")
    let myNewArray = [array1, array2].joined()
    
    return myNewArray.map{ $0 }
}
let array1 = goodStyleAddArray()
print("\(array1)")

//: 나쁜 예:
func badStyleAddArray() -> Array<Int> {
    var array1 = [1, 3, 5 ,7, 9]
    var array2 = [2, 4, 6, 8, 10]
    
    array1 += [11]
    print("\(array1)")
    array2 = array2 + [12, 14,16]
    print("\(array2)")
    let myNewArray = array1 + array2
    
    return myNewArray
}
let array2 = badStyleAddArray()
print("\(array2)")

/*:
 - - -
 
 ### 4.10    Error Handling
 
 - - -
 


 */
//: [Next](@next)
