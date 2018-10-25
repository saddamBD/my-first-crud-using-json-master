import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    let userController = UserController()
    router.get("users", use: userController.list)
    router.get("users", User.parameter, use: userController.listById)
    router.post("users", use: userController.create)
    router.patch("users", User.parameter, use: userController.update)
    router.delete("users", User.parameter, use: userController.delete)
    
    
    
    // my personal controller.
    
    
    let peopleController = PeopleController()
    router.get("people", use: peopleController.list)
    router.get("people",People.parameter, use: peopleController.listById)
    router.post("people", use: peopleController.create)
    router.patch("people", People.parameter, use: peopleController.update)
    router.delete("people",People.parameter, use: peopleController.delete)
    
    
    
    
    
}
