# NetworkManagerExample
This is an example of how to apply [NetworkManager](https://github.com/khoavd-dev/NetworkManager) in an app.

## 📱 Platform
- Swift 6.0
- iOS 18.4
- Xcode 16.3
- Swift concurrency: async/await
- New `Observation` framework (`@Observable`)
- MVVM architecture

## 🚀 Example Usage

### Define `baseURL` and `apiVersion` in your main app

```swift
extension NetworkConfiguration {
    static var baseURL: URL? {
        URL(string: "https://api.example.com")
    }
    
    static var apiVersion: String? { "/v1" }
}
```

### 📦 Make `GET` request

```swift
struct UserRequest: Requestable {
    typealias Response = UserModel
    var urlPath: String = "https://api.example.com/users"
    var httpMethod: HTTPMethod = .get
}
```

```swift
@Observable
final class UserViewModel {
    var users: [UserModel]?
    
    func fetchUsers() async {
        do {
            let userRequest = UserRequest()
            users = try await userRequest.request()
        } catch {
            // Handle error
        }
    }
}
```

### 📦 Make `POST` request

```swift
struct LoginRequest: Requestable {
    typealias Response = LoginModel
    var urlPath: String = "https://api.example.com/login"
    var httpMethod: HTTPMethod = .post
    var requestBody: Codable? {
        LoginRequestBody(username: username, password: password)
    }
    
    let username: String
    let password: String
}

fileprivate struct LoginRequestBody: Codable {
    let username: String
    let password: String
}
```

```swift
@Observable
final class LoginViewModel {
    var token: String?
    @ObservationIgnored private var loginModel: LoginModel?
    
    func login(username: String, password: String) async {
        do {
            let loginRequest = LoginRequest(username: username, password: password)
            loginModel = try await loginRequest.request()
            if let token = loginModel?.token {
                self.token = token
            }
        } catch {
            // Handle error
        }
    }
}
```

### 📦 Add additional headers

```swift
struct UserRequest: Requestable {
    typealias Response = UserModel
    var urlPath: String = "https://api.example.com/users"
    var httpMethod: HTTPMethod = .get
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
}
```

### 📦 Add query parameters

```swift
struct UserRequest: Requestable {
    typealias Response = UserModel
    var urlPath: String = "https://api.example.com/users"
    var httpMethod: HTTPMethod = .get
    var queryParameters: [String : String]? {
        ["sort": "asc"]
    }
}
```
```swift
Output URL: https://api.example.com/users?sort=asc
```
