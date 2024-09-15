import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Time "mo:base/Time";
import Bool "mo:base/Bool";


actor {


  // Unique time stamp
  public type Time = Time.Time;

  // Register datatype
  type Profile = {
    name : Text;
    email: Text;
    password : Text;
  };

  // Login datatype
  type Login = {
    email : Text;
    password : Text;
  };



  // check for access control
  stable var HasAccess = false;

  // Unique user identity 
  stable var AuthUser : Text = "";

  // Hashmap for users
  let Users : HashMap.HashMap<Text, Profile> = HashMap.HashMap<Text, Profile>(0, Text.equal, Text.hash);



  // User datatype
  type ActiveUser = {
    name : Text;
  };

  // points datatype
  public type PointType = Int;

  

  // Hashmap for points
  let Points : HashMap.HashMap<Text, PointType> = HashMap.HashMap<Text, PointType>(0, Text.equal, Text.hash);



  // Register new user
  public func registerUser(user : Profile) : async Text {
    
    // check if the user exist
    let _user = Users.get(user.email);

    switch(_user) {
      case(?_user) { 
        return "user already exist";
       };
      case(null) { 
        Users.put(user.email, user);
        return "created";
      };
    };

  };

  // Login user
  public func loginUser(user : Login) : async Text {
    
    // check if the user exist
    let _user = Users.get(user.email);

    switch(_user) {
      case(?_user) { 

        // check if the password is correct
        assert(_user.password == user.password);

        // grant the user access
        HasAccess := true;
        // login the user
        AuthUser := _user.email;

        return "user login";
       };
      case(null) { 
        return "invalid details";
      };
    };
  };



  public func putPoint(user : ActiveUser) : async Text {
    
    // check if the user exist
    let _user = Points.get(user.name);

    switch(_user) {
      case(?_user) { 

        let point = _user + 1;
        Points.put(user.name, point);
        return "point updated";
       };
      case(null) { 
        Points.put(user.name, 1);
        return "point added";
      };
    };
  };

  public func getPoint(user : ActiveUser) : async Int {
    
    // check if the user exist
    let _user = Points.get(user.name);

    switch(_user) {
      case(?_user) { 
        return _user;
       };
      case(null) { 
        return 0;
      };
    };
  };


  public func totalPoint() : async Int {
    
    // check if point exist
    let _points = Points.size();
    return _points;

  };  


  public func leaderBoard(user : ActiveUser) : async Int {
    
    // check if point exist
    let _points = Points.size();
    // check if the user exist
    let _user = Points.get(user.name);

    switch(_user) {
      case(?_user) { 
        return _user - _points;
       };
      case(null) { 
        return 0;
      };
    };
  };



};



