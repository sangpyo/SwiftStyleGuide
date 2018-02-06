//: [Previous](@previous)
/*:
 ## 2.    이름 지정
 
 - - -
 설명적이고 일관된 이름 지정을 통해 코드를 읽고 이해하기 쉽게 한다.
   * 간결성 보다 명확성을 더 우선시 한다.
     * 이름의 길이에 대해 상관하지 않는다.
   * `Method/Function, Properties, Variables, Constant, Argument, Enum case` 이름에 소문자로 시작하는 lowerCamelCase 사용 한다. (snake_case 는 사용하지 않음)
   * `Class, Enum, Struct, Protocol` 이름에 대문자로 시작하는 UpperCamelCase를 사용 한다. (snake_case 사용 하지 않음)
   * 필요 단어 모두 포함 (불필요 단어 생략) 한다.
   * 타입이 아닌 역활에 기초한 이름 사용 한다.
 
 - - -
 
 ### 2.1    클래스

 * 함수 이름은 UpperCamelCase 사용
 * 함수 이름에는 접두어를 붙이지 않음

  Swift 타입은 자동적으로 네임 스페이스를 포함하는 네임 스페이스가 지정되므로 UI와 같은 클래스 접두어를 사용하지 않는다.
 다른 모듈의 두이름이 충돌하면 형식 이름 앞에 모듈 이름을 붙여 명확하게 한다.
 
     import SomeModule

     let myClass = SomeModule.MyClass()

 - - -
 
 ### 2.2    Delegate

 Delegate 메소드를 설계할때 첫번째 매개변수는 반드시 Delegate의 원본 이여야 한다.
 또한 이름이 지정 되지 않아야 한다.
 (`UIKit`에 `Delegate` 메소드 디자인 참고. 예: `UITableViewControllerDataSource`)

 좋은 예:
 
      protocol NamePickerDelegate {
         func namePickerView(_ namePickerView: NamePickerView, didSelectName name: String)
         func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool
      }

 나쁜 예:
 
      protocol NamePickerDelegate {
         func namePickerView(namePicker: NamePickerViewController, name: String)
         func namePickerViewShoudReload() -> Bool
      }

 ### 2.3    Type Inferred Context

 간결하고 명확한 코드 작성을 위해 컴파일러 형식 유추 컨텍스트를 사용한다.

 좋은 예:
 
     let selector = #selector(viewDidLoad)
     view.backgroundColor = .red
     let toView = context.view(forKey: .to)
     let view = UIView(frame: .zer)

 나쁜 예:

     let selector = #selector(ViewController.viewDidLoad)
     view.backgroundColor = UIColor.red
     let toView = context.view(forKey: UITransitionContextViewKey.to)
     let view = UIView(frame: CGRect.zero)

 - - -
 
 ### 2.4    Generics

 Genric 타입은 대문자 CamelCase 형식 이름을 가진 설명적인 이름이여야 한다.
 타입 이름이 의미있는 관계 역활이 아닌 경우 `T, U, V`와 같은 기존 형식인 단일 대문자를 사용한다.

 좋은 예:

     struct Stack<Element>
     func write<Target: OutputStream>(to target: inout Target)
     func swap<T>(_ a: inout T, _ b: inout T)

 나쁜 예:

     struct Stack<T>
     func write<target: OutputStream><to target: inout target>
     func swap<Thing>(_ a: inout: Thing, _ b: inout Thing)

 - - -
 
 ### 2.5    함수

 * 함수 이름은 lowerCamelCase를 사용한다.
 * 함수 이름 앞에는 get을 붙이지 않는다.

 좋은 예:

     func name(for user: User) -> String?
 
 나쁜 예:

     func getName(for user: User) -> String?

 * Action 함수 네이밍은 '주어 + 동사 + 목적어' 형태를 사용한다.
   * __Tab__ 은 `UIControlEvents`의 `.touchUpInside`에 해당하고, __Press__ 는 `.touchDonw`에 해당한다.
   * _will ~_ 은 특정 행위가 일어나기 직전이고,
   * _did ~_ 는 특정 행위가 일어난 직후이다.
   * _should ~_ 는 일반적으로 `Bool`을 반환하는 함수에 사용한다.

 좋은 예:
 
     func backButtonDidTap() {
         //...
     }

 나쁜 예:
 
     func back() {
         //...
     }
 
     func pressBack {
         //...
     }

 - - -

 ### 2.6    변수

 * 변수 이름은 lowerCamelCase를 사용 한다.

 - - -
 
 ### 2.7    상수

 * 상수 이름은 lowerCamelCase를 사용 한다.

 좋은 예:
 
     let maximumNumberOfLines = 3
 
 나쁜 예:
 
     let kMaximumNumberOfLines = 3
     let MAX_LINES = 3

 - - -
 
 ### 2.8    열거형

 * enum의 각 case는 lowerCamelCase를 사용 한다.

 좋은 예:

     enum Result {
        case .success
        case .failure
     }

 나쁜 예:
 
     enum Result {
        case .Success
        case .Failure
     }

 - - -
 
 ### 2.9    약어
 
 * 약어로 시작하는 경우 소문자로 표기
 * 그외 경우 항상 대문자로 표기

 좋은 예:
 */
import Foundation

     let userID: Int?
     let html: String?
     let websiteURL: NSURL?
     let urlString: String?
     class URLFinder {
         // ...
      }

//: 나쁜 예:
 
     let userId: Int?
     let HTML: String?
     let websiteUrl: NSURL?
     let URLString: String?
     class UrlFinder {
         // ...
     }
 /*
 - - -
 
 ### 2.10    클로저
 
 * 파라미터와 리턴 타입이 없는 Closure 정의시 `() -> Void`를 사용한다.
 
 좋은 예:
*/
      let completionBlock1: (() -> Void)?
 
//: 나쁜 예:
 
      let completionBlock2: (() -> ())?
      //let completionBlock3: ((Void) -> (Void))?
      let completionBlock4: (() -> (Void))?

/*:
 * 클로저 정의시 파라미터에는 괄호를 사용하지 않는다.
 
 좋은 예:
 
      completion { operation, responseObject in
           // do something
      }
 
 나쁜 예:
 
      completion { (operation, responseObject) in
           // do something
      }
 
 * 클로저 정의시 타입 정의를 생략한다.
 
 좋은 예:
 
      ...,
      completion: { finished in
         // do something
      }
 
 나쁜 예:
 
      ...,
      completion: { (finished: Bool) -> Void in
          // do something
      }
 
 * 클로저 호출시 유일한 클로저를 마지막 파라미터로 받는 경우, 파라미터 이름을 생략한다.
 
 좋은 예:
 
      UIView.animate(withDuration: 0.5 {
          // do something
      }
 
 나쁜 예:
 
      UIView.animate(withDuration: 0.5, animations: { () -> Void in
         // do something
      })
 
  - - -
 
 ### 2.11
 
 인스턴스 독립적인 싱글 톤 이외 모든 상수는 static 이여야 한다.
 static 상수는 enum 규칙에 따라 컨테이너 유형으로 배치되어야 한다.
 이 컨테이터 이름은 단수(좋은 예: Constant, 나쁜 예: Constants) 이여야하며, 일정한 컨테이너라는 것이 상대적으로 분명하도록 이름 붙인다.
 이것이 명확하지 않은 경우 Constant 이름이 접미사를 추가 할 수 있다.
 
 좋은 예:
*/
     class MyGoodStyleClassName {
        enum AccessibilityIdentifier {
            static let privateButton = "private_button"
        }
        enum SillyMethConstant {
            static let indianPi = 3
        }
        static let shared = MyGoodStyleClassName()
     }

//: 나쁜 예:
 
      class MyBadStyleClassName {
         let kPrivateButtonAccessibilityIdentifier = "private_button"
         enum SillyMath {
             static let indialPi = 3
         }
         enum Singleton {
             static let shared = MyBadStyleClassName()
         }
     }
/*:
  - - -
 
 ### 2.12
 
 Generic과 associated type의 경우,
 generic을 설명할 수 있는 UpperCamelCase 단어를 사용한다.
 만일 이 단어가 준수 하는 프로토콜 또는 수퍼클래스와 충돌한다면, 이 associated type 또는 generic name에 `Type` 을 접미사로 덧붙있 수 있다.
 
 예:
 
      class SomeClass<Modle> { ... }
      protocol Modelable {
         associatedtype Model
      }
      protocol Sequence {
          associatedtype IteratorType: Iterator
      }
 
  - - -
 
 ### 2.13
 
 이름은 설명적이고 명확해야 한다.
 
 좋은 예:
 
      class RoundAnimatingButton: UIButton { ...
 
 나쁜 예:
 
      class CustomButton: UIButton { ...
 
  - - -
 
 ### 2.14
 
 약어를 사용하지 않는다.
 
 좋은 예:
*/
        import UIKit

        class RoundAnimatingButton: UIButton {
            let animationDuration: TimeInterval = 5.0
 
           func startAnimating() {
             let firstSubview = subviews.first
            firstSubview?.resignFirstResponder()
           }
         }
 
//: 나쁜 예:
 
         class RoundAnimating: UIButton {
            let aniDur: TimeInterval = 5.0
 
            func srtAnimating() {
                let v = subviews.first
                v?.resignFirstResponder()
            }
         }
/*:
  - - -
 
 ### 2.15
 
 상수, 변수 이름이 명확하지 않을때 타입 정보를 포함한다.
 
 좋은 예:
*/
    class ConnectionTableViewCell: UITableViewCell {
        let personImageView: UIImageView? = nil
 
        let animationDuration: TimeInterval = 4.0
 
        // 프러퍼티 이름이 문자열을 의미하므로 String을 포함하지 않는다.
        let firstName: String = ""
 
        let pupupViewController: UIView? = nil
        // 'UIViewContrller'의 서브 클래스인 테이블 뷰, 컨트롤러, 콜렉션 뷰 컨트롤러, 분할 뷰 컨트롤러 등과 같이 작업 할 때
        // 이름에 유형을 기술
        let popupTableViewController: UITableViewController? = nil
 
        // outlet에는 outlet의 타입을 property 이름으로 지정
        @IBOutlet weak var submitButton: UIButton!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var nameLable: UILabel!
    }
 
//: 나쁜 예:

     class BadStyleConnectionTableViewCell: UITableViewCell {
        // UIImage가 아니므로 Image를 접미어로 사용하면 않된다.
        let personImage: UIImageView? = nil
 
        // 'String' 이 아니고, 'UILable' 이므로 'firstNameLabel'로 기술 하여야 한다.
        let firstName: UILabel? = nil
 
        // 'animation'은 시간 간격이 아니므로 'animationDuration' 또는 'animationTimeInterval'로 기술 하여야 한다.
        let animation: TimeInterval = 1.0
 
        // 'String' 이므로, 'transitionString' 또는 'transitionText'로 기술하여야 한다.
        let transition: String = ""
 
        // 'View'가 아닌 'View Controller' 이다.
        let pupupView: UIViewController? = nil
 
        // 약어를 사용하지 않는다. 그러므로 'VC' 대신 'ViewController'를 기술하여야 한다.
        let popupVC: UIViewController? = nil
 
        // Table View Controller 임을 나타내야 한다. (View Controller 가 아닌...)
        let popupViewController: UITableViewController? = nil
 
        // 일관성을 위해 타입 이름을 property 끝에 붙이야 한다. (submitButton [O])
        @IBOutlet weak var btnSubmit: UIButton!
        @IBOutlet weak var buttonSubmit: UIButton!
 
        // outlet으로된 property는 항상 property에 타입 이름을 가져야 한다. (lastNameLable [O])
        @IBOutlet weak var lastName: UILabel!
     }
/*:
  - - -
 
 ### 2.16
 
 함수 인자의 이름을 지정할 때 각 인자의 목적을 쉽게 이해할 수 있도록 함수를 읽을 수 있어야 한다.
 
  - - -
 
 ### 2.17
 
 'protocol'은
 * 어떤 것을 설명하는 경우 명사로 지정해야 한다. (예: Collection)
 * 능력을 설명하는 경우 `able`, `ible` 또는 `ing`를 접미사로 붙여야 한다. (예: Equatable, ProgressReporting)
 * 위 두가지 어디에도 해당하지 않으면, `Protocol`을  접미사로 추가 한다.
 
 예:
 */
// 이름은 명사이고 프로토콜이 무엇을 하는지 기술하고 있다.
protocol TableViewSectionProvider {
    func rowHeight(at row: Int) -> CGFloat
    var numberOfRows: Int { get }
    // ...
}

// 이 프로토콜의 능력으로 이름을 기술하고 있다.
protocol Loggable {
    func logCurrentState()
    //...
}

// 'InputTextView' 클래스가 있다고 가정하고 있지만, 어떤 기능을 가진 일반화된 프로토콜을 필요로 할 수도 있다.
// 그러므로 'Protocol' 접미사를 붙이는것이 적절할 수 있다.
protocol InputTextViewProtocol {
    func sendTrakingEvent()
    func inputText() -> String
    //...
}
/*:
 ### 2.18    Naming
 
 `Method/Function, Properties, Variables, Constant, Argument, Enum case` 이름에 소문자로 시작하는 lowerCamelCase 사용 한다.
 `Class, Enum, Struct 이름은 UpperCamelCase` 형식의 이름 사용한다.
 
 좋은 예:
 */
 class Car {
    let maxSpeed = 100.0
    var currentSpeed = 85.0
    var numberOfWheels = 4
 
    func accelerationVehicleTo(speed: Double) {
        currentSpeed = speed
    }
 }
 
//: 나쁜 예:
 
 class Bike {
    let NUMBER_OF_WHEELS = 2
    let MAX_SPEED = 150.0
 
    var mCurrentSpeed = 44.0
 
    func accelerationVehicleTo(speed: Double) {
        mCurrentSpeed = speed
    }
 }

/*:
 
 */

//: [Next](@next)
