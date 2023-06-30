const mongoose = require("mongoose");

const courseSchema = new mongoose.Schema({
  courseName: {
    type: String,
    required: [true, "Please add a course name"],
    unique: true,
    trim: true,
    maxlength: [20, "Course name can not be more than 20 characters"],
  },
});

module.exports = mongoose.model("Course", courseSchema);
