import Foundation

class UserStore: ObservableObject {
    @Published var users: [User]
    
    init(users: [User] = []) {
        self.users = users
    }
    
    func updateUser(_ user: User) {
        if let index = users.firstIndex(where: { $0.id == user.id }) {
            users[index] = user
        }
    }
    
    // delete users
}
