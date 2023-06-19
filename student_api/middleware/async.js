// Try catch block will be handeled with this file

const asyncHandler = fn => (req,res,next)=>
    Promise.resolve(fn(req,res,next)).catch(next);

module.exports = asyncHandler;