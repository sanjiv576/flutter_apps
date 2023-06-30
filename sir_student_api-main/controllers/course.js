const asyncHandler = require("../middleware/async");
const Course = require("../models/course");

// @desc    Get all courses
// @route   GET /api/v1/courses
// @access  Public

exports.getCourses = async (req, res, next) => {
  try {
    const courses = await Course.find();

    res.status(200).json({
      success: true,
      count: courses.length,
      data: courses,
    });
  } catch (err) {
    res.status(400).json({ success: false });
  }
};

// @desc    Get single course
// @route   GET /api/v1/courses/:id
// @access  Public

exports.getCourse = async (req, res, next) => {
  try {
    const course = await Course.findById(req.params.id);

    if (!course) {
      return res.status(401).json({ message: "cannot find the course with " });
    }

    res.status(200).json({ success: true, data: course });
  } catch (err) {
    next(err);
  }
};

// @desc    Create new course
// @route   POST /api/v1/courses
// @access  Private

exports.createCourse = async (req, res, next) => {
  try {
    const course = await Course.create(req.body);

    res.status(201).json({
      success: true,
      data: course,
    });
  } catch (err) {
    next(err);
  }
};

// @desc    Update course
// @route   PUT /api/v1/courses/:id
// @access  Private

exports.updateCourse = async (req, res, next) => {
  try {
    let course = await Course.findById(req.params.id);
    if (!course) {
      return res
        .status(404)
        .json({ message: "Course not found with id of ${req.params.id}" });
    }

    course = await Course.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    res.status(200).json({ success: true, data: course });
  } catch (err) {
    next(err);
  }
};

// @desc    Delete course
// @route   DELETE /api/v1/courses/:id
// @access  Private

exports.deleteCourse = async (req, res, next) => {
  // delete course by id
  await Course.findByIdAndDelete(req.params.id).then((course) => {
    if (!course) {
      return res
        .status(404)
        .json({ message: "Course not found with id of ${req.params.id}" });
    }
    res.status(200).json({ success: true, data: course });
  });
};
