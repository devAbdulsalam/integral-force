// https://m7sm4-2iaaa-aaaab-qabra-cai.ic0.app/?tag=2725540637
// https://m7sm4-2iaaa-aaaab-qabra-cai.ic0.app/?tag=3412187116


  // Register datatype
  // type Profile = {
  //   name : Text;
  //   email : Text;
  //   password : Text;
  //   is_admin : Bool;
  //   created_at : Time;
  //   updated_at : Time;
  // };
// https://m7sm4-2iaaa-aaaab-qabra-cai.ic0.app/?tag=2725540637
// https://m7sm4-2iaaa-aaaab-qabra-cai.ic0.app/?tag=2725540637


import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Time "mo:base/Time";
import Bool "mo:base/Bool";



actor {


  //  Unique time stamp
  public type Time = Time.Time;

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

  // Reward datatype
  type RewardType = {
    scores : Int;
    tips : Int;
  };



  // check for access control
  stable var HasAccess = false;

  // Unique user identity 
  stable var AuthEmail : Text = "";

  stable var AuthUser = {
    var email = "";
    var role = "";
  };




  // Hashmap for users
  let Users : HashMap.HashMap<Text, Profile> = HashMap.HashMap<Text, Profile>(0, Text.equal, Text.hash);

  // Hashmap for Rewards
  let Rewards : HashMap.HashMap<Text, RewardType> = HashMap.HashMap<Text, RewardType>(0, Text.equal, Text.hash);

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


        // grant the user access
        HasAccess := true;
        // login the user
        AuthEmail := _user.email;
        AuthUser.email := _user.email;

        return "user login";
       };
      case(null) { 
        return "invalid details";
      };
    };
  };


  stable var counter = 0;

  // Get the value of the counter.
  public query func getReward() : async Text {
    
    let _user_rewards = Rewards.get(AuthUser.email);

    switch(_user_rewards) {
      case(?_user_rewards) { 
        return "user already exist";
       };
      case(null) { 
        return "reward not found";
      };
    };
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



