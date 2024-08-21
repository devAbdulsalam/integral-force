// https://m7sm4-2iaaa-aaaab-qabra-cai.ic0.app/?tag=2725540637

import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Time "mo:base/Time";
import Bool "mo:base/Bool";



actor {


  public type Time = Time.Time;

  // Unique user identity 
  stable let UserEmail : Text = "";

  // Register datatype
  type Profile = {
    name : Text;
    email : Text;
    password : Text;
    // is_admin : Bool;
    // created_at : Time;
    // updated_at : Time;
  };

  // Login datatype
  type Login = {
    email : Text;
    password : Text;
  };

  // login user current details
  // public stable let LoginUser = Null;
  // = {
  //     name = "";
  //     email = "";
  //     password = "";
  // };

  // check for access control
  stable var HasAccess = false;

  // Hashmap for users
  let Users : HashMap.HashMap<Text, Profile> = HashMap.HashMap<Text, Profile>(0, Text.equal, Text.hash);


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

  public func loginUser(user : Login) : async Text {
    
    // check if the user exist
    let _user = Users.get(user.email);

    switch(_user) {
      case(?_user) { 

        // check if the password is correct
        assert(_user.password == user.password);

        // login the user
        // LoginUser := _user;

        // grant the user access
        HasAccess := true;

        return "user login";
       };
      case(null) { 
        return "invalid details";
      };
    };
  };


  stable var counter = 0;

  // Get the value of the counter.
  public query func get() : async Nat {
    return counter;
  };

  // Set the value of the counter.
  public func set(n : Nat) : async () {
    counter := n;
  };

  // Increment the value of the counter.
  public func inc() : async () {
    counter += 1;
  };

  
};

