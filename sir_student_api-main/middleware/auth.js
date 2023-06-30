//PROTECT THE MIDDLEWARE
const jwt = require("jsonwebtoken");
const asyncHandler = require("./async");
const User = require("../models/student");

//Protect routes
exports.protect = asyncHandler(async (req, res, next) => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith("Bearer")
  ) {
    // Set token from Bearer token in header
    token = req.headers.authorization.split(" ")[1];
  }

  //Set token from cookie, Check for getCurrentUser, if authentication is removed then also the route will work as the token is in cookie
  // else if(req.cookies.token){
  //     token = req.cookies.token;
  // }
  //
  //Make sure token exist
  if (!token) {
    // return next(new ErrorResponse('Not authorized to access this route', 401));
    return res
      .status(401)
      .json({ message: "Not authorized to access this route" });
  }

  try {
    //Verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    // console.log(decoded);
    req.user = await User.findById(decoded.id);
    next();
  } catch (err) {
    // return next(new ErrorResponse('Not authorized to access this route', 401));
    return res
      .status(401)
      .json({ message: "Not authorized to access this route" });
  }
});

// Grant access to specific roles , i.e publisher and admin

exports.authorize = (...roles) => {
  return (req, res, next) => {
    ///check if it is admin or publisher. user cannot access
    //  console.log(req.user.role);
    if (!roles.includes(req.user.role)) {
      // return next(new ErrorResponse(`User role ${req.user.roles} is not authorized to access this route`, 403));
      return res.status(403).json({
        message: `User role ${req.user.roles} is not authorized to access this route`,
      });
    }
    next();
  };
};
